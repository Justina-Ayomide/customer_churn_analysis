**Customer Churn Analysis**

**Overview**
A data analysis project investigating customer churn patterns for a subscription-based business. The goal was to identify the key drivers of churn, quantify revenue at risk, and provide actionable recommendations to improve customer retention.

**Tools Used**
- **Excel** — Data cleaning, formatting, and preparation
- **MySQL** — Exploratory data analysis, segmentation, and business insight queries
- **Power BI** — interactive 3-page dashboard, DAX measures and weighted risk modelling

**Dataset**
- 15,000 customer records
- 21 features covering demographics, billing, behaviour, and satisfaction
- Synthetic dataset modelled on real SaaS customer behaviour patterns

**Process**
1. **Data Cleaning** — handled missing values, fixed data types, standardised categorical columns in Excel
2. **Database Setup** — imported cleaned dataset into MySQL, validated all 15,000 rows loaded correctly
3. **Exploratory Data Analysis** — profiled distributions, averages, and segment breakdowns
4. **Churn Segmentation** — identified highest risk customer groups across multiple dimensions
5. **Business Insight Queries** — quantified revenue impact and identified at-risk customers still active

**Key Findings**
**Metric Result**
1. Total customers analysed           - 15000
2. Overall churn rate                 - 31.9%
3. Total churned customers            - 4,783
4. Monthly revenue lost to churn      - $257,661
5. Estimated annual revenue lost      - $3.09 Million
6. Total lifetime revenue lost        - $3.3 Millon
7. Monthly revenue at risk            - $263K
8. Annual revenue at risk             - $3.2 Millon
9. New customer churn (0-6 months)    - 55%
10. Loyal customer churn (25+ months) - 23% 

 **Churn by Contract Type**
1.  Monthly                           -  47.7%
2.  Yearly                            -  19.7%

Monthly contract customers churn at nearly 3x the rate of yearly customers and stay 6.7 months less on average.

**Churn by Subscription Plan**
1. Basic                              -  35.7%
2. Standard                           -  32.6%
3. Premium                            -  20.3%

Premium customers are the most loyal with the highest average satisfaction score of 3.51.

**Churn by Satisfaction Score**
1. 1 star ⭐                          -  79.5%
2. 2 stars ⭐                         -  72.8%
3. 3 stars ⭐                         -  39.3% .
4. 4 stars ⭐                         -  7.9%
5. 5 stars ⭐                         -  5.9%

Customers scoring 1 or 2 churn at 70–80%. The jump from score 3 to score 4 is the critical threshold — churn drops from 39% to just 8%.

**Business Recommendations**
1. **Promote annual contracts** — monthly contract customers churn at 47.7% vs 19.7% for yearly. Converting them could recover significant revenue
2. **Intervene early on low satisfaction** — customers with scores of 1 and 2 at 70-80% represent the majority of churned customers. A proactive outreach programme targeting these customers could significantly reduce revenue loss
3. **Investigate Basic plan value** — Basic customers churn 15% points more than Premium. Review whether the plan offers sufficient value or whether pricing needs adjustment
4. **Flag dormant customers immediately** — customers inactive for 30+ days with satisfaction scores below 3 are at critical churn risk. These should be prioritised for immediate retention outreach.
5. **Focus on first 12 months** — new customers churn at 55%. Strong onboarding and 3-month check-ins could dramatically reduce early churn.

**Key DAX Measures Used in Power BI**
1. **Churn Rate:**
  ```dax
 Churn Rate =
   SUM(customer_behavior[Churn])/ COUNT(customer_behavior[Customer_Id]) * 100

2. **Revenue Lost to Churn**
```dax
Revenue Lost =
 CALCULATE(SUM(customer_behavior[Monthly_Charges]) , customer_behavior[Churn]=1)
**
3. ** Churn Risk Classification**
```dax
Churn Risk =
IF(customer_behavior[Satisfaction_Score]<=2 && customer_behavior[Last_Login_Days_Ago]>30, "High", IF(customer_behavior[Satisfaction_Score]=3 && customer_behavior[Last_Login_Days_Ago]>20, "Medium", "Low"))

4. **Weighted Revenue at Risk:**
```dax
Revenue at Risk =
SUMX(customer_behavior,customer_behavior[Monthly_Charges] * SWITCH(customer_behavior[Churn Risk],"Low",0.2, "Medium", 0.5, "High",0.9, 0))

5. **Annual Revenue at Risk:**
```dax
Annual Revenue at Risk = 
[Revenue at Risk] * 12

## Repository Structure
├── Customer_Churn_Analysis.sql    # All MySQL queries
├── Customer_Churn_Analysis.pbix   # Power BI dashboard
├── Customer_Churn_Analysis.pdf    # Dashboard PDF export
└── README.md                      # Project documentation

   
