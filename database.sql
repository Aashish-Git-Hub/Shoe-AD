
CREATE DATABASE School_Management_System;
GO

USE School_Management_System;
GO

CREATE TABLE Classes (
    ClassID INT IDENTITY(1,1) PRIMARY KEY,
    ClassName VARCHAR(50) NOT NULL,
    Section VARCHAR(10),
	RoomNumber varchar(10),
	Status VARCHAR(20) CHECK (Status IN ('Active','Inactive')),
	Capacity int CHECK (Capacity BETWEEN 0 AND 40)
);
INSERT INTO Classes (ClassName, Section, RoomNumber, Status, Capacity) VALUES
('Mathematics', 'A', '101', 'Active', 30),
('Science', 'A', '102', 'Active', 28),
('English', 'B', '103', 'Active', 35),
('History', 'B', '104', 'Inactive', 25),
('Geography', 'C', '105', 'Active', 20),
('Physics', 'C', '106', 'Active', 32),
('Chemistry', 'D', '107', 'Active', 30),
('Biology', 'D', '108', 'Active', 30),
('Computer', 'E', '109', 'Active', 40),
('Economics', 'E', '110', 'Active', 28),
('Art', 'F', '111', 'Active', 22),
('Music', 'F', '112', 'Active', 18),
('Sports', 'G', '113', 'Active', 25),
('Drama', 'G', '114', 'Inactive', 20),
('Psychology', 'H', '115', 'Active', 30),
('Sociology', 'H', '116', 'Active', 28),
('Philosophy', 'I', '117', 'Active', 26),
('Political Science', 'I', '118', 'Active', 24),
('Business Studies', 'J', '119', 'Active', 35),
('Accounting', 'J', '120', 'Active', 30);

CREATE TABLE Students (
    StudentID INT IDENTITY(1,1) PRIMARY KEY,
    FullName NVARCHAR(100) NOT NULL,
	ParentName NVARCHAR(100) NOT NULL,
    DOB DATE NOT NULL,
    Gender VARCHAR(10) CHECK (Gender IN ('Male','Female','Other')),
	ContactNo BIGINT NOT NULL,
	AddedDate DATETIME  DEFAULT GETDATE(),
	Address NVARCHAR(100),
	Status VARCHAR(20)CHECK (Status IN ('Active','Inactive')),
    ClassID INT,
	Remarks NVARCHAR(MAX)
	--ADDING CONSTRAINTS
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID)
);
INSERT INTO Students (FullName, ParentName, DOB, Gender, ContactNo, Address, Status, ClassID, Remarks) VALUES
('Sanjay Lama','Ramesh Lama','2008-05-12','Male',9802000011,'Kathmandu','Active',1,'Good'),
('Anita Rai','Hari Rai','2009-07-23','Female',9802000012,'Lalitpur','Active',2,'Excellent'),
('Bikash Shrestha','Ram Shrestha','2008-03-14','Male',9802000013,'Bhaktapur','Active',3,'Average'),
('Pooja Karki','Ramesh Karki','2009-11-05','Female',9802000014,'Kathmandu','Inactive',4,'Needs Improvement'),
('Rajan Thapa','Suresh Thapa','2008-08-19','Male',9802000015,'Lalitpur','Active',5,'Good'),
('Sita Gurung','Madan Gurung','2009-01-30','Female',9802000016,'Bhaktapur','Active',6,'Excellent'),
('Anil KC','Hari KC','2008-06-25','Male',9802000017,'Kathmandu','Active',7,'Average'),
('Maya Tamang','Ram Tamang','2009-02-12','Female',9802000018,'Lalitpur','Active',8,'Good'),
('Suman Lama','Gopal Lama','2008-12-10','Male',9802000019,'Bhaktapur','Active',9,'Excellent'),
('Rita Magar','Hari Magar','2009-04-03','Female',9802000020,'Kathmandu','Inactive',10,'Average'),
('Binod Thapa','Prakash Thapa','2008-09-22','Male',9802000021,'Lalitpur','Active',11,'Good'),
('Nisha Rai','Bishnu Rai','2009-10-15','Female',9802000022,'Bhaktapur','Active',12,'Excellent'),
('Dipesh Shrestha','Hari Shrestha','2008-11-30','Male',9802000023,'Kathmandu','Active',13,'Good'),
('Anju Khadka','Rajan Khadka','2009-03-28','Female',9802000024,'Lalitpur','Active',14,'Average'),
('Prakash KC','Suresh KC','2008-07-07','Male',9802000025,'Bhaktapur','Active',15,'Excellent'),
('Sunita Tamang','Hari Tamang','2009-06-16','Female',9802000026,'Kathmandu','Active',16,'Good'),
('Hari Bista','Ram Bista','2008-05-02','Male',9802000027,'Lalitpur','Active',17,'Excellent'),
('Manisha Shahi','Krishna Shahi','2009-09-09','Female',9802000028,'Bhaktapur','Inactive',18,'Average'),
('Rajan Thapa','Bikash Thapa','2008-08-11','Male',9802000029,'Kathmandu','Active',19,'Good'),
('Sujita Gurung','Madan Gurung','2009-12-01','Female',9802000030,'Lalitpur','Active',20,'Excellent');


