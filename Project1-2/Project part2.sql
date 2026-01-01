--1. Library Book Inventory Report 

select l.LName As LibraryName, COUNT(B.Book_Id)as TotalBook ,
sum(Case when lo.lStatus='Returned' then 1 Else 0 End) As AvailableBooks,
sum(Case when lo.lStatus IN( 'Issued', 'Overdue') then 1 Else 0 End) As BooksOnLoan

from Libraries l
LEFT join Book B on l.Libraries_ID=b.Libraries_ID
LEFT join Loan lo on b.Book_Id=lo.Book_Id
Group by l.LName

--2. Active Borrowers Analysis 
select m.FullName As MemberName , M.Email, B.Title As BookTitle , lo.LoanDate As LoanDate,
lo.DueDate As DueDate ,lo.LStatus As CurrentStatus
from loan lo
join  Members m on m.Member_Id=lo.Member_Id
join Book b on b.Book_Id=lo.Book_Id
where LO.LStatus IN ('Issued', 'Overdue')

--3. Overdue Loans with Member Details 
select m.FullName AS MemberName,m.phoneNo,B.Title AS BookTitle,l.LName AS LibraryName,
  DATEDIFF(DAY, LO.DueDate, GETDATE()) AS DaysOverdue,
    ISNULL(SUM(P.Amount), 0) AS FinePaid
from Loan lo 
join Members m on m.Member_Id=lo.Member_Id
join Book b on lo.Book_Id=b.Book_Id
join Libraries l on l.Libraries_ID=b.Libraries_ID
left join Payment p on lo.Loan_Id=p.Loan_Id
where p.Method='Cash'
group by m.FullName,m.phoneNo,B.Title,l.LName,LO.DueDate

-- 4. Staff Performance Overview 
select l.LName ,s.FullName ,s.position ,count(b.Book_Id) AS BooksManaged
from Libraries l
join Staff s on l.Libraries_ID=s.Libraries_ID
left join Book b on b.Libraries_ID=l.Libraries_ID
group by l.LName ,s.FullName ,s.position

--5. Book Popularity Report 
select b.Title,b.ISBN,b.Genre,count(l.loan_Id) AS TotalTimesLoaned,
AVG(r.Rating) AS AvgRating
from Book b
join Loan l on b.Book_Id=l.Book_Id
LEFT JOIN Review r on b.Book_Id=r.Book_Id
GROUP BY b.Title, b.ISBN, b.Genre
HAVING COUNT(l.Loan_Id) >= 3

--6. Member Reading History 
SELECT 
    m.FullName AS MemberName,b.Title AS BookTitle,l.LoanDate,l.ReturnDate,
	r.Rating, r.Comments AS Review
from Members m 
join Loan l on m.Member_Id=l.Member_Id
join Book b on l.Book_Id=b.Book_Id
left join Review r on r.Member_Id=l.Member_Id And r.Book_Id=b.Book_Id
order by m.FullName ,l.LoanDate

--7. Revenue Analysis by Genre 
SELECT  b.Genre,
    COUNT(l.Loan_Id) AS TotalLoans,
    SUM(p.Amount) AS TotalFinesCollected,
    AVG(p.Amount) AS AvgFinePerLoan
FROM Book b
JOIN Loan l ON b.Book_Id = l.Book_Id
JOIN Payment p ON l.Loan_Id = p.Loan_Id
GROUP BY b.Genre


---Section 2: Aggregate Functions and Grouping 
--8. Monthly Loan Statistics 
select DATENAME(month,l.LoanDate)As MonthName,
count(l.loan_Id) as totalLoan,
sum( case when l.LStatus='Returned' then 1 else 0 End) AS TotalReturned,
sum( case when l.LStatus in ('Issued','Overdue') then 1 else 0 End) AS TotalIssuedOrOverdue
from loan l
where year(l.LoanDate)=year(GETDATE())
group by DATENAME(month,l.LoanDate),MONTH(l.loanDate)
order by MONTH(l.loanDate)

