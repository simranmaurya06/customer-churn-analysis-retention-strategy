/*
Customer Churn & Retention Analysis

Author: Simran Mourya

Description:
SQL queries used for customer churn analysis and business insights.
*/

/*
Customer Churn & Retention Analysis

Author: Simran Maurya

Description:
SQL queries used for exploratory data analysis and customer churn investigation.
*/

-- =========================================
-- DATA QUALITY CHECKS
-- =========================================

-- Total Records
SELECT COUNT(*)
FROM telco_customers;

-- Duplicate Customer Check
SELECT customerID,
COUNT(*) AS cnt
FROM telco_customers
GROUP BY customerID
HAVING COUNT(*) > 1;

-- Missing Total Charges Check
SELECT *
FROM telco_customers
WHERE TotalCharges = '';

-- =========================================
-- CUSTOMER CHURN OVERVIEW
-- =========================================

SELECT Churn,
COUNT(*) AS Customers
FROM telco_customers
GROUP BY Churn;

-- =========================================
-- CONTRACT ANALYSIS
-- =========================================

SELECT Contract,
COUNT(*) AS Customers
FROM telco_customers
GROUP BY Contract;

SELECT
    Contract,
    Churn,
    COUNT(*) AS Customers
FROM telco_customers
GROUP BY Contract, Churn
ORDER BY Contract;

-- =========================================
-- INTERNET SERVICE ANALYSIS
-- =========================================

SELECT InternetService,
COUNT(*) AS Customers
FROM telco_customers
GROUP BY InternetService;

SELECT
    InternetService,
    Churn,
    COUNT(*) AS Customers
FROM telco_customers
GROUP BY InternetService, Churn
ORDER BY InternetService;

-- =========================================
-- PAYMENT METHOD ANALYSIS
-- =========================================

SELECT
    PaymentMethod,
    Churn,
    COUNT(*) AS Customers
FROM telco_customers
GROUP BY PaymentMethod, Churn
ORDER BY Customers DESC;

-- =========================================
-- CUSTOMER BEHAVIOR ANALYSIS
-- =========================================

SELECT
    Churn,
    ROUND(AVG(MonthlyCharges),2) AS Avg_Monthly_Charges
FROM telco_customers
GROUP BY Churn;

SELECT
    Churn,
    ROUND(AVG(tenure),2) AS Avg_Tenure
FROM telco_customers
GROUP BY Churn;

-- =========================================
-- SERVICE ANALYSIS
-- =========================================

SELECT TechSupport,
       Churn,
       COUNT(*) AS Customers
FROM telco_customers
GROUP BY TechSupport, Churn;

SELECT OnlineSecurity,
       Churn,
       COUNT(*) AS Customers
FROM telco_customers
GROUP BY OnlineSecurity, Churn;

SELECT PaperlessBilling,
       Churn,
       COUNT(*) AS Customers
FROM telco_customers
GROUP BY PaperlessBilling, Churn;

-- =========================================
-- HIGH-RISK CUSTOMER SEGMENTS
-- =========================================

SELECT Contract,
       InternetService,
       PaymentMethod,
       COUNT(*) AS Churned_Customers
FROM telco_customers
WHERE Churn = 'Yes'
GROUP BY Contract,
         InternetService,
         PaymentMethod
ORDER BY Churned_Customers DESC
LIMIT 10;