CREATE TABLE Teachers (
    TeacherID INT IDENTITY(1,1) PRIMARY KEY,
    FullName VARCHAR(100),
	ParentName NVARCHAR(100),
	AddedDate DATETIME  DEFAULT GETDATE(),
    Contact BIGINT,
	Status VARCHAR(20) CHECK (Status IN ('Active','Inactive')),
	Address NVARCHAR(100),
    Email VARCHAR(100) UNIQUE
);
INSERT INTO Teachers (FullName, ParentName, AddedDate, Contact, Status, Address, Email) VALUES
('Rajesh Thapa','Suresh Thapa',GETDATE(),9801000011,'Active','Kathmandu','rajesh.thapa@email.com'),
('Sita Shrestha','Ram Shrestha',GETDATE(),9801000012,'Active','Lalitpur','sita.shrestha@email.com'),
('Anil KC','Hari KC',GETDATE(),9801000013,'Active','Bhaktapur','anil.kc@email.com'),
('Pooja Gurung','Madan Gurung',GETDATE(),9801000014,'Active','Kathmandu','pooja.gurung@email.com'),
('Ramesh Adhikari','Krishna Adhikari',GETDATE(),9801000015,'Inactive','Lalitpur','ramesh.adhikari@email.com'),
('Kiran Rai','Bikash Rai',GETDATE(),9801000016,'Active','Bhaktapur','kiran.rai@email.com'),
('Suman Lama','Gopal Lama',GETDATE(),9801000017,'Active','Kathmandu','suman.lama@email.com'),
('Rita Magar','Hari Magar',GETDATE(),9801000018,'Active','Lalitpur','rita.magar@email.com'),
('Binod Thapa','Prakash Thapa',GETDATE(),9801000019,'Active','Bhaktapur','binod.thapa@email.com'),
('Maya Karki','Ramesh Karki',GETDATE(),9801000020,'Active','Kathmandu','maya.karki@email.com'),
('Sujan Shahi','Ram Shahi',GETDATE(),9801000021,'Active','Lalitpur','sujan.shahi@email.com'),
('Nisha Rai','Bishnu Rai',GETDATE(),9801000022,'Active','Bhaktapur','nisha.rai@email.com'),
('Dipesh Shrestha','Hari Shrestha',GETDATE(),9801000023,'Inactive','Kathmandu','dipesh.shrestha@email.com'),
('Anju Khadka','Rajan Khadka',GETDATE(),9801000024,'Active','Lalitpur','anju.khadka@email.com'),
('Prakash KC','Suresh KC',GETDATE(),9801000025,'Active','Bhaktapur','prakash.kc@email.com'),
('Sunita Tamang','Hari Tamang',GETDATE(),9801000026,'Active','Kathmandu','sunita.tamang@email.com'),
('Hari Bista','Ram Bista',GETDATE(),9801000027,'Active','Lalitpur','hari.bista@email.com'),
('Manisha Shahi','Krishna Shahi',GETDATE(),9801000028,'Active','Bhaktapur','manisha.shahi@email.com'),
('Rajan Thapa','Bikash Thapa',GETDATE(),9801000029,'Active','Kathmandu','rajan.thapa@email.com'),
('Sujita Gurung','Madan Gurung',GETDATE(),9801000030,'Active','Lalitpur','sujita.gurung@email.com');



