-- ============================================
-- Project: HR Analytics with SQL
-- Author: Jayesh Sahu
-- Purpose: Create database and raw employee table
-- Date: Day 1 Practice
-- ============================================

-- Create database for HR analytics
CREATE DATABASE employee_analytics;

-- Select the database
USE employee_analytics;

-- Create table to store raw employee data
CREATE TABLE raw_employees (
	EmployeeID INT,
    First_Name VARCHAR(50),
    Surname VARCHAR(50),
	StreetAddress VARCHAR(150),
    City VARCHAR(50),
    State VARCHAR(50),
    StateFull VARCHAR(50),
    ZipCode VARCHAR(20),
    Country VARCHAR(50),
    CountryFull VARCHAR(50),
    Age INT,
    Office VARCHAR(50),
    Start_Date DATE,
    Termination_Date DATE,
    Office_Type VARCHAR(50),
    Department VARCHAR(100),
    Currency VARCHAR(10),
    Bonus_pct DECIMAL(5,2),
    Job_title VARCHAR(100),
    DOB DATE,
    level VARCHAR(50),
    Salary DECIMAL(12,2),
    Active_Status INT,
    Job_Profile VARCHAR(50),
    Notes TEXT);
    
-- 1. Check Total Records
SELECT count(*) FROM raw_employees;

-- 2. Show top 10 highest paid employees.
SELECT EmployeeID, First_Name, Surname, Salary FROM raw_employees
ORDER BY Salary DESC 
limit 10;

-- 3. Show average salary by department.
SELECT Department, AVG(Salary) FROM raw_employees
GROUP BY Department
ORDER BY avg(Salary) DESC
LIMIT 5;

-- 4. Find Top 3 cities with highest total salary payout.
SELECT City, sum(Salary) AS total_salary FROM raw_employees
GROUP BY City 
ORDER BY total_salary DESC
limit 3;

-- -----------------------------------------
-- 4. Clean Missing City Values
-- -----------------------------------------
-- SQl Safe off 
SET SQL_SAFE_UPDATES = 0;

-- update the empty city with unknown
UPDATE raw_employees
SET City = 'Unknown'
WHERE EmployeeID > 0 AND (City IS NULL OR City = '');

-- update the empty state with NA 
UPDATE raw_employees
set State = 'NA'
WHERE State IS NULL OR State = '';

-- update the empty statefull with NA 
UPDATE raw_employees 
SET Statefull = 'NA'
WHERE Statefull IS NULL OR Statefull = '';

-- SQL safe ON 
SET SQL_SAFE_UPDATES = 1;

-- Verify Data Cleaning
SELECT COUNT(*) FROM raw_employees
WHERE City is NULL or City = '' ;

SELECT count(*) FROM raw_employees
WHERE State IS NULL OR State = '' ;

SELECT count(*) FROM raw_employees
WHERE Statefull IS NULL OR Statefull = '' ;

-- -----------------------------------------
-- 5. Window functions with CTE
-- -----------------------------------------
-- 👉 Find highest-paid employee in each department (using Window Function)
WITH temp AS (
	SELECT EmployeeID, First_Name, Department, Salary, 
		ROW_NUMBER() OVER ( PARTITION BY Department 
			ORDER BY Salary DESC) AS rn
            FROM raw_employees) 
SELECT * FROM temp 
WHERE rn = 1 ;

-- 👉 Show each employee with department average salary.
SELECT EmployeeID, Department, Salary,
       AVG(Salary) OVER (PARTITION BY Department) AS dept_avg
FROM raw_employees;

-- 👉 Show employees whose salary is ABOVE their department average.
WITH Avg_dept AS (SELECT EmployeeID, Department, Salary,
       AVG(Salary) OVER (PARTITION BY Department) AS dept_avg
FROM raw_employees)
SELECT * FROM Avg_dept 
WHERE Salary >= dept_avg;

-- -----------------------------------------
-- 6. 💀 SQL Challenge Set (Advanced Level)
-- -----------------------------------------
-- 👉 For each department, find the 3rd highest salary.
SELECT EmployeeID, Department, Salary
    FROM (SELECT EmployeeID, Department, Salary,
		DENSE_RANK() OVER ( PARTITION BY Department ORDER BY Salary DESC) AS rn 
		FROM raw_employees) AS High_salary
        WHERE rn = 3;
        
-- 👉 Show month-wise hiring count using Start_Date.
SELECT 
    MONTH(Start_Date) AS Month_Hire, YEAR(Start_Date) AS year_hire,
    COUNT(EmployeeID) AS Total_emp
FROM
    raw_employees
GROUP BY Month_hire, year_hire
ORDER BY year_hire;

-- 👉 Find employees who earn more than their department average  
-- ❌ Without CTE
-- ❌ Without window function
SELECT EmployeeID, a.Salary, a.Department, avg_t.Dep_avg
FROM raw_employees a
join (SELECT Department, AVG(Salary) AS Dep_avg FROM raw_employees GROUP BY Department) as avg_t 
 on a.Department = avg_t.Department
WHERE a.Salary > avg_t.Dep_avg;

-- 👉 Find departments where salary gap between top 2 earners > 50000
WITH top_earners AS (SELECT Department, Salary, DENSE_RANK() OVER (PARTITION BY Department ORDER BY Salary DESC) AS rn,
 LAG(Salary) OVER (PARTITION BY Department ORDER BY Salary DESC) AS prev_salary
FROM raw_employees)
SELECT Department, Salary, rn, prev_salary,
       Salary - prev_salary AS gap
FROM top_earners
WHERE rn = 1;

