select * from Employee -- display employee data

select Fname,lname,salary,Dno from Employee --to display  first name, last name, salary, and department number

select fname +''+Lname As full_Name ,
Salary * 0.10 As Annual_Comm
From Employee  -- full name and 10% of annual salary 

select 
SSN,
fname +''+Lname As Employee_Name 
From Employee 
where Salary > 1000; --  Display employee ID and name for employees earning more than 1000 LE monthly. 

select 
SSN,
fname +''+Lname As Employee_Name 
From Employee 
where Salary *12  > 10000; --Display employee ID and name for employees earning more than 10000 LE annually.
 
 select Fname ,Salary from Employee 
 where Sex = 'F'  --  Display names and salaries of all female employees.

 select * from Employee 
 where Salary Between 2000 And 5000 --Display employees whose salary is between 2000 and 5000.

 select Fname , Salary from Employee 
 order by Salary Desc --Display employee names ordered by salary descending. 

 select 
 Max(Salary) As Max_Salary,
 Min(Salary) As Min_Salary,
 Avg(Salary) As Avg_Salary
 From Employee ; -- Display the maximum, minimum, and average salary. 

 select Count(*) As Total_Employees
 From Employee --Display the total number of employees. 

Select * From Employee 
Where Fname Like 'A%' -- Display employees whose first name starts with 'A'. 

Select * From Employee 
where Superssn is Null -- Display employees who have no supervisor.

Select * From Employee
where Hird > '2020-12-31' --  Display employees hired after 2020. 

Insert into Employee (Fname,Lname,SSN,Salary,Superssn,Dno)
values ('Aliya','Rashid',102672,3000,112233,30) --Insert your personal data into the employee table

Insert into Employee (Fname,Lname,SSN,Salary,Superssn,Dno)
values ('Fatma','Rashid',102660,Null,Null,30) -- Insert another employee 

update Employee 
set Salary = Salary * 1.20
where SSN =102672; -- Update your salary by 20%. 

update Employee 
Set Salary =Salary * 1.05
where Dno =30 -- Increase salaries by 5% for all employees in department 30. 

update  Employee 
set Commission = Null 
where Salary < 2000 -- Set commission to NULL for employees earning less than 2000. 

Delete From Employee 
where Salary is Null --Delete employees with NULL salary. 
