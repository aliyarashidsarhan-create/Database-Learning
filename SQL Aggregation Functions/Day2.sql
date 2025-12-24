--Part 4: JOIN + Aggregation 
--1. Course title + instructor name + enrollments. 
select C.Title As CourseTitle,I.FullName As InstructorName,
count(E.EnrollmentID) As TotalEnrollments
from Courses C 
join Instructors I on I.InstructorID=C.InstructorID
join Enrollments E on C.CourseID=E.CourseID
group by c.Title ,I.FullName

--2. Category name + total courses + average price. 
select Ca.CategoryName ,count (c.CourseID) As TotalCourses ,avg(c.Price) as avgPrice
from Categories ca
left Join Courses c on ca.CategoryID=c.CategoryID
group by Ca.CategoryName

--3. Instructor name + average course rating. 
select I.FullName AS InstructorName ,AVG(e.Rating) AS AverageRating
from Instructors i
join Courses c on c.InstructorID=i.InstructorID
join Enrollments e on e.CourseID=c.CourseID
group by I.FullName
--4. Student name + total courses enrolled. 
select S.FullName As StudentName,count(e.CourseID) As TotalCourse
from Students s
left Join Enrollments e on  e.StudentID=s.StudentID
group by S.FullName

--5. Category name + total enrollments. 
select Ca.CategoryName ,count(e.EnrollmentID)  AS TotalEnrollments
from Categories ca
join Courses c on c.CategoryID=ca.CategoryID
left join Enrollments e on e.CourseID=c.CourseID
group by Ca.CategoryName 

--6. Instructor name + total revenue. 
select I.FullName ,SUM(c.Price) As TotalRevenue
from Instructors i
join Courses c on c.InstructorID=i.InstructorID
JOIN Enrollments e ON c.CourseID = e.CourseID
group by I.FullName

--7. Course title + % of students completed 100%.
select c.Title ,e.CompletionPercent
from Courses c 
join Enrollments e on c.CourseID=e.CourseID
where e.CompletionPercent=100
---------------------------------------------------------------------
--Use HAVING only. 
--1. Courses with more than 2 enrollments. 
select c.Title ,count(e.EnrollmentID) As TotalEnroll
from Courses c
join Enrollments e on c.CourseID=e.CourseID
group by c.Title  
Having count(e.EnrollmentID)>2

--2. Instructors with average rating above 4. 
select I.fullName ,avg(e.Rating) As AverageRate
from Instructors i
join Courses c on i.InstructorID=c.InstructorID
join Enrollments e on e.CourseID=c.CourseID
group by I.FullName
having avg(e.Rating) > 4

--3. Courses with average completion below 60%. 
select c.Title ,avg(e.CompletionPercent)
from Courses c
join Enrollments e on e.CourseID=c.CourseID
group by c.Title
having avg(e.CompletionPercent)<60

--4. Categories with more than 1 course. 
select Ca.CategoryName ,count(c.CourseID)
from Categories ca
join Courses c on ca.CategoryID=c.CategoryID
group by Ca.CategoryName
having count(c.CourseID) >1 

--5. Students enrolled in at least 2 courses.
select  s.FullName,COUNT(e.CourseID) AS TotalCourses
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
GROUP BY s.FullName
HAVING COUNT(e.CourseID) >= 2

-----------------------------------------------------------------
--Part 6: Analytical Thinking 
--Answer using SQL + short explanation: 
--1. Best performing course. 
select top 1 c.Title,
    AVG(e.Rating) AS AvgRating
FROM Courses c
JOIN Enrollments e ON c.CourseID = e.CourseID
group by c.Title
order by AVG(e.Rating) DESC

--2. Instructor to promote. 
select Top 1 i.FullName, AVG(e.Rating) AS AvgRating
FROM Instructors i
JOIN Courses c ON i.InstructorID = c.InstructorID
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY i.FullName
ORDER BY AVG(e.Rating) DESC
--3. Highest revenue category. 
select Top 1 Ca.CategoryName,  SUM(c.Price) AS TotalRevenue
from Categories ca 
join Courses c on c.CategoryID=ca.CategoryID
group by  Ca.CategoryName
order by SUM(c.Price) Desc

--4. Do expensive courses have better ratings? 
select
    CASE 
        WHEN c.Price >= 40 THEN 'Expensive'
        ELSE 'Affordable'
    END AS PriceGroup,
    AVG(e.Rating) AS AvgRating
FROM Courses c
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY 
    CASE 
        WHEN c.Price >= 40 THEN 'Expensive'
        ELSE 'Affordable'
    END

--5. Do cheaper courses have higher completion?
select 
    CASE 
        WHEN c.Price < 30 THEN 'Cheap'
        ELSE 'Not Cheap'
    END AS PriceGroup,
    AVG(e.CompletionPercent) AS AvgCompletion
FROM Courses c
JOIN Enrollments e ON c.CourseID= e.CourseID
GROUP BY 
    CASE 
        WHEN c.Price < 30 THEN 'Cheap'
        ELSE 'Not Cheap'
    END
------------------------------------------------------
------------------------------------------------------
--Final Challenge – Mini Analytics Report 
--1. Top 3 courses by revenue. 
select top 3
    c.Title,
    COUNT(e.EnrollmentID) * c.Price AS Revenue
FROM Courses c
JOIN Enrollments e ON c.CourseID = e.CourseID
group by c.Title, c.Price
order by Revenue DESC
--Explanation :Courses are ranked by total money earned from enrollments.

--2. Instructor with most enrollments. 
select top  1   i.FullName,
    COUNT(e.EnrollmentID) AS TotalEnrollments
FROM Instructors i
JOIN Courses c ON i.InstructorID = c.InstructorID
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY i.FullName
ORDER BY COUNT(e.EnrollmentID) DESC
--Explanation :This finds the instructor whose courses have the highest number of enrollments

--3. Course with lowest completion rate. 
select top 1 
    c.Title,
   Avg(e.CompletionPercent) AS AvgCompletion
FROM Courses c
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.Title
ORDER BY Avg(e.CompletionPercent)
--Explanation :The course with the lowest average completion percentage is identified.

--4. Category with highest average rating. 
select Top 1
    cat.CategoryName,
    AVG(e.Rating) AS AvgRating
FROM Categories cat
JOIN Courses c ON cat.CategoryID = c.CategoryID
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY cat.CategoryName
ORDER BY AVG(e.Rating) DESC
--Explanation :Categories are compared based on the average rating of their courses

--5. Student enrolled in most courses. 
select Top 1
    s.FullName,
    COUNT(e.CourseID) AS TotalCourses
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
GROUP BY s.FullName
ORDER BY COUNT(e.CourseID) DESC

--Explanation :This finds the student who enrolled in the highest number of courses.
