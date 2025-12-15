
Select * from Student --Display all student records.

Select Fname +' '+ Lname As Full_Name,enrollment_date,Status From Student --Display each student's full name, enrollment date, and current status.

Select CName As Cource_Title , Duration From Corses --Display each course title and Duration.

Select Fname +' '+ Lname As Full_Name,GPA As GPA_Score From Student --Display each student’s full name and GPA

select S_Id ,Fname from Student where GPA>3.5 --List student IDs and names of students with GPA greater than 3.5

Select * From Student where enrollment_date < '2022-01-01' --List students who enrolled before 2022. 

Select * from Student where GPA Between 3.0 And  3.5 --. Display students with GPA between 3.0 and 3.5. 

Select * from Student order by GPA Desc -- Display students ordered by GPA descending. 

Select MAX(GPA) As Max_GPA,
      MIN(GPA) As MIN_GPA,
	  AVG(GPA) AS Avg_GPA
From Student  --Display the maximum, minimum, and average GPA. 

Select COUNT(*) As Total_Student From Student -- Display total number of students. 

Select * From Student Where Fname Like '%a' -- Display students whose names end with 'a'.

Select * from Student where Advisor is Null -- Display students with NULL advisor.

select * from Student where Year(enrollment_date)=2021 -- Display students enrolled in 2021.

-- DML 
Insert into Student (S_Id,Fname,Lname,phoneNo, DOB,F_id,Hostel_id,Department_id,enrollment_date , Status,GPA,Advisor)
Values (300045,'Aliya','Rashid','976432','1997-03-31',12,4,4,'2021-06-24','Active',3.7,'M.Ahmed') -- Insert your data as a new student (Student ID = 300045, Program ID = 2, GPA = 3.6). 

Insert into Student (S_Id,Fname,Lname,phoneNo, DOB,F_id,Hostel_id,Department_id,enrollment_date , Status,GPA,Advisor)
Values (30,'Sara','hamed','9764333','1998-03-11',11,3,3,'2021-06-24','Active',Null,Null) -- Insert another  GPA and advisor set to NULL.

Update Student set GPA =GPA + 0.2 where S_Id =300045 --Increase your GPA by 0.2.

update Student set GPA =2.0 Where GPA < 2.0 --. Set GPA to 2.0 for students with GPA below 2.0. 

update Student set GPA =GPA +0.1
Where enrollment_date < '2020-01-01' --  Increase GPA by 0.1 for students enrolled before 2020. 

Delete from Student where Status ='leave' --Delete students with status 'Inactive'. 

Set Identity_Insert Student On 
Select * from Student