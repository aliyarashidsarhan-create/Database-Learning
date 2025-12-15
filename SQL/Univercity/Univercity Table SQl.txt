
insert into Department (Department_id ,DName)
Values(1,'Computer Science'),
       (2,'Networking'),
	   (3,'IT'),
	   (4,'Business')

Insert into Hostel(Hostel_Id,Hostel_Name,Addres,City,states,pin_code,NofSeats)
values (1,'Alnoor','Street1','Muscat','Oman','100',100),
       (2,'Alamal','Street2','Sohar','Oman','200',103),
	   (3,'Banorama','Street3','Shinas','Oman','300',105),
	   (4,'Alali','Street4','Sur','Oman','400',109)

Insert into Faculty(F_id ,Name , MobileNo,Salary,Department)
 Values             (11,'Ali' ,92345,600,1),
                      (12,'Mohamed' ,923578,800,2),
                    (13,'Fatema' ,927624,900,3),
                      (14,'Sara' ,923875,1000,4)

Insert into Student(Fname,Lname,phoneNo, DOB,F_id,Hostel_id,Department_id)
 Values ('Aish','Ahmed','972847','2002-05-12',11,1,1),
        ('salma','Ahmed','9723457','2004-05-11',12,2,2),
		('Moza','mohmed','9723468','2001-06-12',11,1,3),
		('Ali','Ahmed','972822','2000-09-12',11,4,4)

		
Insert into Corses(CName,Duration, DId)
Values ('Database','1 month',1),
       ('Web','3month',2),
	   ('Java','2 month',3),
	   ('C','4 month',4)

insert into Student_Course(S_Id ,Course_Id)
values (1,2),
       (2,1),
	   (3,4),
	   (4,3)


insert into Exams(Dates,times,Room, DId)
Values    ('2025-01-15', '10:00','A1',1),
           ('2025-01-30', '10:00','A2',2),
			('2025-02-15', '11:00','A3',3),
			('2025-02-20', '12:00','A4',4)

insert into Subjects(SubName,F_Id)
Values ('Programming',11),
        ('Databace',12),
		('Security',13),
		('Math',14)

insert into Student_Subject(S_id,Subject_id)
values (1,2),
       (2,3),
	   (3,4),
	   (4,1)

insert into Exam_Student(S_id,Exam_code)
values (1,13),
       (2,14),
	   (3,15),
	   (4,16)

Select * from Exam_Student


