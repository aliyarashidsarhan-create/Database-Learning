create Database Banking 
use Banking 
--create table Branch
Create Table Branches(Branch_Id int primary key identity (2,2),
Baddress varchar(30), phoneNo varchar(20))

-- create table Employee
Create Table Employee(Employee_Id int primary key identity(3,1),
EName varchar(20) not null , Position varchar(30), Branch_Id int ,
foreign key (Branch_Id) References Branches(Branch_Id)) 

-- create table customer
Create Table Customer(Customer_Id int primary key identity (4,1),
CName varchar(20) not Null, Caddress varchar(30),DBirth Date ,PhoneNo varchar(20))

-- create table Lons
Create Table Lons(Loans_id  int primary key identity (5,1),
LType varchar(30), amount decimal(10,3),issue_Date Date ,
E_Id int , C_Id int ,
foreign key (E_Id) References Employee(Employee_Id),
foreign key (C_Id) References Customer(Customer_Id))

-- create table Customer & Employee (M:M)
Create Table Customer_Employee(Customer_Id int ,
Employee_Id int ,
primary key(Customer_Id ,Employee_Id),
foreign key (Customer_Id) References Customer(Customer_Id),
foreign key (Employee_Id) References Employee(Employee_Id))

-- create table Account
Create Table Account(Account_No  int primary key identity (6,1),
balance Decimal(12,2),ADate Date , Account_Type varchar(30),
Customer_Id int ,
foreign key (Customer_Id) References Customer(Customer_Id))

-- create table Transaction
Create Table Transactions(Transaction_Id  int primary key identity (7,1),
TDate Date , amount Decimal(12,2),Transaction_Type varchar(30),
Account_No Int ,
foreign key (Account_No) References Account(Account_No))