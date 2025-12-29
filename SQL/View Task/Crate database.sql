create database Banking_System

CREATE TABLE Customer ( 
CustomerID INT PRIMARY KEY, 
FullName NVARCHAR(100), 
Email NVARCHAR(100), 
Phone NVARCHAR(15), 
SSN CHAR(9) 
); 
CREATE TABLE Account ( 
    AccountID INT PRIMARY KEY, 
    CustomerID INT FOREIGN KEY REFERENCES Customer(CustomerID), 
    Balance DECIMAL(10, 2), 
    AccountType VARCHAR(50), 
    Status VARCHAR(20) 
); 
 
CREATE TABLE Transactions ( 
    TransactionID INT PRIMARY KEY, 
    AccountID INT FOREIGN KEY REFERENCES Account(AccountID), 
    Amount DECIMAL(10, 2), 
    Type VARCHAR(10), -- Deposit, Withdraw 
    TransactionDate DATETIME 
); 
 
CREATE TABLE Loan ( 
    LoanID INT PRIMARY KEY, 
    CustomerID INT FOREIGN KEY REFERENCES Customer(CustomerID), 
    LoanAmount DECIMAL(12, 2), 
    LoanType VARCHAR(50), 
    Status VARCHAR(20) 
); 
 
 --1️⃣ Insert into Customer

 INSERT INTO Customer (CustomerID, FullName, Email, Phone, SSN)
VALUES
(1, 'Ahmed Al Rashid', 'ahmed@gmail.com', '96891234567', '123456789'),
(2, 'Fatima Al Zadjali', 'fatima@gmail.com', '96892345678', '987654321'),
(3, 'Salim Al Harthy', 'salim@gmail.com', '96893456789', '456789123');

--2️⃣ Insert into Account
INSERT INTO Account (AccountID, CustomerID, Balance, AccountType, Status)
VALUES
(101, 1, 5000.00, 'Savings', 'Active'),
(102, 1, 2500.00, 'Checking', 'Active'),
(103, 2, 10000.00, 'Savings', 'Active'),
(104, 3, 1500.00, 'Checking', 'Inactive');

--3️⃣ Insert into Transaction

INSERT INTO [Transactions] (TransactionID, AccountID, Amount, Type, TransactionDate)
VALUES
(1001, 101, 1000.00, 'Deposit', GETDATE()),
(1002, 101, 500.00, 'Withdraw', GETDATE()),
(1003, 103, 2000.00, 'Deposit', GETDATE()),
(1004, 104, 300.00, 'Withdraw', GETDATE());
--4️⃣ Insert into Loan
INSERT INTO Loan (LoanID, CustomerID, LoanAmount, LoanType, Status)
VALUES
(201, 1, 20000.00, 'Home Loan', 'Approved'),
(202, 2, 15000.00, 'Car Loan', 'Pending'),
(203, 3, 5000.00, 'Personal Loan', 'Rejected');



