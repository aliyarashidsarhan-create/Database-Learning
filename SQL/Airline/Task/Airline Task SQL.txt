
Select * From Flight_leg --Display all flight leg records. 

Select leg_No ,Scheduld_DTime , Scheduld_ArTime 
from Flight_leg  -- Display each flight leg ID, scheduled departure time, and arrival time.

select airplane_id ,TName,TNSeat As seat_Capacity 
From AirePlane --Display each airplane’s ID, type, and seat capacity. 

select leg_No , Available_Seat AS AvailableSet
From Leg_instance --light leg’s ID and available seats as AvailableSeats.

select leg_No from Leg_instance
where  Available_Seat > 100 --light leg IDs with available seats greater than 100. 

select Airport_code , AName From Airport
where city ='Muscat' --. Display airport codes and names where city = 'Muscat'.

select leg_No from Leg_instance
where dates ='2025-06-10' --Display flight legs scheduled on 2025-06-10.

select leg_No ,Dep_Time From Leg_instance
Order by Dep_Time --Display flight legs ordered by departure time.

select MAX(Available_Seat) As Max_Set,
       MIN(Available_Seat) As Min_Set,
	   AVg(Available_Seat) As AVG_Set
From Leg_instance  -- maximum, minimum, and average available seats. 

select Count(*) As Total_Flight
From Flight_leg  --. Display total number of flight legs. 

--DMl
INSERT INTO Flight_leg (Scheduld_DTime, Scheduld_ArTime, flight_No, Airport_code)
Values ('10:00', '14:00', 'OM101', 'CAI')
INSERT INTO Leg_instance
(instance_id, dates, Arrival_Time, Dep_Time, Available_Seat, leg_No, Airplane_id)
VALUES (10, '2025-06-10', '14:00', '10:00', 120, 20, 101) --a new flight leg departing from 'CAI' to 'DXB' on 2025-06-10. 

INSERT INTO Reservation (CName, CPhone, Seat_No, instance_id)
VALUES ('Mohamed Ali', NULL, 19, 3) --Insert a customer with NULL contact number

update Leg_instance 
set Available_Seat = Available_Seat - 5 
where instance_id =1  --Reduce available seats of your inserted flight leg by 5

update Airplane_Type 
set Max_Seats = Max_Seats + 20 
where Max_Seats < 150  --  seat capacity by +20 where capacity < 150. 

Delete from Flight_leg where flight_No In(
select flight_No from Flight 
where Restrictions ='Canceled' -- Delete canceled flight legs.

Select * from Flight_leg
  