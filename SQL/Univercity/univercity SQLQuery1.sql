create Database College 
use College

create Table Department (
Department_id int Primary key ,
DName Varchar(50) )

Create Table Faculty(
F_id int Primary key ,Name Varchar(50), MobileNo int ,
 Salary Decimal(10,2),Department int ,
 Foreign key (Department) References Department(Department_id))

 Create Table Hostel (
 Hostel_Id int Primary Key ,Hostel_Name varchar(50),Addres varchar(30),City varchar (30),
 states varchar (30), pin_code varchar (30), NofSeats int )

 Create Table Student (
 S_Id int Primary key identity (1,1) ,Fname varchar (20), Lname varchar(20),
 phoneNo varchar(20), DOB Date ,
 F_id int,
 Hostel_id int,
 Department_id int,
 Foreign Key ( F_id) References Faculty(F_id),
 Foreign Key ( Department_id) References Department(Department_id),
  Foreign Key ( Hostel_id) References Hostel(Hostel_Id))

  Create Table Corses (Course_Id int Primary key identity (1,1) ,
  CName Varchar (50) ,Duration varchar (50) ,
  DId int,
  Foreign Key (DId) References Department (Department_id))

  Create Table Student_Course (
   S_Id  int,
  Course_Id int ,
 Foreign Key ( S_Id) References Student( S_Id),
 Foreign Key (Course_Id) References Corses(Course_Id),
 Primary key ( S_Id ,Course_Id))

 Create table Exams( Exam_Code int primary key identity (1,1), 
 Dates Date not null ,times time , Room varchar(30),
 DId int,
  Foreign Key (DId) References Department (Department_id))

  Create table Subjects(Subject_id int primary Key identity (1,1),
  SubName varchar(50) not null ,
  F_Id int ,
  Foreign Key (  F_Id) References Faculty(F_id))

  create Table Student_Subject(
  S_id int,
  Subject_id int,
   Foreign Key (  S_id) References Student( S_Id),
    Foreign Key (  Subject_id) References Subjects( Subject_id),
	primary key (S_id,Subject_id ))

	Create Table Exam_Student(
	S_id int,
	Exam_code int,
	 Foreign Key (  S_id) References Student( S_Id),
    Foreign Key ( Exam_code) References Exams(Exam_Code),
	primary key (S_id,Exam_code))