USE BankingDB;
SHOW Tables;

-- cross join
SELECT * FROM Customers;
SELECT * FROM Transactions;

SELECT C.CustomerID, C.FirstName, C.Email, T.TransactionID, T.TransactionDate, T.Amount
FROM Customers as C join Transactions as T;

-- Identify Transactions Above the Average Transaction Amount
SELECT * FROM Transactions
WHERE Amount > 
(SELECT AVG(Amount) FROM Transactions);

-- Identify Accounts with Above-Average Balance
SELECT AccountID, AccountType, Balance, CustomerID
FROM Accounts
WHERE Balance > 
(SELECT AVG(Balance) FROM Accounts)
ORDER BY Balance DESC;

-- Identify Deposit Accounts Using a Multi-Row Subquery
SELECT AccountID, AccountType, Balance, CustomerID
FROM Accounts
WHERE AccountID IN 
(SELECT AccountID
FROM Transactions
WHERE TransactionType = 'Deposit');

-- Identify the Account with the Highest Balance
SELECT AccountID, AccountType, Balance, CustomerID
FROM Accounts
WHERE Balance = 
(SELECT  MAX(Balance) FROM Accounts);