--9. Member Engagement Metrics 
SELECT 
    m.FullName,
    COUNT(DISTINCT l.Loan_Id) AS TotalBooksBorrowed,
    SUM(CASE WHEN l.LStatus IN ('Issued','Overdue') THEN 1 ELSE 0 END) AS CurrentlyOnLoan,
    SUM(ISNULL(p.Amount,0)) AS TotalFinesPaid,
    AVG(r.Rating) AS AvgRatingGiven
FROM Members m
JOIN Loan l ON m.Member_Id = l.Member_Id
LEFT JOIN Payment p ON l.Loan_Id = p.Loan_Id
LEFT JOIN Review r ON l.Book_Id = r.Book_Id AND l.Member_Id = r.Member_Id
GROUP BY m.FullName
HAVING COUNT(l.Loan_Id) >= 1
ORDER BY TotalBooksBorrowed DESC

--10. Library Performance Comparison
SELECT 
    lib.LName AS LibraryName,
    COUNT( b.Book_Id) AS TotalBooksOwned,
    COUNT( l.Member_Id) AS ActiveMembers,
    SUM(p.Amount) AS TotalFinesRevenue,
    CAST(COUNT( b.Book_Id) AS FLOAT)/(COUNT( l.Member_Id)) AS AvgBooksPerMember
FROM Libraries lib
LEFT JOIN Book b ON lib.Libraries_ID = b.Libraries_ID
LEFT JOIN Loan l ON b.Book_Id = l.Book_Id
LEFT JOIN Payment p ON l.Loan_Id = p.Loan_Id
GROUP BY lib.LName


--11. High-Value Books Analysis

SELECT 
    b.Title,b.Genre,b.Price,
    g.GenreAvgPrice,
    b.Price - g.GenreAvgPrice AS DifferenceFromAvg
FROM Book b
JOIN (
    SELECT Genre, AVG(Price) AS GenreAvgPrice
    FROM Book
    GROUP BY Genre
) g ON b.Genre = g.Genre
WHERE b.Price > g.GenreAvgPrice;

--12. Payment Pattern Analysis 
SELECT 
    Method,
    COUNT(*) AS Transactions,
    SUM(Amount) AS TotalAmount,
    AVG(Amount) AS AvgPayment,
    SUM(Amount)*100.0 / (SELECT SUM(Amount) FROM Payment) AS RevenuePercentage
FROM Payment
GROUP BY Method;


--Section 3: Views Creation 
--13. vw_CurrentLoans 
CREATE VIEW vw_CurrentLo AS
SELECT 
    m.FullName,
    b.Title,
    lo.LoanDate,
    lo.DueDate,
    lo.LStatus,
    DATEDIFF(DAY, GETDATE(), lo.DueDate) AS DaysToOrOverdue
FROM Loan lo
JOIN Members m ON lo.Member_Id = m.Member_Id
JOIN Book b ON lo.Book_Id = b.Book_Id
WHERE lo.LStatus IN ('Issued','Overdue');


--14. vw_LibraryStatistics 
CREATE VIEW vw_LibraryStatistics AS
SELECT 
    lib.Libraries_ID,
    lib.LName AS LibraryName,
    COUNT( b.Book_Id) AS TotalBooks,
    SUM(CASE WHEN l.LStatus IS NULL OR l.LStatus = 'Returned' THEN 1 ELSE 0 END) AS AvailableBooks,
    COUNT( m.Member_Id) AS TotalMembers,
    SUM(CASE WHEN l.LStatus IN ('Issued','Overdue') THEN 1 ELSE 0 END) AS ActiveLoans,
    COUNT( s.Staff_Id) AS TotalStaff,
    SUM(p.Amount) AS TotalFinesRevenue
FROM Libraries lib
LEFT JOIN Book b ON lib.Libraries_ID = b.Libraries_ID
LEFT JOIN Loan l ON b.Book_Id = l.Book_Id
LEFT JOIN Members m ON l.Member_Id = m.Member_Id
LEFT JOIN Staff s ON lib.Libraries_ID = s.Libraries_ID
LEFT JOIN Payment p ON l.Loan_Id = p.Loan_Id
GROUP BY lib.Libraries_ID, lib.LName;


