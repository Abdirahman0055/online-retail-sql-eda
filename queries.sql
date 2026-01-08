CREATE DATABASE sql_eda_clean;

USE sql_eda_clean;
CREATE TABLE online_retail (
    order_number VARCHAR(20),
    product_code VARCHAR(20),
    product_name VARCHAR(255),
    items_sold INT,
    order_date DATETIME,
    price_per_item DECIMAL(10,2),
    customer_id INT,
    customer_country VARCHAR(50)
);
SHOW TABLES;
DESCRIBE online_retail;

USE sql_eda_clean;

SELECT COUNT(*) FROM online_retail;

SELECT * FROM online_retail LIMIT 5;


-- EDA PROJECT: ONLINE RETAIL SALES


-- Q1: How many total transactions are in the dataset?
SELECT 
    COUNT(*) AS total_transactions
FROM online_retail;

-- Q2: How many unique orders are there?
SELECT 
    COUNT(DISTINCT order_number) AS total_orders
FROM online_retail;

-- Q3: What is the total revenue?
SELECT 
    SUM(items_sold * price_per_item) AS total_revenue
FROM online_retail;

-- Q4: What is the average revenue per order?
SELECT 
    AVG(order_revenue) AS average_order_value
FROM (
    SELECT 
        order_number,
        SUM(items_sold * price_per_item) AS order_revenue
    FROM online_retail
    GROUP BY order_number
) AS order_totals;

-- Q5: Which products generate the most total revenue?
SELECT 
    product_name,
    SUM(items_sold * price_per_item) AS total_revenue
FROM online_retail
GROUP BY product_name
ORDER BY total_revenue DESC
LIMIT 10;

-- Q6: Which products sell the highest quantity?
SELECT 
    product_name,
    SUM(items_sold) AS total_items_sold
FROM online_retail
GROUP BY product_name
ORDER BY total_items_sold DESC
LIMIT 10;

-- Q7: What is the total revenue by country?
SELECT 
    customer_country,
    SUM(items_sold * price_per_item) AS total_revenue
FROM online_retail
GROUP BY customer_country
ORDER BY total_revenue DESC;

-- Q8: Which customers generate the most revenue?
SELECT 
    customer_id,
    SUM(items_sold * price_per_item) AS total_revenue
FROM online_retail
GROUP BY customer_id
ORDER BY total_revenue DESC
LIMIT 10;

-- Q9: How many orders does each customer make?
SELECT 
    customer_id,
    COUNT(DISTINCT order_number) AS total_orders
FROM online_retail
GROUP BY customer_id
ORDER BY total_orders DESC;

-- Q10: Which customers are repeat customers (more than 1 order)?
SELECT 
    customer_id,
    COUNT(DISTINCT order_number) AS total_orders
FROM online_retail
GROUP BY customer_id
HAVING COUNT(DISTINCT order_number) > 1
ORDER BY total_orders DESC;

-- Q11: What is the monthly revenue trend?
SELECT 
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    SUM(items_sold * price_per_item) AS monthly_revenue
FROM online_retail
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY order_year, order_month;

-- Q12: Which months perform best in terms of revenue?
SELECT 
    MONTH(order_date) AS order_month,
    SUM(items_sold * price_per_item) AS total_revenue
FROM online_retail
GROUP BY MONTH(order_date)
ORDER BY total_revenue DESC;

-- Q13: What are the top 5 orders by revenue?
SELECT 
    order_number,
    SUM(items_sold * price_per_item) AS order_revenue
FROM online_retail
GROUP BY order_number
ORDER BY order_revenue DESC
LIMIT 5;




