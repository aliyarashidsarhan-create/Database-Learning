create Database Online_Platform
use Online_Platform

CREATE TABLE Instructors ( 
InstructorID INT PRIMARY KEY, 
FullName VARCHAR(100), 
Email VARCHAR(100), 
JoinDate DATE 
); 
CREATE TABLE Categories ( 
CategoryID INT PRIMARY KEY, 
CategoryName VARCHAR(50) 
); 
CREATE TABLE Courses ( 
CourseID INT PRIMARY KEY, 
Title VARCHAR(100), 
InstructorID INT, 
CategoryID INT, 
Price DECIMAL(6,2), 
PublishDate DATE, 
FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID), 
FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID) 
); 
CREATE TABLE Students ( 
StudentID INT PRIMARY KEY, 
FullName VARCHAR(100), 
Email VARCHAR(100), 
JoinDate DATE 
); 
CREATE TABLE Enrollments ( 
EnrollmentID INT PRIMARY KEY, 
StudentID INT, 
CourseID INT, 
EnrollDate DATE, 
CompletionPercent INT, 
Rating INT CHECK (Rating BETWEEN 1 AND 5), 
FOREIGN KEY (StudentID) REFERENCES Students(StudentID), 
FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) 
);