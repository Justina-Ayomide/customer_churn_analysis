CREATE DATABASE user_behaviour_analysis;

USE user_behaviour_analysis;

CREATE TABLE customer_behaviour (
customer_id VARCHAR (20) PRIMARY KEY,
signup_date VARCHAR (20),
tenure_months INT,
age INT,
gender VARCHAR (20),
region VARCHAR (50),
income_level  VARCHAR (50),
subscription_type VARCHAR (50),
monthly_charges DECIMAL (10,2),
total_charges  DECIMAL (10,2),
usage_frequency VARCHAR (50),
avg_session_duration_minutes DECIMAL (10,2),
number_of_logins_per_month  INT,
number_of_support_tickets  INT,
satisfaction_score INT,
payment_method  VARCHAR (50),
contract_type  VARCHAR (50),
last_login_days_ago INT,
promotional_response  VARCHAR (10),
discount_used VARCHAR (10),
churn TINYINT

);

SELECT signup_date
FROM customer_behaviour
LIMIT 5;  

SELECT DATABASE ();
SHOW TABLES;

SELECT COUNT(*) AS customer_Total_number
FROM customer_behaviour;

-- convert signup_date to date format
ALTER TABLE customer_behaviour
MODIFY COLUMN signup_date DATE;

DESCRIBE customer_behaviour;

USE user_behaviour_analysis;


-- overview customer churn analysis
SELECT
    COUNT(*)                                AS total_customers,
    SUM(churn)                              AS total_churned,
    COUNT(*) - SUM(churn)                   AS total_retained,
    ROUND(SUM(churn) / COUNT(*) * 100, 1)   AS churn_rate_pct,
    ROUND(AVG(monthly_charges), 2)          AS avg_monthly_charge,
    ROUND(AVG(tenure_months), 1)            AS avg_tenure_months,
    ROUND(AVG(satisfaction_score), 2)       AS avg_satisfaction_score
FROM customer_behaviour;

--  churn analysis by subscription_type
SELECT
    subscription_type,
    COUNT(*)                                AS total_customers,
    SUM(churn)                              AS churned,
    COUNT(*) - SUM(churn)                   AS retained,
    ROUND(SUM(churn) / COUNT(*) * 100, 1)   AS churn_rate_pct,
    ROUND(AVG(satisfaction_score), 2)       AS avg_satisfaction
FROM customer_behaviour
GROUP BY subscription_type
ORDER BY churn_rate_pct DESC;

-- churn analysis by contract_type

SELECT
    contract_type,
    COUNT(*)                                AS total_customers,
    SUM(churn)                              AS churned,
    COUNT(*) - SUM(churn)                   AS retained,
    ROUND(SUM(churn) / COUNT(*) * 100, 1)   AS churn_rate_pct,
    ROUND(AVG(tenure_months), 1)            AS avg_tenure_months
FROM customer_behaviour
GROUP BY contract_type
ORDER BY churn_rate_pct DESC;

-- churn analysis on satisfaction_type

SELECT
    satisfaction_score,
    COUNT(*)                                AS total_customers,
    SUM(churn)                              AS churned,
    ROUND(SUM(churn) / COUNT(*) * 100, 1)   AS churn_rate_pct
FROM customer_behaviour
GROUP BY satisfaction_score
ORDER BY satisfaction_score ASC;

-- Revenue impact analysis money loss due to churn

SELECT
    ROUND(SUM(monthly_charges), 2)          AS total_monthly_revenue,
    ROUND(SUM(CASE WHEN churn = 1 
        THEN monthly_charges ELSE 0 END), 2) AS revenue_lost_to_churn,
    ROUND(SUM(CASE WHEN churn = 1 
        THEN monthly_charges ELSE 0 END) 
        / SUM(monthly_charges) * 100, 1)     AS pct_revenue_at_risk
FROM customer_behaviour;

-- Analysis on High risk customer still active
SELECT
    customer_id,
    subscription_type,
    contract_type,
    satisfaction_score,
    last_login_days_ago,
    monthly_charges,
    number_of_support_tickets
FROM customer_behaviour
WHERE churn = 0
    AND satisfaction_score <= 2
    AND last_login_days_ago >= 30
    AND contract_type = 'Monthly'
ORDER BY monthly_charges DESC
LIMIT 10;