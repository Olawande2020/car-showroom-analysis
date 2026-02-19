# 🚗 Car Showroom Sales Analysis (SQL Project)

## 📌 Project Overview
This project analyzes sales performance and customer behavior for a car showroom using SQL.  
The objective is to extract meaningful business insights from transactional data and demonstrate practical SQL skills relevant to data analyst roles.

The analysis focuses on customer purchasing patterns, revenue contribution, and sales concentration across customers.

---

## 🎯 Objectives
- Analyze customer purchase frequency  
- Identify high-value and repeat customers  
- Understand revenue distribution among customers  
- Demonstrate SQL proficiency using real-world business questions  

---

## 🛠 Tools & Technologies
- **SQL** – data querying and analysis  
- **CSV datasets** – Cars, Customers, Sales  
- **GitHub** – version control and portfolio presentation  

---

## 📂 Dataset Description
The project uses three datasets:

### 1. Customers
Contains customer demographic information.
- `customer_id`
- `name`
- `gender`
- `city`
- `Phone`
- `email`
- `age`

### 2. Cars
Contains information about cars available in the showroom.
- `car_id`
- `brand`
- `model`
- `colour`
- `Engine_Type`
- `Transmission`
- `Price`
- `Quantity in Stock`
- `Status`

### 3. Sales
Contains transaction-level sales data.
- `sale_id`
- `customer_id`
- `car_id`
- `quantity`
- `total_amount`
- `sale_price`
- `Payment Method`
---

## ❓ Key Business Questions Answered
- How many purchases does each customer make?
- Who are the top customers by total spending?
- How is purchase frequency distributed across customers?
- What percentage of revenue comes from repeat customers?
- Which customers contribute the most to overall sales revenue?

---

## 📊 Key Insights
- Customer purchase frequency ranges from **2 to 10 purchases**
- A small number of customers contribute a **disproportionate share of total revenue**
- Most customers fall into the **low to mid purchase frequency range**, indicating growth potential

---

## 💡 Recommendations
- Focus retention strategies on **high-value customers**
- Introduce loyalty programs for **repeat buyers**
- Target mid-frequency customers with personalized promotions
- Track customer lifetime value (CLV) to guide marketing decisions

---

## 🧠 SQL Skills Demonstrated
- `JOIN` operations across multiple tables  
- Aggregations using `SUM`, `COUNT`, and `AVG`  
- Subqueries and derived tables  
- Window functions (`RANK() OVER`)  
- Business-oriented analytical thinking  

---

## 📁 Repository Structure
├── data/
│ ├── Cars.csv
│ ├── Customers.csv
│ └── Sales.csv
│
├── sql/
│ ├── basic_queries.sql
│ ├── intermediate_queries.sql
│ └── advanced_queries.sql
│
└── README.md

## ## 👤 Author
**Olawande Eunice**  
Aspiring Data Analyst | SQL | Data Analysis  
