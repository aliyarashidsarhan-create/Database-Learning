
--Show only customer name, phone, and account status (hide sensitive info like SSN or balance).
create view  vw_Custome
as   select C.FullName,C.Phone,A.Status As AccountStatus
from Customer c
join Account A 
on c.CustomerID=A.CustomerID

select *From  vw_Custome

---Show account ID, balance, and account type. 
Create view vm_Finance 
As
select AccountID,Balance,AccountType
from Account 
select *From vm_Finance

--Show loan details but hide full customer information. Only include CustomerID.
Create view vm_LoanOfficer 
As
select * from Loan

select * from vm_LoanOfficer 

--Show only recent transactions (last 30 days) with account ID and amount. 
Create view vm_RecentTransactions
As
select AccountID,Amount ,TransactionDate
from Transactions
where TransactionDate >= DATEADD(DAY, -30, GETDATE())

select * from vm_RecentTransactions