CREATE DATABASE MY_DATABASE;

USE MY_DATABASE;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT,
    Major VARCHAR(50)
);

SHOW tables;
DESCRIBE Students;

ALTER TABLE Students
ADD GPA DECIMAL(3, 2);

DROP TABLE Students;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT,
    Major VARCHAR(50)
);

INSERT INTO Students (StudentID, Name, Age, Major)
VALUES (1, 'Alice Johnson', 20, 'Computer Science');

SELECT * from Students;

UPDATE Students
SET Major = 'Data Science'
WHERE StudentID = 1;

DELETE FROM Students
WHERE StudentID = 1;

INSERT INTO Students (StudentID, Name, Age, Major) VALUES
(1, 'Alice Johnson', 20, 'Computer Science'),
(2, 'Bob Smith', 22, 'Mathematics'),
(3, 'Charlie Brown', 19, 'History'),
(4, 'David Lee', 21, 'Computer Science'),
(5, 'Eve Wilson', 23, 'English'),
(6, 'Frank Miller', 20, 'Mathematics'),
(7, 'Grace Davis', 22, 'History'),
(8, 'Henry Garcia', 19, 'Computer Science'),
(9, 'Ivy Rodriguez', 21, 'English'),
(10, 'Jack Martinez', 23, 'Mathematics'),
(11, 'Karen White', 20, 'Computer Science'),
(12, 'Liam Green', 22, 'Mathematics'),
(13, 'Mia Taylor', 19, 'History'),
(14, 'Noah Anderson', 21, 'English'),
(15, 'Olivia Thomas', 23, 'Computer Science'),
(16, 'Peter Jackson', 20, 'Mathematics'),
(17, 'Quinn Moore', 22, 'History'),
(18, 'Ryan Martin', 19, 'English'),
(19, 'Sophia Thompson', 21, 'Computer Science'),
(20, 'Tyler Garcia', 23, 'Mathematics'),
(21, 'Ursula Perez', 20, 'Computer Science'),
(22, 'Victor Wilson', 22, 'Mathematics'),
(23, 'Wendy Sanchez', 19, 'History'),
(24, 'Xavier Clark', 21, 'English'),
(25, 'Yara Lewis', 23, 'Mathematics'),
(26, 'Zachary Young', 20, 'Computer Science'),
(27, 'Abigail Allen', 22, 'History'),
(28, 'Benjamin Wright', 19, 'English'),
(29, 'Caleb King', 21, 'Computer Science'),
(30, 'Daniel Scott', 23, 'Mathematics');

SELECT COUNT(*) FROM Students;

SELECT * FROM Students WHERE Major = 'Computer Science';

SELECT Major, COUNT(StudentID) AS StudentCount
FROM Students
GROUP BY Major;

SELECT Major, COUNT(StudentID) AS StudentCount
FROM Students
GROUP BY Major
HAVING COUNT(StudentID) < 7;

ALTER TABLE Students
ADD GPA DECIMAL(3, 2);

UPDATE Students
SET GPA = ROUND(RAND() * 4, 2);

SELECT * FROM Students LIMIT 10;

SELECT Name, GPA FROM Students ORDER BY GPA DESC LIMIT 10;

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    CourseName VARCHAR(100),
    EnrollmentDate DATE,  -- Optional: You might want to track when they enrolled
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

INSERT INTO Enrollments (StudentID, CourseName, EnrollmentDate) VALUES
(1, 'Introduction to Programming', '2024-09-05'),
(1, 'Calculus I', '2024-09-05'),
(3, 'Linear Algebra', '2024-09-05'),
(5, 'Introduction to Programming', '2024-09-05'),
(7, 'Calculus I', '2024-09-05'),
(9, 'Linear Algebra', '2024-09-05'),
(11, 'Introduction to Programming', '2024-09-05'),
(13, 'Calculus I', '2024-09-05'),
(15, 'Linear Algebra', '2024-09-05'),
(17, 'Introduction to Programming', '2024-09-05'),
(19, 'Calculus I', '2024-09-05'),
(21, 'Linear Algebra', '2024-09-05'),
(23, 'Introduction to Programming', '2024-09-05'),
(25, 'Calculus I', '2024-09-05'),
(27, 'Linear Algebra', '2024-09-05'),
(2, 'Probability and Statistics', '2024-09-05'),
(4, 'Differential Equations', '2024-09-05'),
(6, 'Probability and Statistics', '2024-09-05'),
(8, 'Differential Equations', '2024-09-05'),
(10, 'Probability and Statistics', '2024-09-05'),
(12, 'Differential Equations', '2024-09-05'),
(14, 'Probability and Statistics', '2024-09-05'),
(16, 'Differential Equations', '2024-09-05'),
(20, 'Differential Equations', '2024-09-05'),
(22, 'Probability and Statistics', '2024-09-05'),
(24, 'Differential Equations', '2024-09-05'),
(26, 'Probability and Statistics', '2024-09-05');

