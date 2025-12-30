--Display all book records. 
Select * From Book

--Display each book’s title, genre, and availability. 
Select Title, Genre ,IsAvailable From Book

-- Display all member names, email, and membership start date. 
Select FullName,Email,MS_StartDate from Members 

--Display each book’s title and price as BookPrice.
Select Title ,Price As BookPrice From Book

--List books priced above 250 LE.
select * from Book where Price >250

--List members who joined before 2023.
select * from Members where MS_StartDate < '2023-01-01'

--Display books published after 2018. 
Select * from Book 
where Book_publish >2018

--Display books ordered by price descending.
select * from Book order by Price Desc

--Display the maximum, minimum, and average book price. 
SELECT 
    MAX(Price) AS MaxPrice,
    MIN(Price) AS MinPrice,
    AVG(Price) AS AvgPrice
FROM Book

--Display total number of books.
Select Count(*) As TotalBook from Book

--Display members with NULL email.
Select * from Members where Email is Null 

--Display books whose title contains 'Data'.
select * From Book where Title like '%Data%'

--DML
-- Insert yourself as a member (Member ID = 405). 
SET IDENTITY_INSERT Members ON;

insert into Members (Member_ID, FullName, Email, PhoneNo, MS_StartDate)
values (405, 'Aliya Rashid Sarhan', 'aliya.sarhan@gmail.com', '968-99988877', '2025-12-17');

SET IDENTITY_INSERT Members OFF

--14. Register yourself to borrow book ID 1011 
--first Create Book_Id=1011
SET IDENTITY_INSERT Book ON;

INSERT INTO Book (Book_ID, ISBN, Title, Genre, Price,IsAvailable, ShelfLocation, Libraries_ID)
VALUES (1011, '978-0-000000-00-0', 'Exam Book', 'Reference', 100, 'Available', 'Shelf X1', 1);

SET IDENTITY_INSERT Book OFF
---then go to loan 

insert into  Loan(LoanDate, DueDate, ReturnDate, LStatus, Member_ID, Book_ID)
VALUES ('2025-12-17','2025-12-30',  NULL, 'Issued', 405, 1011)

--- Insert another member with NULL email and phone.
--first Alter table to allow null

ALTER TABLE Members
ALTER COLUMN Email VARCHAR(100) NULl

--then null email add
Insert into Members (FullName, Email, PhoneNo, MS_StartDate)
VALUES ('Hassan Al-Kindi', NULL, NULL,' 2025-12-17')

--Update the return date of your loan to today. 
UPDATE Loan
SET ReturnDate = '2025-12-17',
    LStatus = 'Returned'
WHERE Member_ID = 405

---Increase book prices by 5% for books priced under 200. 
UPDATE Book
SET Price = Price * 1.05
WHERE Price < 200

--Update member status to 'Active' for recently joined members. 
--first add status colum in member
alter table Members
add status VARCHAR(20)

--update member
UPDATE Members
SET status = 'Active'
WHERE MS_StartDate >= '2024-01-01'

---Delete members who never borrowed a book.
delete from Members
WHERE NOT EXISTS (
   SELECT 1 FROM Loan
    WHERE Loan.Member_Id =Members.Member_Id) 


select*from Members