--15. vw_BookDetailsWithReviews 
CREATE VIEW vw_BookDetailsReviews
AS
SELECT 
    b.Book_Id, b.Title,b.Genre, b.Price, b.Libraries_ID,b.IsAvailable,
    COUNT(r.Review_Id) AS TotalReviews,
    AVG(r.Rating) AS AvgRating,
    MAX(r.ReviewDate) AS LatestReviewDate
FROM Book b
LEFT JOIN Review r ON b.Book_Id = r.Book_Id
GROUP BY b.Book_Id, b.Title, b.Genre, b.Price, b.Libraries_ID,b.IsAvailable

--16. sp_IssueBook 
CREATE PROCEDURE sp_IssueBook
    @MemberID INT,
    @BookID INT,
    @DueDate DATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if book is available 
    IF EXISTS (
        SELECT 1  FROM Loan 
        WHERE Book_Id = @BookID AND LStatus IN ('Issued','Overdue')
    )
    BEGIN
        RAISERROR('Book is currently not available.', 16, 1);
        RETURN;
    END

    -- Check if member has any overdue loans
    IF EXISTS (
        SELECT 1 FROM Loan 
        WHERE Member_Id = @MemberID AND LStatus = 'Overdue'
    )
    BEGIN
        RAISERROR('Member has overdue loans. Cannot issue new book.', 16, 1);
        RETURN;
    END

    -- Create new loan record
    INSERT INTO Loan (LoanDate, DueDate, LStatus, Member_Id, Book_Id)
    VALUES (GETDATE(), @DueDate, 'Issued', @MemberID, @BookID);

    PRINT 'Book issued successfully!';
END;

--Execute
--Success
EXEC sp_IssueBook 4, 1032, '2025-12-01'
--Error
EXEC sp_IssueBook 4, 1032, '2025-12-01'
--17. sp_ReturnBook 
CREATE PROCEDURE sp_ReturnBook
    @LoanID INT,
    @ReturnDate DATE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @DueDate DATE, @OverdueDays INT, @FineAmount DECIMAL(10,2), @BookID INT;

    -- Get loan info
    SELECT @DueDate = DueDate, @BookID = Book_Id
    FROM Loan
    WHERE Loan_Id = @LoanID;

    -- Update loan to returned
    UPDATE Loan
    SET ReturnDate = @ReturnDate,
        LStatus = 'Returned'
    WHERE Loan_Id = @LoanID;

    -- Calculate overdue days
    SET @OverdueDays = DATEDIFF(DAY, @DueDate, @ReturnDate);
    IF @OverdueDays < 0 SET @OverdueDays = 0;

    SET @FineAmount = @OverdueDays * 2;  -- $2 per day overdue

    -- If fine exists, create a payment record
    IF @FineAmount > 0
    BEGIN
        INSERT INTO Payment (payment_Date, Amount, Method, Loan_Id)
        VALUES (GETDATE(), @FineAmount, 'Pending', @LoanID);
    END

    PRINT 'Book returned successfully!';
    IF @FineAmount > 0
        PRINT 'Total fine: $' + CAST(@FineAmount AS VARCHAR(10));
