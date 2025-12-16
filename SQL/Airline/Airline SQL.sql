create Database AirPort 
use AirPort 

Create Table Airport(Airport_code varchar(20) primary Key ,AName varchar(40) not null,
city Varchar(50), States Varchar(50))

Create Table Airplane_Type (TName varchar(50) Primary Key,
Company Varchar(40) not null , Max_Seats int )

Create Table AirePlane(airplane_id int Primary key ,TNSeat int,
TName varchar(50) , Foreign Key (TName) References Airplane_Type (TName))

Create Table Flight(Flight_No Varchar(20) Primary Key , 
Airline varchar(50) not null , weekdays varchar(50) ,Restrictions varchar(50))

create Table Flight_leg(leg_No int primary key identity(10,5),
Scheduld_DTime time not null , Scheduld_ArTime time not null, 
flight_No Varchar(20),
Airport_code varchar(20),
Foreign key (flight_No) references Flight(Flight_No),
Foreign key (Airport_code) references Airport(Airport_code))

create Table Leg_instance(instance_id int Primary key,
dates date , Arrival_Time time , Dep_Time time ,Available_Seat int , leg_No int , Airplane_id int ,
Foreign key (leg_No) references Flight_leg(leg_No),
Foreign key (Airplane_id) references AirePlane(airplane_id))


create Table Reservation(Reservation_Id int identity (2,2) primary key ,
CName varchar (50), CPhone varchar(20),
Seat_No int ,instance_id int ,
Foreign key (instance_id) references Leg_instance(instance_id))

Create Table Fare (Fare_Code varchar(30) primary key , amount Decimal(6,4),
flight_no varchar(20)
Foreign key (flight_No) references Flight(Flight_No))