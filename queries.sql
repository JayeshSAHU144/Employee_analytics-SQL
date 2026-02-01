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







