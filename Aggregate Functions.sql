USE BankingDB;
Show tables;

SELECT * FROM Accounts;

-- total balance maintained across all customer accounts
SELECT SUM(Balance) AS Toatl_Balance FROM Accounts;

-- average balance maintained across all customer accounts 
SELECT AVG(Balance) AS Avg_Balance FROM Accounts;

-- highest balance maintained in any customer account
SELECT MAX(Balance) AS Highest_Balance FROM Accounts;

-- lowest balance maintained in any customer account
SELECT MIN(Balance) AS Lowest_Balance FROM Accounts;

-- total number of customer accounts available in the system
SELECT COUNT(*) AS Total_Accounts FROM Accounts;

-- total account balance for each AccountType by grouping
SELECT AccountType, SUM(Balance) as Total_Balance 
FROM Accounts
GROUP BY AccountType
ORDER BY Total_Balance ASC;

SELECT TransactionType , Sum(Amount) as Total_Amount
From Transactions
Group BY TransactionType;

-- GroupBy + HAVING 
SELECT AccountType, SUM(Balance) AS Total_Balance
FROM Accounts
GROUP BY AccountType
HAVING SUM(Balance) > 25000;
-- or 
SELECT AccountType, SUM(Balance) AS Total_Balance
FROM Accounts
GROUP BY AccountType
HAVING Total_Balance  > 25000;

SELECT AccountType, SUM(Balance) AS Total_Balance
FROM Accounts
GROUP BY AccountType
HAVING AccountType IN ("Savings", "Current");
-- or
SELECT AccountType, SUM(Balance) AS Total_Balance
FROM Accounts
GROUP BY AccountType
HAVING AccountType = "Savings" or  AccountType = "Current";
-- or 
SELECT AccountType, SUM(Balance) AS Total_Balance
FROM Accounts
GROUP BY AccountType
limit 2;



