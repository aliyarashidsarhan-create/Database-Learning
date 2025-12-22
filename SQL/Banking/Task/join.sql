--1. Display branch ID, name, and the name of the employee who manages it. 
select B.Branch_Id ,B.Baddress As BranchName,
E.EName As ManagerName 
from Branches B join Employee E  
on b.Branch_Id=e.Branch_Id
where e.Position='Manager'

--2. Display branch names and the accounts opened under each. 
select B.Baddress As BranchName,A.Account_No,A.Account_Type,A.balance 
from Branches B 
JOIN Employee E ON B.Branch_Id = E.Branch_Id
JOIN Customer_Employee CE ON E.Employee_Id = CE.Employee_Id
join Account A on CE.Customer_Id=A.Customer_Id

--3. Display full customer details along with their loans. 

SELECT C.*,
       L.LType,
       L.Amount,
       L.Issue_Date
FROM Customer C
JOIN Lons L ON C.Customer_Id = L.C_Id;
--4. Display loan records where the loan office is in 'Alexandria' or 'Giza'. 
select l.*
from Lons l
join Employee E on e.Employee_Id=l.E_Id
join Branches B on E.Branch_Id=B.Branch_Id
where b.Baddress in ('Muscat','Sohar')

--5. Display account data where the type starts with "S" (e.g., "Savings"). 
select *
from Account
WHERE Account_Type LIKE 'S%'

--6. List customers with accounts having balances between 20,000 and 50,000. 
select Distinct C.CName,A.balance 
from Customer c join Account A
on c.Customer_Id=A.Customer_Id
where A.balance between 2000 and 10000

--7. Retrieve customer names who borrowed more than 100,000 LE from 'Cairo Main Branch'. 
select Distinct C.CName
from Customer c
join Lons l on c.Customer_Id=l.C_Id
join Employee e on l.E_Id=e.Employee_Id
join Branches b on e.Branch_Id=b.Branch_Id
where l.amount>1000
And b.Baddress ='Muscat'

--8. Find all customers assisted by employee "Amira Khaled". 
select Distinct C.CName
from Customer c
join  Customer_Employee CE ON C.Customer_Id = CE.Customer_Id
JOIN Employee E ON CE.Employee_Id = E.Employee_Id
where E.EName='Ahmed Ali'

--9. Display each customer’s name and the accounts they hold, sorted by account type. 
select C.CName,  A.Account_No,
       A.Account_Type,A.Balance
From Customer C
JOIN Account A
     ON C.Customer_Id = A.Customer_Id
order by A.Account_Type
--10. For each loan issued in Cairo, show loan ID, customer name, employee handling it, and branch name. 
select L.Loans_id,
       C.CName AS Customer_Name,
       E.EName AS Employee_Name,
       B.Baddress AS Branch_Name
FROM Lons L
JOIN Customer C ON L.C_Id = C.Customer_Id
JOIN Employee E ON L.E_Id = E.Employee_Id
JOIN Branches B ON E.Branch_Id = B.Branch_Id
WHERE B.Baddress = 'Muscat'

--11. Display all employees who manage any branch. 
select distinct E.Employee_Id, E.EName
FROM Employee E
WHERE E.Position = 'Manager'

--12. Display all customers and their transactions, even if some customers have no transactions yet.
select C.CName, T.TDate,
       T.Amount,T.Transaction_Type
FROM Customer C
LEFT JOIN Account A ON C.Customer_Id = A.Customer_Id
LEFT JOIN Transactions T ON A.Account_No = T.Account_No
