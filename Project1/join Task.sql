--1. Display library ID, name, and the name of the manager. 
select L.Libraries_ID,
       L.LName, S.FullName AS ManagerName
from Libraries L
JOIN Staff S ON L.Libraries_ID = S.Libraries_ID
where S.Position = 'Librarian'

--2. Display library names and the books available in each one.
select L.LName,B.Title
from Libraries L
JOIN Book B ON L.Libraries_ID = B.Libraries_ID
order by L.LName

--3. Display all member data along with their loan history. 
select M.Member_Id,M.FullName,
       LN.LoanDate,LN.ReturnDate, LN.LStatus
FROM Members M
LEFT JOIN Loan LN ON M.Member_Id = LN.Member_Id

--4. Display all books located in 'Zamalek' or 'Downtown'. 
select B.*
from Book B
JOIN Libraries L ON B.Libraries_ID = L.Libraries_ID
where  L.LLocation IN ('Muscat, Oman')

--5. Display all books whose titles start with 'T'. 
select*
from Book
where Title LIKE 'T%'

--6. List members who borrowed books priced between 100 and 300 LE. 
select distinct M.FullName
from Members M
JOIN Loan LN ON M.Member_Id = LN.Member_Id
JOIN Book B ON LN.Book_Id = B.Book_Id
where B.Price BETWEEN 100 AND 300

--7. Retrieve members who borrowed and returned books titled 'The Alchemist'. 
select distinct M.FullName
from Members M
JOIN Loan LN ON M.Member_Id = LN.Member_Id
JOIN Book B ON LN.Book_Id = B.Book_Id
where B.Title='Harry Potter'

--8. Find all members assisted by librarian "Sarah Fathy". 
select distinct M.FullName
from Members M
JOIN Loan LN ON M.Member_Id = LN.Member_Id
JOIN Book B ON LN.Book_Id = B.Book_Id
JOIN Libraries L ON B.Libraries_ID = L.Libraries_ID
JOIN Staff S ON L.Libraries_ID = S.Libraries_ID
WHERE S.FullName = 'Ahmed Al-Moqbali'
  AND S.Position = 'Librarian'

--9. Display each member’s name and the books they borrowed, ordered by book title. 
select  M.FullName ,B.Title
from Members M 
join Loan LN on M.Member_Id=Ln.Member_Id
JOIN Book B ON LN.Book_Id = B.Book_Id
order by B.Title
--10. For each book located in 'Cairo Branch', show title, library name, manager, and shelf info. 
select B.Title,L.LName,
       S.FullName AS ManagerName,B.ShelfLocation
FROM Book B
JOIN Libraries L ON B.Libraries_ID = L.Libraries_ID
JOIN Staff S ON L.Libraries_ID = S.Libraries_ID
WHERE L.LName = 'Muscat Library'
  AND S.Position = 'Librarian'

--11. Display all staff members who manage libraries. 
select FullName
from Staff
where Position = 'Manager'

--12. Display all members and their reviews, even if some didn’t submit any review yet.
select M.FullName,R.Rating,
       R.Comments,R.ReviewDate
FROM Members M
LEFT JOIN Review R ON M.Member_Id = R.Member_Id
