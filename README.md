# Task 6: Sales Trend Analysis Using Aggregations

## Internship: Data Analyst – Elevate Labs

### Objective:
Analyze monthly revenue and order volume from the online_sales dataset using SQL aggregations.

---

## Dataset:
*File:* online_sales_dataset.csv  
*Table Name:* online_sales

*Columns:*
- order_id (INT)
- order_date (DATE)
- product_id (INT)
- amount (DECIMAL)

---

## Tools Used:
- MYSQL 

## Tasks Completed:

### Step 1: Load Dataset
Created the online_sales table and imported the dataset.

### Step 2: Monthly Revenue and Order Volume
Grouped orders by year and month to calculate:
- SUM(amount) for monthly revenue
- COUNT(DISTINCT order_id) for monthly order volume

### Step 3: Top 3 Months by Revenue
Fetched the top 3 months with the highest revenue.

### Step 4: Top 3 Months by Order Volume
Fetched the top 3 months with the most orders.

### Step 5: Recent Year Trend Analysis
Analyzed monthly revenue and volume for the latest year in the dataset.

---

## Output:
All SQL queries are included in sales_trend_analysis.sql file.  
You can run them in PostgreSQL / MySQL / SQLite with minor adjustments.
