# Employee Analytics Project (SQL)

## 📖 Project Overview

This project focuses on practicing SQL from beginner to advanced level
using a real-world HR dataset.

The main objective is to learn:

- Data cleaning
- Data analysis
- Aggregation
- Reporting
- Safe update handling

---

## 📂 Dataset

Source: Kaggle HR Analytics Dataset

Contains employee information such as:

- Personal details
- Salary
- Department
- Location
- Job profile
- Employment dates

---

## 🛠️ Tools Used

- MySQL
- MySQL Workbench
- Excel (Data Cleaning)
- GitHub

---

## ✅ Work Completed (Till Now)

### 1. Database Setup

- Created database: `employee_analytics`
- Created table: `raw_employees`
- Imported cleaned CSV data

### 2. Data Cleaning

- Identified missing values in:
  - City
  - State
  - StateFull
- Updated missing values using SQL
- Handled MySQL Safe Update Mode

### 3. Data Validation

- Verified cleaning using COUNT queries
- Ensured no NULL or empty values remain

### 4. Analysis Queries

- Top paid employees
- Average salary by department
- Total salary by city
- Employee count

---

## ⚠️ Challenges Faced

- Date format issues during import
- MySQL Safe Update Mode error
- Empty values in multiple columns
- Git commit user configuration issue

All issues were resolved through debugging and research.

---

## 🚀 Learning Outcome

Through this project, I learned:

- Real-world data cleaning in SQL
- Safe update practices
- Query documentation
- GitHub project management
- Professional SQL workflow

---

## 📈 Next Steps

- Create cleaned views
- Advanced analytics
- Window functions
- CTE-based reporting
- Performance analysis

---

## 🧠 Advanced Analytics (Recent Work)

- Implemented Window Functions:

  - ROW_NUMBER(), RANK(), DENSE_RANK()
  - Department-wise salary ranking
  - Top N employees per department

- Used CTEs (WITH clause) for:

  - Multi-step analytical queries
  - Improving query readability
  - Filtering window function results

- Practiced Subqueries and Joins for:

  - Comparing employee salary with department average
  - Rewriting window function logic using joins
  - Understanding different query approaches

- Built Analytical Reports:

  - Employees earning above department average
  - Year-wise and month-wise hiring trends
  - Salary distribution analysis

- Improved SQL Debugging Skills:
  - Resolved ambiguous column errors
  - Fixed aliasing and grouping issues
  - Handled derived table errors
