select * From Customer -- Display all guest records. 

select Customer_id as proof_id ,CName ,Email 
from Customer --guest’s name, contact number, and proof ID type

Select Booking_Id,Check_In,Check_Out 
from Booking 

select RNumber ,Night_rate As NightlyRate
from Rooms --room number and its price per night as NightlyRate

select * from Rooms 
where Night_rate > 1000 -- rooms priced above 1000 per night.

select *from staff 
where Job_title ='Reception' --staff members working as 'Receptionist'. 

select * from Booking 
where year(Check_In) =2024 --Display bookings made in 2024.

select * From Booking 
order by Check_In Desc  --bookings ordered by (Check-in )total cost descending. 

select MAX(Night_rate)As Max_Price,
       Min(Night_rate)As Min_Price,
	   Avg(Night_rate)As AVG_Price
From Rooms  -- maximum, minimum, and average room price.

select Count(*) As Total_Rooms
from Rooms  --Display total number of rooms.

select * from Customer 
Where CName like 'M%' --names start with 'M'. 

select * From Rooms 
where Night_rate Between 800 And 1500 -- rooms priced between 800 and 1500. 

---DMl

INSERT INTO Customer (Customer_Id, CName, Email)
VALUES (9011, 'Aliya Rashid', 'aliya@gmail.com') --Insert yourself as a guest (Guest ID = 9011). 


INSERT INTO Rooms (RNumber, Night_rate, RType, Branch_Id)
VALUES (205, 1200, 'Luxury', 2) -- Create a booking for room 205

ALTER TABLE Customer
ADD Contact_No VARCHAR(20),
    Proof_ID_Type VARCHAR(30); --add contact and proof to customer 

-- Insert another guest with NULL contact and proof details. 
insert into Customer (Customer_Id, CName, Email, Contact_No,Proof_ID_Type)
VALUES (9012, 'Mona Ahmed', 'mona@gmail.com', NULL, NULL); 

-- Add status to Booking
Alter Table Booking Add Statuss varchar(30)

--- Update your booking status to 'Confirmed
update Booking set Statuss ='confirmed'
where Booking_Id=1003

--Increase room prices by 10% for luxury rooms. 
update Rooms set Night_rate = Night_rate *1.10
where RType ='Luxury'

-- Update booking status to 'Completed' where checkout date is before today
update Booking set Statuss ='Completed'
where Check_Out < GETDATE() 

--- Delete bookings with status 'Cancelled'.
Delete from Booking 
where Statuss ='cancelled'


Select* from Rooms