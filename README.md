**Customer Churn Analysis**

**Overview**
A data analysis project investigating customer churn patterns for a subscription-based business. The goal was to identify the key drivers of churn, quantify revenue at risk, and provide actionable recommendations to improve customer retention.

**Tools Used**
- **Excel** — Data cleaning, formatting, and preparation
- **MySQL** — Exploratory data analysis, segmentation, and business insight queries

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
2. Overall churn rate                 -  31.9%
3. Total churned customers            -  4,783
4. Monthly revenue lost to churn      - $257,661
5. Estimated annual revenue at risk   - $3.09 million

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
1. **Promote annual contracts** — incentivise monthly customers to switch with discounts or added benefits. This single change could reduce churn by up to 28 percentage points for that segment
2. **Intervene early on low satisfaction** — customers with scores of 1 and 2 represent the majority of churned customers. A proactive outreach programme targeting these customers could significantly reduce revenue loss
3. **Investigate Basic plan value** — Basic customers churn 15% more than Premium. Review whether the plan offers sufficient value or whether pricing needs adjustment
4. **Flag dormant customers immediately** — customers inactive for 30+ days with satisfaction scores below 3 are at critical churn risk. These should be prioritised for immediate retention outreach.
