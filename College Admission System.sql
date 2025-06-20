CREATE DATABASE CollegeAdmissionSystem;
USE CollegeAdmissionSystem;

-- Student Table
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    DOB DATE,
    Gender VARCHAR(10),
    Contact VARCHAR(20),
    Address VARCHAR(255),
    Email VARCHAR(100),
    HighSchoolMarks DECIMAL(5,2),
    AppliedCourseID INT
);

-- Department Table
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100),
    HOD VARCHAR(100)
);

-- Course Table
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Duration VARCHAR(50),
    EligibilityCriteria TEXT,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

-- Admin/Staff Table
CREATE TABLE AdminStaff (
    StaffID INT PRIMARY KEY,
    Username VARCHAR(50),
    Password VARCHAR(50),
    Role ENUM('Admin', 'Clerk', 'Reviewer')
);

-- Admission Table
CREATE TABLE Admission (
    AdmissionID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    AdmissionDate DATE,
    Status ENUM('Pending', 'Approved', 'Rejected'),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

-- Insert Departments
INSERT INTO Department VALUES
(1, 'Computer Science', 'Dr. Smith'),
(2, 'Business', 'Dr. Alice'),
(3, 'Engineering', 'Dr. John'),
(4, 'Mathematics', 'Dr. Rose'),
(5, 'Physics', 'Dr. Max'),
(6, 'Chemistry', 'Dr. Clara'),
(7, 'Biology', 'Dr. Nora'),
(8, 'Psychology', 'Dr. Brown'),
(9, 'Economics', 'Dr. Blake'),
(10, 'English', 'Dr. Carter');

-- Insert Courses
INSERT INTO Course VALUES
(101, 'BSc Computer Science', '4 years', '70%+ in High School', 1),
(102, 'BBA', '4 years', '65%+ in High School', 2),
(103, 'BE Mechanical', '4 years', '75%+ in High School', 3),
(104, 'BSc Mathematics', '4 years', '70%+ in High School', 4),
(105, 'BSc Physics', '4 years', '70%+ in High School', 5),
(106, 'BSc Chemistry', '4 years', '70%+ in High School', 6),
(107, 'BSc Biology', '4 years', '70%+ in High School', 7),
(108, 'BA Psychology', '4 years', '65%+ in High School', 8),
(109, 'BA Economics', '4 years', '65%+ in High School', 9),
(110, 'BA English', '4 years', '65%+ in High School', 10);

-- Insert Students
INSERT INTO Student VALUES
(1, 'Ali', '2005-01-10', 'Male', '03001234567', 'Lahore', 'ali@example.com', 82.5, 101),
(2, 'Sara', '2004-06-22', 'Female', '03009876543', 'Karachi', 'sara@example.com', 88.0, 102),
(3, 'Ahmed', '2005-09-15', 'Male', '03001112222', 'Islamabad', 'ahmed@example.com', 77.2, 103),
(4, 'Hina', '2004-11-05', 'Female', '03003334444', 'Faisalabad', 'hina@example.com', 85.4, 104),
(5, 'Zain', '2005-03-12', 'Male', '03005556666', 'Multan', 'zain@example.com', 71.1, 105),
(6, 'Noor', '2004-07-25', 'Female', '03007778888', 'Peshawar', 'noor@example.com', 79.6, 106),
(7, 'Usman', '2005-02-17', 'Male', '03009990000', 'Quetta', 'usman@example.com', 80.2, 107),
(8, 'Ayesha', '2004-12-30', 'Female', '03111112222', 'Rawalpindi', 'ayesha@example.com', 90.0, 108),
(9, 'Bilal', '2005-08-18', 'Male', '03222223333', 'Sialkot', 'bilal@example.com', 67.8, 109),
(10, 'Mehak', '2004-04-01', 'Female', '03333334444', 'Gujranwala', 'mehak@example.com', 84.3, 110);

-- Insert AdminStaff
INSERT INTO AdminStaff VALUES
(1, 'admin1', 'pass123', 'Admin'),
(2, 'clerk1', 'pass234', 'Clerk'),
(3, 'rev1', 'pass345', 'Reviewer'),
(4, 'admin2', 'pass456', 'Admin'),
(5, 'clerk2', 'pass567', 'Clerk'),
(6, 'rev2', 'pass678', 'Reviewer'),
(7, 'admin3', 'pass789', 'Admin'),
(8, 'clerk3', 'pass890', 'Clerk'),
(9, 'rev3', 'pass901', 'Reviewer'),
(10, 'admin4', 'pass012', 'Admin');

-- Insert Admissions
INSERT INTO Admission VALUES
(1001, 1, 101, '2025-06-01', 'Pending'),
(1002, 2, 102, '2025-06-02', 'Approved'),
(1003, 3, 103, '2025-06-03', 'Rejected'),
(1004, 4, 104, '2025-06-04', 'Pending'),
(1005, 5, 105, '2025-06-05', 'Approved'),
(1006, 6, 106, '2025-06-06', 'Rejected'),
(1007, 7, 107, '2025-06-07', 'Approved'),
(1008, 8, 108, '2025-06-08', 'Pending'),
(1009, 9, 109, '2025-06-09', 'Rejected'),
(1010, 10, 110, '2025-06-10', 'Approved');

-- 5 Queries

-- List all students who applied for the BSCS Course:
SELECT Name, Email 
FROM Student 
WHERE AppliedCourseID = 101;

-- All departments with their HODs:
SELECT DepartmentName, HOD 
FROM Department;

-- Courses with duration of 4 years:
SELECT CourseName 
FROM Course 
WHERE Duration = '4 years';

-- Admissions with 'Approved' status:
SELECT * 
FROM Admission 
WHERE Status = 'Approved';

-- List details of female students:
SELECT Name, Contact 
FROM Student 
WHERE Gender = 'Female';

-- NOW JOIN QUERIES

-- Student names along with the name of the course they applied to:
SELECT s.Name, c.CourseName 
FROM Student s
JOIN Course c ON s.AppliedCourseID = c.CourseID;

-- All admissions with student name and course name: 
SELECT a.AdmissionID, s.Name, c.CourseName, a.Status 
FROM Admission a
JOIN Student s ON a.StudentID = s.StudentID
JOIN Course c ON a.CourseID = c.CourseID;

-- All courses with their department name:
SELECT c.CourseName, d.DepartmentName 
FROM Course c
JOIN Department d ON c.DepartmentID = d.DepartmentID;

-- All admission records with admin role who may manage them (assume StaffID is managed separately):
SELECT a.AdmissionID, s.Name, ad.Role 
FROM Admission a
JOIN Student s ON a.StudentID = s.StudentID
JOIN AdminStaff ad ON ad.Role = 'Admin';

-- All students along with the department of the course they applied for:
SELECT s.Name, d.DepartmentName 
FROM Student s
JOIN Course c ON s.AppliedCourseID = c.CourseID
JOIN Department d ON c.DepartmentID = d.DepartmentID;

-- NOW 5 Nested (Subqueries):

-- names of students who applied for a course in the 'Engineering' department:
SELECT Name 
FROM Student 
WHERE AppliedCourseID IN (
    SELECT CourseID 
    FROM Course 
    WHERE DepartmentID = (
        SELECT DepartmentID FROM Department WHERE DepartmentName = 'Engineering'
    )
);

-- names of students who have an admission status of 'Pending':
SELECT Name 
FROM Student 
WHERE StudentID IN (
    SELECT StudentID FROM Admission WHERE Status = 'Pending'
);

--  all courses offered by departments headed by 'Dr. Smith':
SELECT CourseName 
FROM Course 
WHERE DepartmentID IN (
    SELECT DepartmentID FROM Department WHERE HOD = 'Dr. Smith'
);

-- students whose high school marks are above the average:
SELECT Name 
FROM Student 
WHERE HighSchoolMarks > (
    SELECT AVG(HighSchoolMarks) FROM Student
);

-- students who haven't been approved yet:
SELECT Name 
FROM Student 
WHERE StudentID IN (
    SELECT StudentID FROM Admission WHERE Status != 'Approved'
);

-- 5 Aggregate Functions Queries

-- Find average high school marks of all students:
SELECT AVG(HighSchoolMarks) AS AverageMarks 
FROM Student;

-- Count number of students in each course:
SELECT AppliedCourseID, COUNT(*) AS StudentCount 
FROM Student 
GROUP BY AppliedCourseID;

-- Find total number of admissions with status 'Approved':
SELECT COUNT(*) AS ApprovedAdmissions 
FROM Admission 
WHERE Status = 'Approved';

-- department with the maximum number of courses:
SELECT DepartmentID, COUNT(*) AS CourseCount 
FROM Course 
GROUP BY DepartmentID 
ORDER BY CourseCount DESC 
LIMIT 1;

-- highest school marks:     
SELECT MAX(HighSchoolMarks) AS TopMarks 
FROM Student;

-- NOW 5 Queries Using Wildcard Operators:

-- Find students whose names start with 'A':
SELECT * FROM Student 
WHERE Name LIKE 'A%';

-- emails ending with '@example.com':
SELECT Name, Email 
FROM Student 
WHERE Email LIKE '%@example.com';

--  courses that contain 'Science' in their name:
SELECT * FROM Course 
WHERE CourseName LIKE '%Science%';

-- departments with 'e' as the second letter:
SELECT * FROM Department 
WHERE DepartmentName LIKE '_e%';

--  admin usernames that include the word 'admin':
SELECT * FROM AdminStaff 
WHERE Username LIKE '%admin%';
  