SELECT Students.Name, Enrollments.CourseName
FROM Students
INNER JOIN Enrollments ON Students.StudentID = Enrollments.StudentID;

SELECT Students.Name, Enrollments.CourseName
FROM Students
LEFT JOIN Enrollments ON Students.StudentID = Enrollments.StudentID;

SELECT s.*
FROM Students s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
WHERE e.StudentID IS NULL;

SELECT Name
FROM Students
WHERE StudentID IN (
    SELECT StudentID FROM Enrollments
);

SELECT Name, GPA, ROW_NUMBER() OVER (ORDER BY GPA DESC) AS `Rank`
FROM Students;

SELECT Major, Name, COUNT(*) OVER (PARTITION BY Major) AS TotalStudents
FROM Students LIMIT 10;

WITH StudentCounts AS (
    SELECT Major, COUNT(StudentID) AS StudentCount
    FROM Students
    GROUP BY Major
)
SELECT Major, StudentCount
FROM StudentCounts
WHERE StudentCount < 8;



--Find the average GPA of students in each major.

--Hint: Use GROUP BY and AVG() to calculate the average GPA for each Major.

SELECT Major, AVG(GPA) FROM Students GROUP BY Major;


--Identify the student(s) with the highest GPA in each major.

--Hint: Combine window functions (for example, RANK()) with PARTITION BY to rank students within each major and select the top-ranked student(s).

SELECT
    Major,
    Name,
    GPA
FROM (
    SELECT
        Major,
        Name,
        GPA,
        RANK() OVER (PARTITION BY Major ORDER BY GPA DESC) AS rnk
    FROM Students
) t
WHERE rnk = 1;



--Find the courses with the highest enrollment.

--Hint: Use GROUP BY and COUNT() on the Enrollments table to count enrollments per course and then sort by the count in descending order.

SELECT
    COUNT(StudentID) AS StudentCount,
    CourseName
FROM Enrollments
GROUP BY CourseName
ORDER BY StudentCount DESC;



--List students who are enrolled in both 'Introduction to Programming' and 'Calculus I'.

--Hint: Use subqueries or self-joins on the Enrollments table to find students enrolled in both courses.

SELECT s.StudentID, s.Name
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
WHERE e.CourseName IN ('Introduction to Programming', 'Calculus I')
GROUP BY s.StudentID, s.Name
HAVING COUNT(DISTINCT e.CourseName) = 2;




--Calculate the average age of students enrolled in each course.

--Hint: Join Students and Enrollments tables, then use GROUP BY and AVG() to calculate the average age of students in each course.

SELECT AVG(s.Age), e.CourseName
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
GROUP BY e.CourseName;



--Find the most common major among students enrolled in 'Linear Algebra'.

--Hint: Use a subquery to select students enrolled in 'Linear Algebra', then use GROUP BY and COUNT() to count students by major and sort to find the most common one.


SELECT
    s.Major,
    COUNT(*) AS StudentCount
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
WHERE e.CourseName = 'Linear Algebra'
GROUP BY s.Major
ORDER BY StudentCount DESC
LIMIT 1;

--allowing for ties:
SELECT Major, StudentCount
FROM (
    SELECT
        s.Major,
        COUNT(*) AS StudentCount,
        RANK() OVER (ORDER BY COUNT(*) DESC) AS rnk
    FROM Students s
    JOIN Enrollments e ON s.StudentID = e.StudentID
    WHERE e.CourseName = 'Linear Algebra'
    GROUP BY s.Major
) t
WHERE rnk = 1;





--Create a view that shows the student name, major, GPA, and the number of courses they are enrolled in.

--Hint: Combine Students and Enrollments tables, use GROUP BY to group by student, and then use COUNT() to count enrollments.


CREATE VIEW NumberOfCoursesEachStudentEnrolledIn AS
SELECT
    s.Name,
    s.Major,
    s.GPA,
    COUNT(e.CourseName) AS NumberOfEnrollments
FROM Students s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
GROUP BY
    s.Name,
    s.Major,
    s.GPA;