END;
--execute
--success
EXEC sp_ReturnBook 11, '2025-12-05'
--(No fine)
EXEC sp_ReturnBook 7, '2025-12-05'
--18. sp_GetMemberReport 
CREATE PROCEDURE sp_GetMemberReport
    @MemberID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- 1. Member basic information
    SELECT Member_Id, FullName, Email, PhoneNo, MS_StartDate
    FROM Members
    WHERE Member_Id = @MemberID;

    -- 2. Current loans
    SELECT l.Loan_Id, b.Title AS BookTitle, l.LoanDate, l.DueDate, l.LStatus
    FROM Loan l
    JOIN Book b ON l.Book_Id = b.Book_Id
    WHERE l.Member_Id = @MemberID AND l.LStatus IN ('Issued','Overdue');

    -- 3. Loan history
    SELECT l.Loan_Id, b.Title AS BookTitle, l.LoanDate, l.DueDate, l.ReturnDate, l.LStatus
    FROM Loan l
    JOIN Book b ON l.Book_Id = b.Book_Id
    WHERE l.Member_Id = @MemberID;

    -- 4. Fines
    SELECT 
        SUM(CASE WHEN p.Method <> 'Pending' THEN p.Amount ELSE 0 END) AS TotalFinesPaid,
        SUM(CASE WHEN p.Method = 'Pending' THEN p.Amount ELSE 0 END) AS PendingFines
    FROM Loan l
    LEFT JOIN Payment p ON l.Loan_Id = p.Loan_Id
    WHERE l.Member_Id = @MemberID;

    -- 5. Reviews
    SELECT b.Title AS BookTitle, r.Rating, r.Comments, r.ReviewDate
    FROM Review r
    JOIN Book b ON r.Book_Id = b.Book_Id
    WHERE r.Member_Id = @MemberID;
END;
--execute:
--successful
EXEC sp_GetMemberReport 4
--Error
EXEC sp_GetMemberReport 999
EXEC sp_helptext sp_GetMemberReport
--19. sp_MonthlyLibraryReport 
CREATE PROCEDURE sp_MonthlyLibraryReport
    @LibraryID INT, @Month INT, @Year INT
AS
BEGIN
    SET NOCOUNT ON;

    -- 1. Total loans issued in the month
    SELECT COUNT(*) AS TotalLoansIssued
    FROM Loan l
    JOIN Book b ON l.Book_Id = b.Book_Id
    WHERE b.Libraries_ID = @LibraryID
      AND MONTH(l.LoanDate) = @Month
      AND YEAR(l.LoanDate) = @Year;

    -- 2. Total books returned in the month
    SELECT COUNT(*) AS TotalBooksReturned
    FROM Loan l
    JOIN Book b ON l.Book_Id = b.Book_Id
    WHERE b.Libraries_ID = @LibraryID
      AND l.ReturnDate IS NOT NULL
      AND MONTH(l.ReturnDate) = @Month
      AND YEAR(l.ReturnDate) = @Year;

    -- 3. Total revenue collected
    SELECT SUM(p.Amount) AS TotalRevenue
    FROM Payment p
    JOIN Loan l ON p.Loan_Id = l.Loan_Id
    JOIN Book b ON l.Book_Id = b.Book_Id
    WHERE b.Libraries_ID = @LibraryID
      AND MONTH(p.payment_Date) = @Month
      AND YEAR(p.payment_Date) = @Year;

    -- 4. Most borrowed genre
    SELECT TOP 1 b.Genre, COUNT(*) AS TimesBorrowed
    FROM Loan l
    JOIN Book b ON l.Book_Id = b.Book_Id
    WHERE b.Libraries_ID = @LibraryID
      AND MONTH(l.LoanDate) = @Month
      AND YEAR(l.LoanDate) = @Year
    GROUP BY b.Genre
    ORDER BY TimesBorrowed DESC;

    -- 5. Top 3 most active members
    SELECT TOP 3 m.FullName, COUNT(*) AS LoansCount
    FROM Loan l
    JOIN Members m ON l.Member_Id = m.Member_Id
    JOIN Book b ON l.Book_Id = b.Book_Id
    WHERE b.Libraries_ID = @LibraryID
      AND MONTH(l.LoanDate) = @Month
      AND YEAR(l.LoanDate) = @Year
    GROUP BY m.FullName
    ORDER BY LoansCount DESC;
END;
--execute:
--successful
EXEC sp_MonthlyLibraryReport 1, 6, 1995
--output no data /null
EXEC sp_MonthlyLibraryReport @LibraryID= 1, @Month=1, @Year=2020

EXEC sp_helptext sp_MonthlyLibraryReport



select * from Book
select * from Libraries
select * from Loan
select * from Payment
select * from Staff
select * from Members
select * from Review
