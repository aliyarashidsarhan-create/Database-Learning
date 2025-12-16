
insert into Branch(BName,Location)
Values('Muscat hotel' ,'Muscat'),
      ('Sohar hotel' ,'Sohar'),
	  ('Salalah hotel' ,'Salalah')

insert into Customer(Customer_Id,CName, Email)
Values(1,'Ali Hassan','ali@gmail.com'),
      (2,'Sara Ahmed','Sara@gmail.com'),
	  (3,'Hamed Hassan','Hamed@gmail.com')

insert into Rooms(RNumber,Night_rate,RType,branch_Id)
values (101,25.5,'Single',2),
       (102,50.5,'Double',4),
       (203,100,'Suite',2)
       
insert into Staff(SName,Job_title,Salary ,Branch_Id)
 values('Mohamed','Manager',1500.0,2),
       ('Fatema','Reception',500.1,4),
	   ('hamed','clenar',350.0,6)

insert into Booking(Booking_Id ,Check_In,Check_Out,Customer_Id)
values(1001,'2025-01-10', '2025-01-15',1),
      (1002,'2025-02-12', '2025-02-15',2),
	  (1003,'2025-03-10', '2025-03-15',3)

insert into Staff_Booking(Staff_id,Booking_id)
values(3,1001),
      (8,1002),
	  (13,1003)

insert into Booking_Room(Booking_id,RNumber,Available_Status )
values (1001,101,'Reserved'),
       (1002,102,'Reserved'),
	   (1003,203,'Available')


Select * from Booking_Room
