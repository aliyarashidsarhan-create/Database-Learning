--insert data in Branch Table 
insert into Branches(Baddress,phoneNo)
values ('Muscat' , '98765345'),
       ('Salalah' , '9876444'),
	   ('Sohar' , '987666665')

--insert data in Employee Table 
insert into Employee(EName, Position, Branch_Id)
values ('Ahmed Ali', 'Manager', 2),
       ('Fatima Noor', 'Loan Officer', 4),
       ('Salim Hassan', 'Clerk', 6)

--insert data in Customer Table 
insert into Customer(CName, Caddress, DBirth, PhoneNo)
Values('Ali Rashid', 'Muscat', '1998-05-10', '99112233'),
      ('Mona Said', 'Salalah', '1995-09-21', '98765432'),
      ('Khalid Omar', 'Sohar', '2000-01-15', NULL)

--insert data in Customer_Employee Table 
insert into Customer_Employee (Customer_Id, Employee_Id)
                  values (4, 3),
                         (5, 4),
                         (6, 5)

--insert data in Account Table 
insert into Account (balance, ADate, Account_Type, Customer_Id)
Values (2500.00, '2024-01-10', 'Savings', 4),
       (1500.50, '2024-02-15', 'Current', 5),
       (5000.00, '2024-03-01', 'Savings', 6)

--insert data in Lons Table 
insert into Lons (LType, amount, issue_Date, E_Id, C_Id)
values ('Home Loan', 75000.000, '2024-04-01', 4, 4),
       ('Car Loan', 12000.000, '2024-05-10', 5, 5),
        ('Personal Loan', 8000.000, '2024-06-20', 3, 6)

--insert data in Transaction Table 
insert into Transactions (TDate, amount, Transaction_Type, Account_No)
values ('2024-04-05', 500.00, 'Deposit', 6),
       ('2024-04-10', 200.00, 'Withdrawal', 7),
        ('2024-04-15', 1000.00, 'Deposit', 8);

	   select* From Transactions