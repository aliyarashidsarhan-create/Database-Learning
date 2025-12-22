--1. Display hotel ID, name, and the name of its manager. 
select b.Branch_Id,b.BName ,S.SName
from Branch b 
join Staff S on B.Branch_Id=S.Branch_Id
where Job_title='Manager'

--2. Display hotel names and the rooms available under them. 
select b.BName ,R.RNumber ,R.RType 
from Branch b
join Rooms R on R.branch_Id=B.Branch_Id
join Booking_Room BR on BR.RNumber=R.RNumber
where BR.Available_Status='Available'

--3. Display guest data along with the bookings they made. 
select C.* ,B.Booking_Id,B.Check_In,B.Check_Out
from Customer C Join Booking B 
on C.Customer_Id=B.Customer_Id

--4. Display bookings for hotels in 'Hurghada' or 'Sharm El Sheikh'. 
select BK.Booking_Id,B.BName ,B.Location
from Booking Bk
join Booking_Room BR on BK.Booking_Id=BR.Booking_id
join Rooms R on BR.RNumber=R.RNumber
join Branch B on R.branch_Id=B.Branch_Id
where B.Location in('Muscat','Sohar')

--5. Display all room records where room type starts with "S" (e.g., "Suite", "Single"). 
select * from Rooms where RType like 'S%'

--6. List guests who booked rooms priced between 1500 and 2500 LE. 
select Distinct C.CName
from Customer C 
join Booking b on c.Customer_Id=b.Customer_Id
join Booking_Room BR on BR.Booking_id=B.Booking_Id
join Rooms R on BR.RNumber=R.RNumber
where R.Night_rate Between 20 And 200

--7. Retrieve guest names who have bookings marked as 'Confirmed' in hotel "Hilton Downtown". 
select Distinct C.CName
from Customer C
join Booking b on c.Customer_Id=b.Customer_Id
join Booking_Room BR on BR.Booking_id=B.Booking_Id
join Rooms R on BR.RNumber=R.RNumber
join Branch bra on R.branch_Id=bra.Branch_Id
where b.Statuss ='Completed'
and bra.BName='Sohar'

--8. Find guests whose bookings were handled by staff member "Mona Ali". 
select distinct c.CName
FROM Customer c
JOIN Booking b ON c.Customer_Id = b.Customer_Id
JOIN Staff_Booking sb ON b.Booking_Id = sb.Booking_Id
JOIN Staff s ON sb.Staff_Id = s.Staff_Id
WHERE s.SName = 'Mohamed'

--9. Display each guest’s name and the rooms they booked, ordered by room type. 
SELECT c.CName, r.RNumber, r.RType
FROM Customer c
JOIN Booking b ON c.Customer_Id = b.Customer_Id
JOIN Booking_Room br ON b.Booking_Id = br.Booking_Id
JOIN Rooms r ON br.RNumber = r.RNumber
ORDER BY r.RType

--10. For each hotel in 'Cairo', display hotel ID, name, manager name, and contact info. 
SELECT b.Branch_Id, b.BName, s.SName AS Manager_Name
FROM Branch b
JOIN Staff s ON b.Branch_Id = s.Branch_Id
WHERE s.Job_title = 'Manager'
  AND b.Location = 'Muscat '

--11. Display all staff members who hold 'Manager' positions. 
SELECT *
FROM Staff
WHERE Job_title = 'Manager'

--12. Display all guests and their reviews, even if some guests haven't submitted any reviews.
--No review 
Select * from Customer