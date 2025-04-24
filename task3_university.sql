
CREATE DATABASE UniversityDB;
USE UniversityDB;

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    gender VARCHAR(10)
);

INSERT INTO Students VALUES
(1, 'Alice', 20, 'Female'),
(2, 'Bob', 22, 'Male'),
(3, 'Charlie', 21, 'Male'),
(4, 'Diana', 23, 'Female');

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    professor_id INT
);

INSERT INTO Courses VALUES
(101, 'Data Science', 1),
(102, 'Database Systems', 2),
(103, 'Algorithms', 1);

CREATE TABLE Professors (
    professor_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50)
);

INSERT INTO Professors VALUES
(1, 'Dr. Smith', 'Computer Science'),
(2, 'Dr. Lee', 'Information Systems');

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    marks INT
);

INSERT INTO Enrollments VALUES
(1, 1, 101, 85),
(2, 1, 102, 90),
(3, 2, 101, 75),
(4, 3, 103, 80),
(5, 4, 102, 88);

SELECT * FROM Students;
SELECT name FROM Students WHERE gender = 'Female';
SELECT name, age FROM Students ORDER BY age DESC;
SELECT gender, AVG(age) AS avg_age FROM Students GROUP BY gender;

SELECT S.name, C.course_name, E.marks
FROM Students S
JOIN Enrollments E ON S.student_id = E.student_id
JOIN Courses C ON E.course_id = C.course_id;

SELECT P.name, C.course_name
FROM Professors P
LEFT JOIN Courses C ON P.professor_id = C.professor_id;

CREATE VIEW StudentCourseMarks AS
SELECT S.name AS student_name, C.course_name, E.marks
FROM Students S
JOIN Enrollments E ON S.student_id = E.student_id
JOIN Courses C ON E.course_id = C.course_id;

CREATE INDEX idx_student_id ON Enrollments(student_id);
