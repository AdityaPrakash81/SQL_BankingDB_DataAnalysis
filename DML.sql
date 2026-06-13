show databases;
use dummy_db;

show tables;
describe employees;

INSERT INTO  employees ( emp_id, first_name, last_name, age, salary, city, ContactNo)
VALUES (1, 'Rahul', 'Sharma', 20, 45000, 'Mumbai', 9928733687);

ALTER table employees MODIFY COLUMN ContactNo VARCHAR(20);

SELECT * FROM employees; -- to show the data inside the table

INSERT INTO employees (emp_id, first_name,  last_name, age, salary, city, ContactNo)
VALUES (2, 'Rakesh', 'Patil', 24, 65000, 'Pune', 7678988326);
SELECT * FROM employees;

SET SQL_SAFE_UPDATES = 0; -- turn off safe mode

-- updating the Rows
UPDATE employees
SET  city = 'Mumbai';

-- deleting the Rows
DELETE from employees
WHERE  emp_id = 2;


-- Switching to  BankingDB
 USE BankingDB;
 
-- Inserting values in the table 
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, AccountCreationDate, DateofBirth)
VALUES (102, 'Priya', 'Patil', 'priya@gmail.com', '9979364774', '2025-07-09', '2003-03-10');
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, AccountCreationDate, DateofBirth)
VALUES (101, 'Rahul', 'Sharma', 'rahulsharma@gmail.com', '9938477574', '2025-06-23', '2002-04-05');

INSERT INTO Accounts(AccountID, CustomerID, AccountType, Balance)
VALUES(201, 101, 'Savings', 25000), 	
(202, 102, 'Current', 40000);

INSERT INTO Transactions (TransactionID, AccountID, TransactionDate, Amount, TransactionType)
VALUES (1, 201, '2025-07-10', 5000.00, 'Credit'),
(2, 202, '2025-07-11', 10000.00, 'Debit');

SELECT * from Customers;
SELECT * from Accounts;
SELECT * from Transactions;

-- Updating the values in a Table
UPDATE Customers
SET Phone = '9999999999'
WHERE CustomerID = 102;
SELECT * FROM Customers
WHERE CustomerID = 102;

UPDATE Customers
SET Email = 'priya.patil@gmail.com'
WHERE CustomerID = 102;
SELECT * FROM Customers
WHERE CustomerID = 102;

UPDATE Transactions
SET TransactionID = 301
WHERE AccountID = 201;
UPDATE Transactions
SET TransactionID = 302
WHERE AccountID = 202;


-- Deleting records from a Table

DELETE FROM Transactions
WHERE TransactionID = 302;
SELECT * FROM Transactions;

DELETE FROM Accounts
WHERE AccountID = 202;
SELECT * FROM Accounts;


