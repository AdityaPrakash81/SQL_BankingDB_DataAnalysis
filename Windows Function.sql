USE BankingDB;

-- Inserting records into Loans
INSERT INTO Loans
(LoanID, LoanAmount, InterestRate, StartDate, EndDate, CustomerID)
VALUES
(301, 500000, 8.50, '2025-01-15', '2030-01-15', 101),
(302, 300000, 9.25, '2025-02-10', '2028-02-10', 102),
(303, 750000, 8.75, '2025-03-20', '2032-03-20', 103),
(304, 250000, 10.00, '2025-04-05', '2029-04-05', 104),
(305, 1000000, 7.95, '2025-05-12', '2035-05-12', 105);

SELECT * FROM Loans;

-- Rank Customer Loans Using RANK()
SELECT LoanID, CustomerID, LoanAmount,
RANK() 
OVER(ORDER BY LoanAmount DESC)AS LoanRank
FROM Loans;

-- Rank Customer Loans Using DENSE_RANK()
SELECT LoanID, CustomerID, LoanAmount,
DENSE_RANK() 
OVER( ORDER BY LoanAmount DESC) AS DenseRank
FROM Loans;

-- Assign Row Numbers Using ROW_NUMBER()
SELECT LoanID, CustomerID, LoanAmount,
ROW_NUMBER() 
OVER( ORDER BY LoanAmount DESC) AS RowNumber
FROM Loans;

-- Understanding PARTITION BY
SELECT LoanID, CustomerID, LoanAmount,
ROW_NUMBER() 
OVER(PARTITION BY CustomerID 
ORDER BY LoanAmount DESC) AS RowNum
FROM Loans;

-- Calculate Running Total Using SUM() OVER()
SELECT LoanID, CustomerID, LoanAmount,
SUM(LoanAmount)
OVER( ORDER BY LoanAmount DESC) AS RunningTotal
FROM Loans;

-- Compare Previous Loan Records Using LAG()
SELECT LoanID, CustomerID, LoanAmount,
LAG (LoanAmount)
OVER( ORDER BY LoanAmount DESC) AS PreviousLoanAmount
FROM Loans;

-- Compare Next Loan Records Using LEAD()
SELECT LoanID, CustomerID, LoanAmount,
LEAD (LoanAmount)
OVER (ORDER BY LoanAmount DESC) AS NextLoanAmount
FROM Loans;

