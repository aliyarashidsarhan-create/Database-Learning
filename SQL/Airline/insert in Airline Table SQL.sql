
insert into Airport(Airport_code,AName,city,States)
Values('MCT','Muscat Airport','Muscat','Oman'),
      ('DB','Dubai Airport','Dubai','UAE'),
	  ('DOh','Hamad  Airport','Doha','Qatar')

insert into Airplane_Type(TName,Company,Max_Seats)
values  ('A33','Air1',180),
        ('B22','Air2',190),
		('C44','Air3',200)

insert into AirePlane(airplane_id,TNSeat,TName)
Values (101,180,'A33'),
       (102,150,'B22'),
       (103,190,'C44')

insert into Flight(Flight_No,Airline,weekdays,Restrictions)
values ('Om101','Oman Air ','Sun,Mon','None'),
       ('Do102','UAE Air ','Daily','No '),
	   ('Do101','Qatar Air ','Sun','None')

insert into Flight_leg(Scheduld_DTime,Scheduld_ArTime,flight_No,Airport_code)
Values ('08:00', '09:30', 'OM101', 'MCT'),
        ('10:00', '11:45', 'Do102', 'DB'),
		('09:00', '10:30', 'Do101', 'DOh')

insert into Leg_instance(instance_id,dates,Arrival_Time,Dep_Time,Available_Seat,leg_No,Airplane_id)
   Values (1, '2025-01-10', '09:30', '08:00', 50, 10, 101),
          (2, '2025-01-11', '11:45', '10:00', 40, 15, 102),
		  (3, '2025-01-15', '12:45', '10:00', 40, 20, 103)

insert into Reservation(CName,CPhone,Seat_No,instance_id)
values ('Ali Ahmed', '96891234567', 12, 1),
       ('Sara Hassan', '971501234567', 15, 2),
	   ('Aliya Rashid', '971501234599', 12, 3)

insert into Fare(Fare_Code,amount,flight_no)
 values ('FOM101', 150.5, 'OM101'),
        ('FDo202', 300.7, 'Do102'),
		('FDo101', 200.7, 'Do101')

		Alter Table Fare Alter column amount Decimal(8,4)
	Select * From Fare