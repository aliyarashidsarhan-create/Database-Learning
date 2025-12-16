-- Display all customer records
select * From Customer

---Display customer full name, phone, and membership start date. 
Select CName As FullName ,PhoneNo from Customer

--Display each loan ID, amount, and type. 
select Loans_id ,amount,LType From Lons 

--Display account number and annual interest (5% of balance) as AnnualInterest. 
select Account_No , balance * 0.05 As AnnualInsert 
from Account

--List customers with loan amounts greater than 100000 LE


--List accounts with balances above 20000. 
select * From Account 
where balance > 20000

-- Display accounts opened in 2023.
select * from Account 
where Year(ADate)=2023

--Display accounts ordered by balance descending. 

SELECT *FROM Account
ORDER BY balance DESC

--- Display the maximum, minimum, and average account balance.
Select 
    MAX(balance) AS MaxBalance,
    MIN(balance) AS MinBalance,
    AVG(balance) AS AvgBalance
FROM Account

--. Display total number of customers.
select COUNT(*) AS TotalCustomers
from Customer

--Display customers with NULL phone numbers. 
SELECT *FROM Customer
WHERE PhoneNo IS NULL

--Display loans with duration greater than 10 years

--DMl
--Insert yourself as a new customer and open an account with balance 10000
INSERT INTO Customer (CName, Caddress, DBirth, PhoneNo)
VALUES ('Aliya Rashid', 'Muscat', '2000-06-15', '90000000')

INSERT INTO Account (balance, ADate, Account_Type, Customer_Id)
VALUES (10000, '2025-01-10', 'Savings', 6)

-- Insert another customer with NULL phone and address. 
insert into  Customer (CName, Caddress, DBirth, PhoneNo)
VALUES ('Sara Ahmed', NULL, '1999-03-10', NULL)

--- Increase your account balance by 20%.
UPDATE Account
SET balance = balance * 1.20
WHERE Customer_Id = (
    SELECT Customer_Id FROM Customer WHERE CName = 'Aliya Rashid')

-- Increase balance by 5% for accounts with balance less than 5000. 
UPDATE Account
SET balance = balance * 1.05
WHERE balance < 5000

--Update phone number to 'Not Provided' where phone is NULL
UPDATE Customer
SET PhoneNo = 'Not Provided'
WHERE PhoneNo IS NULL

---Delete closed accounts.
DELETE FROM Account
WHERE Account_Type = 'Closed'


Select * from Customer