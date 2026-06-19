USE BankingDB;
SHOW Tables;

-- Add Column CustomerId into Transactions Table
ALTER TABLE Transactions ADD COLUMN CustomerID int;

-- Customers == Transactions with foreign key
ALTER TABLE Transactions
ADD FOREIGN KEY (CustomerID)  REFERENCES Customers(CustomerID);

-- update transactionsid with customerid
UPDATE Transactions
SET CustomerID = 101
WHERE TransactionID IN (301, 302, 305, 309);

UPDATE Transactions
SET CustomerID = 102
WHERE TransactionID IN (303, 304, 310);

UPDATE Transactions
SET CustomerID = 106
WHERE TransactionID = 306;

UPDATE Transactions
SET CustomerID = 107
WHERE TransactionID = 307;

UPDATE Transactions
SET CustomerID = 108
WHERE TransactionID = 308;

SELECT * FROM Transactions;



-- Task 1: Generate Customer Transaction Reports
-- Customer:-ID, FirstName
-- Transactions:- ID, Type, Amount
-- Inner Join(EQUI)

SELECT C.CustomerID, C.FirstName, T.TransactionID, T.TransactionType, T.Amount
FROM Customers AS C INNER JOIN Transactions AS T
ON C.CustomerID = T.CustomerID;

-- Filterout deposit and withdrawal
SELECT C.CustomerID, C.FirstName, T.TransactionID, T.TransactionType, T.Amount
FROM Customers AS C INNER JOIN Transactions AS T
ON C.CustomerID = T.CustomerID
WHERE TransactionType IN ('Deposit', 'Withdrawal');

USE BankingDB;

-- Task 2: Identify All Customers Including Those Without Transactions

-- (LEFT JOIN)
SELECT C.CustomerID,
CONCAT(C.FirstName, ' ', C.LastName) AS CustomerName,
T.TransactionID,
T.TransactionType,
T.Amount
FROM Customers C
LEFT  JOIN Transactions T
on C.CustomerID = T.CustomerID;

-- (RIGHT JOIN)
-- update 310 transactionid with customerid= null so it will be displayed in right join

UPDATE Transactions 
SET CustomerID = Null
WHERE TransactionID = 310;

SELECT C.CustomerID,
CONCAT(C.FirstName, ' ', C.LastName) AS CustomerName,
T.TransactionID,
T.TransactionType,
T.Amount
FROM Customers C
RIGHT  JOIN Transactions T
on C.CustomerID = T.CustomerID;

--  Generate Deposit Transactions Above ₹5000
SELECT C.CustomerID,
CONCAT(C.FirstName, ' ', C.LastName) AS CustomerName,
T.TransactionID,
T.TransactionType,
T.Amount
FROM Customers C
INNER JOIN Transactions T
ON C.CustomerID = T.CustomerID
WHERE T.TransactionType = 'Deposit'
AND T.Amount > 5000;