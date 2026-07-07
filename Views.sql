-- Create a View for High-Balance Accounts
CREATE VIEW High_Balance_Accounts AS
SELECT AccountID, AccountType, Balance, CustomerID
FROM Accounts
WHERE Balance > 30000;

-- Retrieve Data Using the View
SELECT *
FROM High_Balance_Accounts;

-- Modify the View to Include Transaction Details
CREATE OR REPLACE VIEW High_Balance_Accounts AS
SELECT
    a.AccountID, a.AccountType, a.Balance, a.CustomerID,
    t.TransactionID,
    t.TransactionDate,
    t.TransactionType,
    t.Amount
FROM Accounts a
INNER JOIN Transactions t
ON a.AccountID = t.AccountID
WHERE a.Balance > 30000;
