create Database Project_Library
Use Project_Library

-- Create Table Libraries 
Create Table Libraries(Libraries_ID int identity(1,1) Primary Key,
LName Varchar(50) Not Null Unique ,LLocation varchar(60) Not Null ,
contactNO Varchar(15) Not null ,EYear Int )

--Create Table Staff
Create Table Staff(Staff_ID int identity(2,1) Primary Key,
FullName varchar(70) , position varchar(50),ContactNo Varchar(15) Not null,
Libraries_ID Int  ,
Constraint FK_StaffLibraries
Foreign Key (Libraries_ID) References Libraries(Libraries_ID)
ON DELETE CASCADE
ON UPDATE CASCADE )

--Create Table Book
create Table Book(Book_Id  int identity(3,1) Primary Key,
ISBN Varchar(20) Not Null Unique ,Title Varchar(60) Not Null,
Genre Varchar(20) Not Null,Price Decimal(10,2) Check(Price>0),
IsAvailable Varchar(20)  Default 'TRUE',
ShelfLocation Varchar(50) Not Null ,
Libraries_ID Int  ,

Constraint CK_Genre
Check (Genre  IN ( 'Fiction', 'Non-fiction', 'Reference', 'Children' )),

Constraint Fk_BookLibrary
Foreign Key (Libraries_ID) References Libraries(Libraries_ID)
ON DELETE CASCADE
ON UPDATE CASCADE )

--create Table Members

Create Table Members(Member_Id  int identity(4,1) Primary Key,
FullName Varchar(50) , Email Varchar(100) Not Null Unique ,
phoneNo Varchar(20),MS_StartDate Date  Not Null )

--Create Table loan 
Create Table Loan(Loan_Id int identity(5,1) Primary Key,
LoanDate Date Not Null ,DueDate Date Not Null ,
ReturnDate Date, LStatus Varchar(20) Not Null Default 'Issued',
Member_Id int ,
Book_Id int ,

Constraint Ck_LoanState
Check(LStatus in ('Issued', 'Returned', 'Overdue' )),

Constraint Ck_ReturnDate
check(ReturnDate is Null Or ReturnDate >= LoanDate),

Constraint Fk_LoanMember 
Foreign key (Member_Id )References Members(Member_Id)
ON DELETE CASCADE
ON UPDATE CASCADE ,

Constraint Fk_LoanBook
Foreign key (Book_Id)References Book(Book_Id)
ON DELETE CASCADE
ON UPDATE CASCADE )

--Create Table Payment
Create Table Payment(Payment_Id int identity(6,1) Primary Key,
payment_Date date Not Null,Amount decimal(10,2) Not Null Check(Amount>0),
Method varchar(30),
Loan_Id int ,
Constraint Fk_PaymentLoan
Foreign key (Loan_Id)References Loan(Loan_Id)
ON DELETE CASCADE
ON UPDATE CASCADE )

--Create Table Review 
Create Table Review(Review_Id int identity(7,1) Primary Key,
Rating Int not Null ,Comments Varchar(200) Default 'No Comments',
ReviewDate Date Not Null,
Book_Id int  ,
Member_Id int,

Constraint Ck_ReviewRating 
Check(Rating Between 1 And 5),

Constraint Fk_ReviewBook
Foreign key (Book_Id)References Book(Book_Id)
ON DELETE CASCADE
ON UPDATE CASCADE,

Constraint Fk_ReviewMember 
Foreign key (Member_Id )References Members(Member_Id)
ON DELETE CASCADE
ON UPDATE CASCADE)