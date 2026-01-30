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