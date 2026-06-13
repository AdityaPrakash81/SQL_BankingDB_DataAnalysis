create database dummy_db; -- creating dummy database

show databases; -- showing database in server

use dummy_db; -- using databse

CREATE TABLE employees (
emp_id INT PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
age INT CHECK (age >= 18),
salary DECIMAL(10, 2) NOT NULL,
city VARCHAR(50) DEFAULT 'Mumbai'
);

 
 -- Renaming the Table
 ALTER TABLE  employees rename to Staff;
 describe Staff; -- to describe the table structure  
 
 ALTER TABLE Staff rename to employees;
 describe employees;
 
 -- Add column
 ALTER TABLE employees add column PhoneNo INT;
 describe employees;
 ALTER TABLE employees add column EmailID VARCHAR(50);
 describe employees;
 
 -- Change column
 ALTER TABLE employees 
 change PhoneNo ContactNo INT NOT NULL;
 describe employees;

-- Modify column
ALTER TABLE employees
modify EmailID VARCHAR(40) unique;

-- drop column EmailID
ALTER TABLE employees drop column EmailID;
describe employees;


-- Shiffting towards BankingDB
Use BankingDB;
show tables;

-- Add Column
ALTER TABLE Customers
Add DateofBirth DATE;
describe Customers;

-- modify column Customers
ALTER TABLE Customers
Modify Phone VARCHAR(20);
describe Customers;

-- Modify column Accounts
ALTER TABLE Accounts
Modify Balance DECIMAL(10, 2)
CHECK (Balance >= 1000);