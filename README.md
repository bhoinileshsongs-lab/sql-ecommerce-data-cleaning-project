# 🧹 SQL Data Cleaning Project – E-commerce Dataset

## 📌 Project Overview
This project focuses on cleaning and standardizing a messy e-commerce dataset using **SQL (T-SQL)**.  
The objective is to convert raw, inconsistent data into a **clean, structured, and analysis-ready dataset** by applying real-world business logic.

This project reflects **freelancing-level data cleaning practices** commonly used before dashboarding or reporting.

---

## 🎯 Objectives
- Remove duplicate records using SQL window functions  
- Standardize inconsistent text values  
- Clean and format date columns  
- Handle NULL values using logical business rules  
- Convert data types and fix numeric inconsistencies  
- Prepare a dataset ready for analysis and visualization  

---

## 🗂️ Project Structure

sql-ecommerce-data-cleaning-project/
│
├── sql_queries/
│   └── cleaning_and_null_handling.sql
│
├── data/
│   ├── ecommerce_data_messy.csv
│   └── ecommerce_data_cleaned.csv
│
├── screenshots/
│   ├── sql_cleaning_queries.png
│   └── sql_null_handling_queries.png
│
└── README.md

---

## ⚙️ Tools & Skills Used
- SQL Server (T-SQL)  
- Data Cleaning & Transformation  
- Window Functions (ROW_NUMBER)  
- CASE Statements  
- String Functions (TRIM, UPPER, LOWER, SUBSTRING)  
- NULL Handling with Business Logic  

---

## 🧼 Data Cleaning Steps

### 1️⃣ Removing Duplicate Orders
Duplicate `order_id` values were handled using a **CTE with ROW_NUMBER()**, keeping only the latest record based on order date.

---

### 2️⃣ Date Standardization
Multiple date formats were converted into a single standard format (`dd-MM-yyyy`) using:
- TRY_CAST  
- TRY_CONVERT  
- FORMAT  

---

### 3️⃣ Text Standardization
The following columns were standardized:
- `customer_name`
- `city`
- `product_category`
- `order_status`

Examples:
- `DELHI`, `delhi`, `new delhi` → **Delhi**
- `delivere`, `deli` → **Delivered**

---

### 4️⃣ Handling Negative & Invalid Values
- Negative quantity values were corrected
- Price values were converted into numeric format and rounded

---

### 5️⃣ NULL Handling Using Business Logic
Instead of directly replacing NULLs, logical conditions were applied:

- `customer_name` → **Guest** (only if order is Delivered)
- `product_category` → **Other**
- `city` → **not specified**
- Quantity logic:
  - Delivered → `1`
  - Cancelled → `0`

---

### 6️⃣ Price Cleaning
- NULL prices were filled using **average price logic**
- Remaining NULL prices were replaced with `0`

---

### 7️⃣ Data Validation
Rows were deleted where critical columns were NULL:
- `order_id`
- `order_date`

---

## 📊 Before vs After Cleaning

| Feature | Before Cleaning | After Cleaning |
|------|----------------|---------------|
| Date Format | Mixed | Standardized |
| Text Consistency | Inconsistent | Proper Case |
| NULL Handling | Random | Logic-Based |
| Duplicate Records | Present | Removed |
| Analysis Ready | ❌ | ✅ |

---

## 📸 SQL Execution Screenshots
Screenshots of executed SQL queries are available inside the **screenshots** folder for reference.

---

## 🚀 How to Use
1. Import `ecommerce_data_messy.csv` into SQL Server  
2. Run `cleaning_queries.sql`  
3. Export the cleaned data  
4. Use it for analysis or Power BI dashboarding  

---

## 💡 Key Learnings
- Writing production-style SQL cleaning scripts  
- Applying business logic during data preparation  
- Handling real-world messy datasets  
- Preparing datasets suitable for analytics and freelancing projects  

---

## 👨‍💻 Author
**SQL Data Cleaning Practice Project**  
Created as part of a Data Analyst learning and freelancing journey.

⭐ If you found this project useful, feel free to fork or star the repository!