CREATE TABLE Subjects (
    SubjectID INT IDENTITY(1,1) PRIMARY KEY,
    SubjectName VARCHAR(100),
	SubjectCode VARCHAR(10) UNIQUE,
	Status VARCHAR(20)CHECK (Status IN ('Active','Inactive')),
	CreditHours INT CHECK (CreditHours BETWEEN 0 AND 4),
    TeacherID INT,
	--ADDING CONSTRAINTS
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)
);
INSERT INTO Subjects (SubjectName, SubjectCode, Status, CreditHours, TeacherID) VALUES
('Mathematics','MATH101','Active',4,1),
('Physics','PHYS101','Active',3,2),
('Chemistry','CHEM101','Active',3,3),
('Biology','BIO101','Active',3,4),
('English','ENG101','Active',2,5),
('History','HIS101','Active',2,6),
('Geography','GEO101','Active',2,7),
('Computer','COMP101','Active',4,8),
('Economics','ECON101','Active',3,9),
('Art','ART101','Active',2,10),
('Music','MUS101','Active',2,11),
('Sports','SPORT101','Active',2,12),
('Drama','DRAMA101','Active',2,13),
('Psychology','PSY101','Active',3,14),
('Sociology','SOC101','Active',3,15),
('Philosophy','PHIL101','Active',2,16),
('Political Science','POL101','Active',3,17),
('Business Studies','BUS101','Active',3,18),
('Accounting','ACC101','Active',3,19),
('Nepali','NEP101','Active',2,20);
CREATE TABLE Enrollments (
    EnrollmentID INT IDENTITY(1,1) PRIMARY KEY,
    StudentID INT,
    SubjectID INT,
	EnrollmentDate  DATETIME  DEFAULT GETDATE(),
	Status VARCHAR(20) CHECK (Status IN ('Active','Dropped','Completed')),
    AcademicYear VARCHAR(10),
	--ADDING CONSTRAINTS
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID)
);
INSERT INTO Enrollments (StudentID, SubjectID, Status, AcademicYear) VALUES
(1,1,'Active','2025'),
(2,2,'Active','2025'),
(3,3,'Active','2025'),
(4,4,'Dropped','2025'),
(5,5,'Active','2025'),
(6,6,'Active','2025'),
(7,7,'Active','2025'),
(8,8,'Active','2025'),
(9,9,'Completed','2025'),
(10,10,'Active','2025'),
(11,11,'Active','2025'),
(12,12,'Dropped','2025'),
(13,13,'Active','2025'),
(14,14,'Active','2025'),
(15,15,'Active','2025'),
(16,16,'Active','2025'),
(17,17,'Active','2025'),
(18,18,'Active','2025'),
(19,19,'Completed','2025'),
(20,20,'Active','2025');

