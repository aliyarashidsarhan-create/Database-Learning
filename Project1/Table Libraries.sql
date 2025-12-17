--insert in Table Libraries 
insert into Libraries (LName, LLocation, contactNO, EYear)
values ('Muscat Library', 'Muscat, Oman', '968-12345678', 1995),
       ('Salalah Library', 'Salalah, Oman', '968-87654321', 2009),
      ('Sohar Library', 'Sohar, Oman', '968-23456789', 2015)

--INSERT INTO Staff
insert into Staff(FullName, position, ContactNo, Libraries_ID)
VALUES('Ahmed Al-Moqbali', 'Librarian', '968-11122233', 1),
      ('Fatma Al-Balushi', 'Assistant Librarian', '968-22233344', 1),
      ('Salim Al-Isaii', 'Librarian', '968-33344455', 2),
      ('Noura Al-Farsi', 'Assistant Librarian', '968-44455566', 3)

--INSERT INTO Book
insert into Book(ISBN, Title, Genre, Price, ShelfLocation, Libraries_ID)
VALUES('978-0-123456-47-2', ' Programming', 'Reference', 25.50, 'Shelf A1', 1),
      ('978-0-987654-32-1', 'Oman History', 'Non-fiction', 18.00, 'Shelf B2', 1),
      ('978-0-111213-14-5', 'Harry Potter', 'Fiction', 30.00, 'Shelf C3', 2),
       ('978-0-555666-77-8', 'Children Stories', 'Children', 12.50, 'Shelf D4', 3)

--INSERT INTO Members
insert into Members(FullName, Email, phoneNo, MS_StartDate)
Values('Aliya Rashid', 'aliya@gmail.com', '968-55566677', '2025-01-15'),
      ('Omar Said', 'omar@gmail.com', '968-66677788', '2025-03-20'),
      ('Sara Al-Hinai', 'sara@gmail.com','968-66677999', '2025-06-05')

--INSERT INTO Loan
insert into Loan(LoanDate, DueDate, ReturnDate, LStatus, Member_Id, Book_Id)
VALUES('2025-12-01', '2025-12-15', NULL, 'Issued',4, 3),
      ('2025-11-20', '2025-12-04', '2025-12-03', 'Returned',5, 4),
       ('2025-12-05', '2025-12-19', NULL, 'Issued', 6, 5)

--INSERT INTO Payment 
insert into Payment (payment_Date, Amount, Method, Loan_Id)
VALUES('2025-12-03', 5.00, 'Cash', 7),
     ('2025-12-10', 10.00, 'Card', 8)

--INSERT INTO Review
insert into Review (Rating, Comments, ReviewDate, Book_Id, Member_Id)
VALUES (5, 'Excellent book!', '2025-12-04', 3, 4),
       (4, 'Very informative.', '2025-12-05', 5, 5),
       (3, 'Good for kids.', '2025-12-06', 4, 6)

	  Select * From Review