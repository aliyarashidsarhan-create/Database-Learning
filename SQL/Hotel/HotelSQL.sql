create Database Hotel 
use Hotel

Create table Branch(Branch_Id int Primary key identity (2,2),
BName varchar(30) , Location varchar(50)) -- create table Branch

Create table Staff(Staff_Id int primary key identity (3,5),
SName varchar(30) ,Job_title varchar(50), Salary decimal(10,3),
Branch_Id int, Foreign key( Branch_Id) references Branch(Branch_Id)) --create table Staff

create table Rooms(RNumber int primary key , Night_rate Decimal(10,2),
RType Varchar(40) ,branch_Id int,
 Foreign key( branch_Id) references Branch(Branch_Id))-- create table Rooms

 Create table Customer(Customer_Id int primary key ,CName varchar(30),
 Email varchar(80)) -- create table customer 

 Create table Booking(Booking_Id int primary key , Check_In date ,
 Check_Out date , Customer_Id int ,
 Foreign key( Customer_Id ) references Customer(Customer_Id )) --create table Booking

 Create table Staff_Booking(Staff_id int, Booking_id int,
  Foreign key( Staff_id ) references Staff(Staff_Id ),
   Foreign key( Booking_id) references Booking(Booking_Id ),
   Primary Key(Staff_id,Booking_id)) --create table Staff Boking (M:M)

   Create table Booking_Room(Booking_id int ,RNumber int ,
   Available_Status varchar(30),
   Foreign key( RNumber ) references Rooms(RNumber ),
   Foreign key( Booking_id) references Booking(Booking_Id ),
   Primary Key(RNumber,Booking_id)) -- create table Booking Room (M:M)