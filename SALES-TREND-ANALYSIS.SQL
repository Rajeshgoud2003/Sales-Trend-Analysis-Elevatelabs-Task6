 ## SALES-TREND-ANALYSIS.SQL ##

-- Step 1: Create the table
CREATE TABLE online_sales (
    order_id INT,
    order_date DATE,
    product_id INT,
    amount DECIMAL(10, 2)
);

-- Step 2: Monthly Revenue and Order Volume
SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS monthly_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM
    online_sales
GROUP BY
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY
    year, month;

-- Step 3: Top 3 Months by Revenue
SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS monthly_revenue
FROM
    online_sales
GROUP BY
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY
    monthly_revenue DESC
LIMIT 3;

-- Step 4: Top 3 Months by Order Volume
SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    COUNT(DISTINCT order_id) AS order_volume
FROM
    online_sales
GROUP BY
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY
    order_volume DESC
LIMIT 3;

-- Step 5: Monthly Revenue and Order Volume for the Most Recent Year
WITH latest_year AS (
    SELECT MAX(EXTRACT(YEAR FROM order_date)) AS year
    FROM online_sales
)
SELECT
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS monthly_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM
    online_sales
WHERE
    EXTRACT(YEAR FROM order_date) = (SELECT year FROM latest_year)
GROUP BY
    EXTRACT(MONTH FROM order_date)
ORDER BY
    month;