CREATE TABLE Results (
    ResultID INT IDENTITY(1,1) PRIMARY KEY,
    EnrollmentID INT,
    SubjectID INT,
    Marks INT  CHECK (Marks BETWEEN 0 AND 100),
	Status VARCHAR(20)CHECK (Status IN ('Active','Inactive')),
	ExamDate date,
	Grade CHAR(2) CHECK (Grade IN ('A+','A','B+','B','C+','C','D+','D')),
	PassFail CHAR(2) CHECK (PassFail IN ('P','F')),
	Remarks NVARCHAR(MAX),
	ResultStatus VARCHAR(10)CHECK (ResultStatus IN ('Published','Pending'))
	--ADDING CONSTRAINTS
    FOREIGN KEY (EnrollmentID) REFERENCES Enrollments(EnrollmentID),
    FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID)
);
INSERT INTO Results (EnrollmentID, SubjectID, Marks, Status, ExamDate, Grade, PassFail, Remarks, ResultStatus) VALUES
(1,1,85,'Active','2026-01-10','A','P','Excellent','Published'),
(2,2,90,'Active','2026-01-11','A+','P','Outstanding','Published'),
(3,3,70,'Active','2026-01-12','B+','P','Good','Published'),
(4,4,40,'Inactive','2026-01-13','D','F','Needs Improvement','Pending'),
(5,5,88,'Active','2026-01-14','A','P','Excellent','Published'),
(6,6,76,'Active','2026-01-15','B','P','Good','Published'),
(7,7,92,'Active','2026-01-16','A+','P','Outstanding','Published'),
(8,8,60,'Active','2026-01-17','C','P','Average','Published'),
(9,9,55,'Active','2026-01-18','C+','P','Good','Published'),
(10,10,48,'Active','2026-01-19','D+','P','Needs Improvement','Published'),
(11,11,95,'Active','2026-01-20','A+','P','Outstanding','Published'),
(12,12,65,'Inactive','2026-01-21','B','P','Good','Pending'),
(13,13,80,'Active','2026-01-22','A','P','Excellent','Published'),
(14,14,73,'Active','2026-01-23','B+','P','Good','Published'),
(15,15,85,'Active','2026-01-24','A','P','Excellent','Published'),
(16,16,78,'Active','2026-01-25','B+','P','Good','Published'),
(17,17,88,'Active','2026-01-26','A','P','Excellent','Published'),
(18,18,67,'Active','2026-01-27','B','P','Good','Published'),
(19,19,90,'Active','2026-01-28','A+','P','Outstanding','Published'),
(20,20,50,'Active','2026-01-29','D+','P','Needs Improvement','Published');

CREATE VIEW StudentResultReport AS
SELECT 
    s.StudentID,
    s.FullName AS StudentName,
    c.ClassName,
    sub.SubjectName,
    e.AcademicYear,
    r.Marks,
    r.Grade,
    r.PassFail,
    r.ExamDate,
    r.ResultStatus
FROM Students s
JOIN Classes c 
    ON s.ClassID = c.ClassID
JOIN Enrollments e 
    ON s.StudentID = e.StudentID
JOIN Subjects sub 
    ON e.SubjectID = sub.SubjectID
JOIN Results r 
    ON e.EnrollmentID = r.EnrollmentID;

	CREATE PROCEDURE EnrollStudent
    @StudentID INT,
    @SubjectID INT,
    @AcademicYear VARCHAR(10)
AS
BEGIN
    INSERT INTO Enrollments (StudentID, SubjectID, Status, AcademicYear)
    VALUES (@StudentID, @SubjectID, 'Active', @AcademicYear);
END;



CREATE FUNCTION dbo.CalculateGrade
(
    @Marks INT
)
RETURNS CHAR(2)
AS
BEGIN
    DECLARE @Grade CHAR(2);

    IF @Marks BETWEEN 90 AND 100
        SET @Grade = 'A+';
    ELSE IF @Marks BETWEEN 80 AND 89
        SET @Grade = 'A';
    ELSE IF @Marks BETWEEN 70 AND 79
        SET @Grade = 'B+';
    ELSE IF @Marks BETWEEN 60 AND 69
        SET @Grade = 'B';
    ELSE IF @Marks BETWEEN 50 AND 59
        SET @Grade = 'C+';
    ELSE IF @Marks BETWEEN 40 AND 49
        SET @Grade = 'C';
    ELSE IF @Marks BETWEEN 33 AND 39
        SET @Grade = 'D';
    ELSE
        SET @Grade = 'F';

    RETURN @Grade;
END;


CREATE INDEX idx_studentid
ON Students(studentid);

BACKUP DATABASE School_Management_System
TO DISK = 'C:\Newdata\SQLBackups\School_Management_System.bak'
WITH FORMAT,
     MEDIANAME = 'SchoolBackup',
     NAME = 'Full Backup of School_Management_System';


	 -- Set the database to single-user mode
ALTER DATABASE School_Management_System
SET SINGLE_USER
WITH ROLLBACK IMMEDIATE;

-- Restore the database
RESTORE DATABASE School_Management_System
FROM DISK = 'C:\Newdata\SQLBackups\School_Management_System.bak'
WITH REPLACE,
     MOVE 'School_Management_System' TO 'C:\SQLData\School_Management_System.mdf',
     MOVE 'School_Management_System_log' TO 'C:\SQLData\School_Management_System_log.ldf';
