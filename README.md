#  Online Retail Sales – SQL Exploratory Data Analysis (EDA)

##  Project Overview
This project focuses on exploring online retail sales data using **SQL**.  
The goal is to understand sales performance, products, customers, and time trends by answering clear business questions.

I used **Python for light data cleaning** and **MySQL for exploratory data analysis (EDA)**.

---

## Tools Used
- Python (pandas) – light data cleaning
- MySQL – SQL analysis

---

## 🗂 Dataset Description
The dataset contains online retail transactions.  
Each row represents a product sold in an order.

Main columns:
- `order_number` – Order ID  
- `product_code` – Product identifier  
- `product_name` – Product name  
- `items_sold` – Quantity sold  
- `order_date` – Date of the order  
- `price_per_item` – Price per unit  
- `customer_id` – Customer identifier  
- `customer_country` – Customer country  

---

##  Data Preparation (Python)
Before loading the data into MySQL, I performed light cleaning in Python:
- Renamed columns to clear business-friendly names
- Removed rows with missing customer IDs
- Removed negative or zero quantities and prices
- Converted order dates to datetime format


---

## 🗄 Database Setup
- Created a new MySQL schema
- Created a table matching the cleaned dataset
- Imported the cleaned CSV file into MySQL

---

##  SQL EDA Questions Answered

The analysis answers the following questions using basic SQL queries:

**Q1:** How many total transactions are in the dataset?  
**Q2:** How many unique orders are there?  
**Q3:** What is the total revenue?  
**Q4:** What is the average revenue per order?  
**Q5:** Which products generate the most total revenue?  
**Q6:** Which products sell the highest quantity?  
**Q7:** What is the total revenue by country?  
**Q8:** Which customers generate the most revenue?  
**Q9:** How many orders does each customer make?  
**Q10:** Which customers are repeat customers (more than one order)?  
**Q11:** What is the monthly revenue trend?  
**Q12:** Which months perform best in terms of revenue?  
**Q13:** What are the top 5 orders by revenue?


---

##  Key Insights (Summary)
- A small number of products generate most of the revenue
- Some customers place multiple orders and contribute higher revenue
- Revenue is concentrated in a limited time period after cleaning
- SQL aggregation helps identify top products, customers, and trends



