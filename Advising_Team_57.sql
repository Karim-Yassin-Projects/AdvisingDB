CREATE DATABASE Advising_Team_57
USE Advising_Team_57

GO

CREATE OR ALTER PROC CreateAllTables AS

CREATE TABLE Advisor(
advisor_id INT PRIMARY KEY IDENTITY,
advisor_name VARCHAR(40) NOT NULL,
email VARCHAR(40) NOT NULL,
office VARCHAR(40) NOT NULL,
password VARCHAR(40) NOT NULL
)

CREATE TABLE Student (
student_id int PRIMARY KEY IDENTITY,
f_name VARCHAR(40) NOT NULL,
l_name VARCHAR(40) NOT NULL,
Gpa decimal(3,2),
faculty VARCHAR(40) NOT NULL,
email VARCHAR(40) NOT NULL,
major VARCHAR(40) NOT NULL,
password VARCHAR(40) NOT NULL,
financial_status BIT NOT NULL,
semester INT NOT NULL,
acquired_hours INT,
assigned_hours INT,
advisor_id INT NOT NULL,
CONSTRAINT FK_Stud_Advisor FOREIGN KEY(advisor_id) REFERENCES Advisor(advisor_id)
)

CREATE TABLE Student_Phone(
student_id INT,
phone_number VARCHAR(40),
PRIMARY KEY(phone_number, student_id),
CONSTRAINT FK_Stud_Phone FOREIGN KEY(student_id) REFERENCES Student(student_id) 
)

CREATE TABLE Course(
course_id INT PRIMARY KEY IDENTITY,
course_name VARCHAR(40) NOT NULL,
major VARCHAR(40) NOT NULL,
is_offered BIT NOT NULL,
credit_hours INT NOT NULL,
semester INT NOT NULL
)

CREATE TABLE PreqCourse_course(
prerequisite_course_id INT,
course_id INT
PRIMARY KEY(prerequisite_course_id, course_id)
CONSTRAINT FK_Preq_Course FOREIGN KEY(prerequisite_course_id) REFERENCES Course(course_id),
CONSTRAINT FK_Preq_Course2 FOREIGN KEY(course_id) REFERENCES Course(course_id)
)

CREATE TABLE Instructor(
instructor_id INT PRIMARY KEY IDENTITY,
instructor_name VARCHAR(40) NOT NULL,
email VARCHAR(40) NOT NULL,
faculty VARCHAR(40) NOT NULL,
office VARCHAR(40) NOT NULL
)

CREATE TABLE Instructor_Course(
course_id INT,
instructor_id INT,
PRIMARY KEY(course_id, instructor_id),
CONSTRAINT FK_Ins_Course FOREIGN KEY(course_id) REFERENCES Course(course_id),
CONSTRAINT FK_Ins_Course2 FOREIGN KEY(instructor_id) REFERENCES Instructor(instructor_id)

)

CREATE TABLE Student_Instructor_Course_Take(
student_id INT, 
course_id INT,
instructor_id INT NOT NULL,
semester_code VARCHAR(40) NOT NULL,
exam_type VARCHAR(40) NOT NULL,
grade VARCHAR(40),
PRIMARY KEY(student_id, course_id, semester_code),
CONSTRAINT FK_SICT_STUD FOREIGN KEY(student_id) REFERENCES Student(student_id),
CONSTRAINT FK_SICT_COURSE FOREIGN KEY(course_id) REFERENCES Course(course_id),
CONSTRAINT FK_SICT_INS FOREIGN KEY(instructor_id) REFERENCES Instructor(instructor_id)
)

CREATE TABLE Semester(
semester_code VARCHAR(40) PRIMARY KEY,
start_date DATE  NOT NULL,
end_date DATE  NOT NULL
)

CREATE TABLE Course_Semester(
course_id INT,
semester_code VARCHAR(40),
PRIMARY KEY(course_id, semester_code),
CONSTRAINT FK_Course_Semester FOREIGN KEY(course_id) REFERENCES Course(course_id),
CONSTRAINT FK_Course_SemesterCode FOREIGN KEY(semester_code) REFERENCES Semester(semester_code)
)

CREATE TABLE Slot(
slot_id INT PRIMARY KEY IDENTITY,
slot_day VARCHAR(40) NOT NULL,
slot_time VARCHAR(40) NOT NULL,
slot_location VARCHAR(40) NOT NULL,
course_id INT NOT NULL,
instructor_id INT NOT NULL,
CONSTRAINT FK_Slot_Course FOREIGN KEY(course_id) REFERENCES Course(course_id),
CONSTRAINT FK_Slot_Instructor FOREIGN KEY(instructor_id) REFERENCES Instructor(instructor_id)
)

CREATE TABLE Graduation_Plan(
plan_id INT IDENTITY,
semester_code VARCHAR(40),
semester_credit_hours INT,
expected_grad_date DATE,
advisor_id INT NOT NULL,
student_id INT NOT NULL
PRIMARY KEY(plan_id, semester_code),
CONSTRAINT FK_Grad_Advisor FOREIGN KEY(advisor_id) REFERENCES Advisor(advisor_id), 
CONSTRAINT FK_Grad_Student FOREIGN KEY(student_id) REFERENCES Student(student_id)
)

CREATE TABLE GradPlan_Course(
plan_id	INT,
semester_code VARCHAR(40), 
course_id INT,
PRIMARY KEY(plan_id, semester_code, course_id),
CONSTRAINT FK_Grad_Course_Plan FOREIGN KEY(plan_id,semester_code) REFERENCES Graduation_Plan(plan_id,semester_code)
)

CREATE TABLE Request(
request_id INT PRIMARY KEY IDENTITY,
type VARCHAR(40) NOT NULL,
comment VARCHAR(40),
status VARCHAR(40) NOT NULL DEFAULT 'pending',
credit_hours INT,
student_id INT NOT NULL, 
advisor_id INT NOT NULL,
course_id INT,
CONSTRAINT FK_Request_Student FOREIGN KEY(student_id) REFERENCES Student(student_id),
CONSTRAINT FK_Request_Advisor FOREIGN KEY(advisor_id) REFERENCES Advisor(advisor_id),
CONSTRAINT FK_Request_Course FOREIGN KEY(course_id) REFERENCES Course(course_id)
)

CREATE TABLE MakeUp_Exam(
exam_id INT PRIMARY KEY IDENTITY,
date Date NOT NULL,
type VARCHAR(40) NOT NULL DEFAULT 'normal',
course_id INT NOT NULL 
CONSTRAINT FK_MakeUp_Course FOREIGN KEY(course_id) REFERENCES Course(course_id)
)

CREATE TABLE Exam_Student(
exam_id INT,
student_id INT,
course_id INT NOT NULL,
PRIMARY KEY(exam_id, student_id),
CONSTRAINT FK_ExamStud_MakeUp FOREIGN KEY(exam_id) REFERENCES MakeUp_Exam(exam_id),
CONSTRAINT FK_ExamStud_Stud FOREIGN KEY(student_id) REFERENCES Student(student_id),
CONSTRAINT FK_ExamStud_Course FOREIGN KEY(course_id) REFERENCES Course(course_id)
)

CREATE TABLE Payment(
payment_id INT PRIMARY KEY IDENTITY,
amount DECIMAL(8,2) NOT NULL,
deadline DATETIME NOT NULL,
n_installments INT NOT NULL,
status VARCHAR(40) NOT NULL,
fund_percentage DECIMAL(5,2) NOT NULL,
student_id INT NOT NULL,
start_date DATE NOT NULL,
semester_code VARCHAR(40) NOT NULL, 
CONSTRAINT FK_Pay_Stud FOREIGN KEY(student_id) REFERENCES Student(student_id) ,
CONSTRAINT FK_Pay_Sem FOREIGN KEY(semester_code) REFERENCES Semester(semester_code) 
)

CREATE TABLE Installment(
payment_id INT,
deadline DATETIME,
amount Decimal(8,2) NOT NULL,
status VARCHAR(40) NOT NULL DEFAULT 'notPaid',
start_date DATETIME NOT NULL
PRIMARY KEY(payment_id, deadline)
CONSTRAINT FK_Ins_Pay FOREIGN KEY(payment_id) REFERENCES Payment(payment_id)
)

GO

CREATE OR ALTER PROC DropALLTables AS
DROP TABLE Installment
DROP TABLE Payment
DROP TABLE Exam_Student
DROP TABLE Makeup_Exam
DROP TABLE Request
DROP TABLE GradPlan_Course
DROP TABLE Graduation_Plan
DROP TABLE Slot
DROP TABLE Course_Semester
DROP TABLE Semester
DROP TABLE Student_Instructor_Course_Take
DROP TABLE Instructor_Course
DROP TABLE Instructor
DROP TABLE PreqCourse_course
DROP TABLE Course
DROP TABLE Student_Phone
DROP TABLE Student
DROP TABLE Advisor


GO

CREATE OR ALTER PROC ClearAllRecords AS
DELETE FROM Installment
DELETE FROM Payment
DELETE FROM Exam_Student
DELETE FROM Makeup_Exam
DELETE FROM Request
DELETE FROM GradPlan_Course
DELETE FROM Graduation_Plan
DELETE FROM Slot
DELETE FROM Course_Semester
DELETE FROM Semester
DELETE FROM Student_Instructor_Course_Take
DELETE FROM Instructor_Course
DELETE FROM Instructor
DELETE FROM PreqCourse_course
DELETE FROM Course
DELETE FROM Student_Phone
DELETE FROM Student
DELETE FROM Advisor
GO

GO

CREATE OR ALTER VIEW Advisors_Graduation_Plan AS
SELECT gp.plan_id,gp.semester_code,gp.semester_credit_hours,gp.expected_grad_date,gp.student_id, a.advisor_id, a.advisor_name
FROM Graduation_Plan gp
INNER JOIN
Advisor a ON gp.advisor_id = a.advisor_id

GO

CREATE OR ALTER VIEW all_Pending_Requests AS
SELECT r.*, s.f_name + ' ' + s.l_name AS student_name, a.advisor_name
FROM Request r
INNER JOIN
Student s ON r.student_id = s.student_id
INNER JOIN
Advisor a ON r.advisor_id = a.advisor_id
WHERE r.status = 'pending'

GO

CREATE OR ALTER VIEW Courses_MakeupExams AS
SELECT C.course_name,
C.semester,
M.*
FROM Course C
LEFT JOIN MakeUP_Exam M on C.course_id = M.course_id

GO

CREATE OR ALTER VIEW Courses_Slots_Instructor AS
SELECT c.course_id, c.course_name, s.slot_id, s.slot_day, s.slot_time, s.slot_location, i.instructor_name
FROM Course c
INNER JOIN 
Slot s ON c.course_id = s.course_id
LEFT JOIN 
Instructor i ON s.instructor_id = i.instructor_id

GO

CREATE OR ALTER VIEW Instructors_AssignedCourses AS
SELECT i.*,c.*
FROM Instructor i 
INNER JOIN Instructor_Course i_c 
ON i.instructor_id = i_c.instructor_id 
INNER JOIN Course c 
ON i_c.course_id = c.course_id

GO

CREATE OR ALTER VIEW Semester_offered_Courses AS
SELECT c.course_id,
c.course_name,
CS.semester_code
FROM Course_Semester CS, Course c
WHERE CS.course_id = C.course_id

GO

CREATE OR ALTER VIEW Student_Payment AS
SELECT p.payment_id, p.amount, p.deadline, p.n_installments, p.status,
       p.fund_percentage, p.start_date, p.semester_code,
       s.student_id, s.f_name, s.l_name, s.Gpa, s.faculty, s.email, s.major,
       s.password, s.financial_status, s.semester, s.acquired_hours, s.assigned_hours,
       s.advisor_id
FROM Payment p, Student s
WHERE p.student_id = s.student_id

GO

CREATE OR ALTER VIEW Students_Courses_Transcript AS
SELECT s.student_id, s.f_name + ' ' + s.l_name as student_name, c.course_id, c.course_name, sict.exam_type, sict.grade, c.semester
FROM Student s
INNER JOIN 
Student_Instructor_Course_Take sict ON s.student_id = sict.student_id
INNER JOIN 
Course c ON sict.course_id = c.course_id
INNER JOIN 
Instructor i ON sict.instructor_id = i.instructor_id

GO

CREATE OR ALTER VIEW view_Course_prerequisites AS
SELECT c.course_id, c.course_name, c.major, c.is_offered, c.credit_hours, c.semester,
       pcc.prerequisite_course_id
FROM Course c
LEFT JOIN PreqCourse_course pcc on C.course_id = PCC.course_id


GO

CREATE OR ALTER VIEW view_Students AS
SELECT s.*
FROM Student s
WHERE s.financial_status = 1

GO

CREATE OR ALTER FUNCTION FN_AdvisorLogin (
@id INT,
@password VARCHAR(40)
)
RETURNS BIT
AS
BEGIN
DECLARE @success BIT = 0
IF  EXISTS (SELECT 1 FROM Advisor WHERE advisor_id = @id AND password = @password) 
	SET @success = 1
RETURN @success
END


GO

CREATE OR ALTER FUNCTION FN_Advisors_Request(
@advisor_id INT
)
RETURNS TABLE
AS
RETURN(
SELECT *
FROM Request
WHERE advisor_id = @advisor_id
)

GO

CREATE OR ALTER FUNCTION FN_CalculateStatus(
@studentID INT
)
RETURNS BIT
AS
BEGIN
DECLARE @status BIT
IF EXISTS(SELECT 1
FROM Installment i
INNER JOIN 
Payment p ON i.payment_id = p.payment_id
WHERE p.student_id = @studentID
AND i.status = 'notPaid' AND i.deadline > GETDATE())
BEGIN 
SET @status = 0
END
ELSE
BEGIN
SET @status = 1
END
RETURN @status
END


GO

CREATE OR ALTER FUNCTION FN_IsEvenSemesterCode
(
@semesterCode varchar(40)
)
RETURNS BIT
BEGIN

	IF LEN(@semesterCode) = 5
		RETURN CASE WHEN RIGHT(@semesterCode, 2) = 'R2' THEN 1 ELSE 0 END
	RETURN CASE WHEN LEFT(@semesterCode, 1) = 'S' THEN 1 ELSE 0 END
END


GO

CREATE OR ALTER FUNCTION FN_SemesterAvailableCourses
(@semester_code VARCHAR(40))
RETURNS Table
AS
RETURN
(SELECT cs.course_id, c.course_name FROM Course_Semester cs INNER JOIN Course C on cs.course_id = c.course_id WHERE cs.semester_code = @semester_code AND c.is_offered = 1)

GO

CREATE OR ALTER FUNCTION FN_StudentCheckSMEligibility(
@courseID INT,
@studentID INT
)
RETURNS BIT
AS
BEGIN
DECLARE @eligible BIT, @countFailedCourses INT
SELECT @countFailedCourses = COUNT(*)
FROM Student_Instructor_Course_Take sict
INNER JOIN Student s ON sict.student_id = s.student_id
WHERE sict.student_id = @studentID
AND (sict.grade = 'F' OR sict.grade = 'FF')
AND (s.semester % 2 = 0 AND dbo.FN_IsEvenSemesterCode(sict.semester_code) = 1 OR 
s.semester % 2 = 1 AND dbo.FN_IsEvenSemesterCode(sict.semester_code) = 0)

RETURN CASE WHEN @countFailedCourses <= 2 THEN 1 ELSE 0 END
END


GO

CREATE OR ALTER FUNCTION FN_StudentLogin(
@id INT,
@password VARCHAR(40)
)
RETURNS BIT
AS
BEGIN
DECLARE @success BIT = 0
IF  EXISTS (SELECT 1 FROM Student s WHERE s.student_id = @id AND s.password = @password) 
SET @success = 1
RETURN @success
END


GO

CREATE OR ALTER FUNCTION FN_StudentUpcoming_installment
(@student_id INT)
RETURNS DATETIME
AS 
BEGIN
DECLARE @deadline DATETIME
SELECT TOP 1 @deadline = i.deadline
FROM Installment i, Payment p
WHERE p.payment_id = i.payment_id AND p.student_id = @student_id AND i.status = 'notPaid'
ORDER BY i.deadline

RETURN @deadline
END


GO

CREATE OR ALTER FUNCTION FN_StudentViewGP(
@studentID INT
)
RETURNS TABLE
AS
RETURN(
SELECT s.f_name + ' ' + s.l_name AS StudentName, s.student_id, 
g.plan_id AS PlanID, gc.course_id AS CourseID, c.course_name, g.semester_code, g.expected_grad_date, g.semester_credit_hours, g.advisor_id
FROM Student s
INNER JOIN Graduation_Plan g ON g.student_id = s.student_id
INNER JOIN GradPlan_Course gc ON gc.plan_id = g.plan_id
INNER JOIN Course c ON c.course_id = gc.course_id
)


GO

CREATE OR ALTER FUNCTION FN_StudentViewSlot(
@courseID INT, 
@instructorID INT
)
RETURNS TABLE
AS RETURN(
SELECT s.slot_id, s.slot_location, s.slot_time, s.slot_day
FROM Slot s
INNER JOIN 
Course c ON s.course_id = c.course_id
INNER JOIN 
Instructor i ON s.instructor_id = i.instructor_id
WHERE s.course_id = @courseID AND s.instructor_id = @instructorID
)


GO

CREATE OR ALTER PROC AdminAddingSemester(
@start_date DATE,
@end_date DATE,
@semester_code VARCHAR(40)
)
AS
INSERT INTO Semester(semester_code, start_date, end_date)
VALUES(@semester_code, @start_date, @end_date)

GO

CREATE OR ALTER PROC AdminListStudentsWithAdvisors
AS 
SELECT s.*, a.*
FROM Student s
LEFT JOIN
Advisor a ON s.advisor_id = a.advisor_id

GO

CREATE OR ALTER PROC Procedures_AdminAddExam (
@Type  VARCHAR(40),
@date DATETIME,
@course_id INT
)
AS

INSERT INTO MakeUp_Exam (type, date, course_id)
VALUES (@type, @date, @course_id)


GO

CREATE OR ALTER PROC Procedures_AdminAddingCourse(
@major VARCHAR(40),
@semester INT,
@credit_hours INT,
@course_name VARCHAR(40),
@offered BIT
)
AS
INSERT INTO Course(major, semester, credit_hours, course_name, is_offered)
VALUES(@major, @semester, @credit_hours, @course_name, @offered)


GO

CREATE OR ALTER PROC Procedures_AdminDeleteCourse(
@courseID INT
)
AS
-- Don't delete course if a student is taking this course
IF EXISTS (SELECT * FROM Student_Instructor_Course_Take WHERE course_id = @courseID)
	RETURN
-- Don't delete course if a student has this course in his/her graduation plan
IF EXISTS (SELECT * FROM GradPlan_Course WHERE course_id = @courseID)
	RETURN
-- Don't delete course if a student has a makeup exam in this course
IF EXISTS (SELECT * FROM Exam_Student WHERE course_id = @courseID)
	RETURN
-- Don't delete the course if it is a prerequisite for another course (must delete dependent courses first)
IF EXISTS (SELECT * FROM PreqCourse_course WHERE prerequisite_course_id = @courseID)
	RETURN
-- DELETE all related records
DELETE FROM PreqCourse_course
WHERE PreqCourse_course.course_id = @courseID
DELETE FROM MakeUp_Exam
WHERE MakeUp_Exam.course_id = @courseID
DELETE FROM Instructor_Course
WHERE Instructor_Course.course_id = @courseID
DELETE FROM Course_Semester
WHERE Course_Semester.course_id = @courseID
DELETE FROM Slot
WHERE Slot.course_id = @courseID
-- DELETE course itself
DELETE FROM Course
WHERE Course.course_id = @courseID


GO

CREATE OR ALTER PROC Procedures_AdminDeleteSlots(
@current_semester VARCHAR(40)
)
AS

BEGIN
DELETE FROM Slot 
WHERE course_id IN(
SELECT cs.course_id 
FROM Course_Semester cs, Course c
WHERE (cs.course_id = c.course_id) AND cs.semester_code <> @current_semester
)
END


GO

CREATE OR ALTER PROC Procedures_AdminIssueInstallment (
@payment_id INT
)
AS
BEGIN

DECLARE @start_date DATETIME
SELECT @start_date = start_date
FROM Payment
WHERE payment_id = @payment_ID

DECLARE @deadline DATETIME
SET @deadline = DATEADD(MONTH, 1, @start_date)


DECLARE @installment_count INT
SELECT @installment_count = n_installments
FROM Payment 
WHERE payment_id = @payment_id

DECLARE @installment_number INT = 1

WHILE  @installment_number <= @installment_count
BEGIN
INSERT INTO Installment(payment_id, deadline, amount, status, start_date)
VALUES (@payment_id, @deadline, (SELECT amount FROM  Payment  WHERE payment_id= @payment_id) / @installment_count, 'NotPaid', @start_date)

SET @deadline = DATEADD(MONTH,1,@deadline)
SET @start_date = DATEADD(MONTH, 1 , @start_date)
SET @installment_number = @installment_number +1
END
END


GO

CREATE OR ALTER PROC Procedures_AdminLinkInstructor(
@InstructorID INT,
@CourseID INT,
@SlotID INT
)
AS
UPDATE Slot
SET instructor_id = @InstructorID
WHERE slot_id = @SlotID AND course_id = @CourseID

GO

CREATE OR ALTER PROC Procedures_AdminLinkStudent(
@instructor_id INT ,
@student_id INT,
@course_id INT,
@semester_code VARCHAR(40)
)
AS
INSERT INTO Student_Instructor_Course_Take (instructor_id, student_id, course_Id, semester_code)
VALUES (@instructor_id, @student_id, @course_id, @semester_code)


GO

CREATE OR ALTER PROC Procedures_AdminLinkStudentToAdvisor (
@student_id INT,
@advisor_id INT
)
AS
UPDATE Student
SET advisor_id = @advisor_id
WHERE student_id = @student_id

GO

CREATE OR ALTER PROC Procedures_AdminListAdvisors
AS
SELECT *
FROM Advisor

GO

CREATE OR ALTER PROC Procedures_AdminListStudents
AS
SELECT s.*
FROM Student s

GO

CREATE OR ALTER PROC Procedures_AdminUpdateStudentStatus(
@student_id INT
)
AS 
BEGIN 
DECLARE @CurrentTime DATE = GETDATE()
IF EXISTS(
SELECT 1 
FROM Installment i
INNER JOIN 
Payment p ON i.payment_id = p.payment_id
INNER JOIN
Student s ON p.student_id = s.student_id
WHERE s.student_id = @student_id
AND i.status = 'notPaid'
AND i.deadline < @CurrentTime
)
BEGIN
UPDATE Student 
SET financial_status = 0
WHERE student_id = @student_id
END
ELSE
BEGIN
UPDATE Student
SET financial_status = 1
WHERE student_id = @student_id
END
END


GO

CREATE OR ALTER PROC Procedures_AdvisorADDCourseGP (
@student_id INT,
@semester_code VARCHAR(40),
@course_name VARCHAR(40)
) AS
BEGIN
DECLARE @course_id INT, @plan_id INT

SELECT @course_id = course_id
FROM Course
WHERE course_name = @course_name

SELECT @plan_id = plan_id
FROM Graduation_Plan
WHERE @student_id = student_id

INSERT INTO GradPlan_Course(plan_id,semester_code,course_id)
VALUES(@plan_id, @semester_code, @course_id)
END


GO

CREATE OR ALTER PROC Procedures_AdvisorApproveRejectCHRequest(
@requestID INT,
@current_semester_code VARCHAR(40)
)
AS
BEGIN
DECLARE @status VARCHAR(40), @comment VARCHAR(40), @assignedHours int, @gpa decimal(3,2), @hoursRequested int, @studentId int, @semesterCode varchar(40)


SELECT @assignedHours = s.assigned_hours, @gpa = s.gpa, @hoursRequested = r.credit_hours, @studentId = r.student_id  
FROM Student s
INNER JOIN Request r
ON r.student_id = s.student_id
WHERE r.request_id = @requestID
AND r.status = 'pending' AND r.type = 'credit_hours'

IF @studentId IS NULL
BEGIN
	RETURN
END

SELECT TOP 1 @semesterCode = s.semester_code
FROM Semester s
WHERE s.end_date > GETDATE()
ORDER BY s.end_date


IF @hoursRequested > 3 OR @hoursRequested < 1
BEGIN
	SET @status = 'rejected'
	SET @comment = 'hours requests must be from 1-3 hours.'
END
ELSE IF @assignedHours IS NULL
BEGIN
	SET @status = 'rejected'
	SET @comment = 'student does not have assigned hours.'
END
ELSE IF @assignedHours + @hoursRequested >= 34
BEGIN
	SET @status = 'rejected'
	SET @comment = 'student would exceed 34hrs threshold.'
END
ELSE IF @gpa >= 3.7
BEGIN
	SET @status = 'rejected'
	SET @comment = 'student is under probation.'
END
ELSE
BEGIN
	SET @status = 'accepted'
	SET @comment = 'request accepted.'
	UPDATE Student
	SET assigned_hours = @assignedHours + @hoursRequested
	WHERE student_id = @studentId
	UPDATE Payment
	SET amount = amount+(1000*@hoursRequested)
	WHERE student_id = @studentId
	UPDATE Installment
	SET amount = amount+(1000*@hoursRequested)
	WHERE deadline IN (SELECT TOP 1 deadline
	FROM Installment WHERE deadline > GETDATE()
	GROUP BY deadline
	)
END

UPDATE Request SET status = @status, comment = @comment WHERE request_id = @requestID
PRINT @status
PRINT @comment
END


GO

CREATE OR ALTER PROC Procedures_AdvisorApproveRejectCourseRequest(
@requestID INT,
@currentSemesterCode VARCHAR(40)
)
AS
BEGIN
DECLARE @courseID INT, @studentID INT, @status VARCHAR(40), @comment VARCHAR(40), @assignedHours INT, @semesterCode VARCHAR(40), @courseHours int, @advisorID INT

SELECT @assignedHours = s.assigned_hours, @courseID = r.course_id, @courseHours = c.credit_hours
FROM Student s
INNER JOIN Request r
ON r.student_id = s.student_id
INNER JOIN Course c
ON c.course_id = r.course_id
WHERE r.request_id = @requestID AND r.student_id = @studentID AND r.advisor_id = @advisorID
AND r.status = 'pending' AND r.type = 'Course'

IF @assignedHours IS NULL
	RETURN

SELECT TOP 1 @semesterCode = s.semester_code
FROM Semester s
WHERE s.end_date > GETDATE()
ORDER BY s.end_date

IF @semesterCode IS NULL
	RETURN

IF EXISTS (SELECT *
	FROM PreqCourse_course pc
	LEFT JOIN Student_Instructor_Course_Take sict
	ON pc.prerequisite_course_id = sict.course_id AND sict.student_id = @studentID
	WHERE pc.course_id = @courseID AND sict.course_id IS NULL)
BEGIN 
	SET @status = 'rejected'
	SET @comment = 'prerequisite course not taken'
END
ELSE IF @courseHours + ISNULL((SELECT SUM(c.credit_hours) FROM Student_Instructor_Course_Take sict INNER JOIN Course c ON sict.course_id = c.course_id
		WHERE sict.student_id = @studentID AND sict.semester_code = @semesterCode), 0) > @assignedHours
		BEGIN 
	SET @status = 'rejected'
	SET @comment = 'exceeded assigned hours'
END
ELSE
BEGIN
		SET @status = 'accepted'
		SET @comment = 'request accepted.'
		INSERT INTO Student_Instructor_Course_Take (course_id, exam_type, grade, instructor_id, semester_code, student_id)
		SELECT TOP 1 @courseID, 'Normal', NULL, ic.instructor_id, @semesterCode, @studentID
		FROM Instructor_Course ic WHERE ic.course_id = @courseID
END

UPDATE Request SET status = @status, comment = @comment WHERE request_id = @requestID
END


GO

CREATE OR ALTER PROC Procedures_AdvisorCreateGP(
@semester_code VARCHAR(40),
@expected_graduation_date DATE,
@sem_credit_hours INT,
@advisor_id INT,
@student_id INT
)
AS
BEGIN
DECLARE @acquiredHours INT
SELECT @acquiredHours = acquired_hours
FROM Student
WHERE student_id = @student_id

IF(@acquiredHours <= 157)
RETURN;

INSERT INTO Graduation_Plan(semester_code, semester_credit_hours, expected_grad_date, advisor_id, student_id)
VALUES(@semester_code, @sem_credit_hours, @expected_graduation_date, @advisor_id, @student_id)
END


GO

CREATE OR ALTER PROC Procedures_AdvisorDeleteFromGP ( 
@student_id INT,
@semester_code VARCHAR(40),
@course_id INT 
) AS
BEGIN
DECLARE @plan_id INT
SELECT @plan_id = plan_id
FROM Graduation_Plan
WHERE student_id = @student_id

DELETE FROM GradPlan_Course
WHERE  plan_id = @plan_id AND semester_code = @semester_code AND course_id = @course_id
END


GO

CREATE OR ALTER PROC Procedures_AdvisorRegistration(
@advisor_name VARCHAR(40),
@advisor_password VARCHAR(40),
@advisor_email VARCHAR(40),
@advisor_office VARCHAR(40),
@advisor_ID INT OUTPUT
)
AS
INSERT INTO Advisor(advisor_name, password, email, office)
VALUES(@advisor_name, @advisor_password, @advisor_email, @advisor_office)

SELECT @advisor_ID = SCOPE_IDENTITY();
Print @advisor_ID


GO

CREATE OR ALTER PROC Procedures_AdvisorUpdateGP(
@expected_grad_date DATE,
@studentID INT
)
AS
BEGIN
UPDATE Graduation_Plan
SET expected_grad_date = @expected_grad_date
WHERE student_id = @studentID
END

GO

CREATE OR ALTER PROC Procedures_AdvisorViewAssignedStudents (
@advisor_id INT,
@major VARCHAR(40)
)
AS
BEGIN
SELECT s.student_id, s.f_name + ' ' + s.l_name as student_name, s.major, c.course_name
FROM Student s INNER JOIN Student_Instructor_Course_Take sict on s.student_id = sict.student_id
LEFT JOIN course c on c.course_id = sict.course_id
WHERE s.advisor_id = @advisor_id and s.major = @major
END


GO

CREATE OR ALTER PROC Procedures_AdvisorViewPendingRequests(
@advisorID INT
)
AS
BEGIN
SELECT r.*
FROM Request r
WHERE r.advisor_id = @advisorID AND r.status = 'pending'
END


GO

CREATE OR ALTER PROC Procedures_StudentAddMobile(
@studentID INT,
@mobile_number VARCHAR(40)
)
AS
BEGIN
INSERT INTO Student_Phone(student_id, phone_number)
VALUES(@studentID, @mobile_number)
END


GO

CREATE OR ALTER PROC Procedures_StudentRegisterSecondMakeup(
@studentID INT,
@courseID INT,
@studentCurrentSemester VARCHAR(40)
)
AS
BEGIN 
IF NOT EXISTS (SELECT * FROM Course_Semester WHERE course_id = @courseID AND semester_code = @studentCurrentSemester)
BEGIN
	PRINT('Registration for second makeup failed because course is not offered in the current semester.')
	RETURN
END
IF dbo.FN_StudentCheckSMEligibility(@courseID, @studentID) = 1
BEGIN
	DECLARE @exam_id int
	SELECT TOP 1 @exam_id = exam_id FROM 
	MakeUp_Exam WHERE course_id = @courseID
	AND type = 'Second_makeup'
	AND date > GETDATE()
	ORDER BY date
	IF @exam_id IS NULL
	BEGIN 
		PRINT('Registration for second makeup failed because there is no exam scheduled.')
		RETURN
	END 

	INSERT INTO Exam_Student(exam_id, student_id, course_id)
	VALUES(@exam_id, @studentID, @courseID)
	PRINT('Registration for second makeup successful.') 
END
ELSE
BEGIN
	PRINT('Registration for second makeup failed because student is not eligible.')
END
END


GO

CREATE OR ALTER PROC Procedures_StudentRegistration(
@first_name	VARCHAR(40),
@last_name VARCHAR(40),
@password VARCHAR(40),
@faculty VARCHAR(40),
@email VARCHAR(40),
@major VARCHAR(40),
@semester INT,
@student_id INT OUTPUT
)
AS
INSERT INTO Student (f_name, l_name, password, faculty, email, major, semester)
VALUES(@first_name, @last_name, @password, @faculty, @email, @major, @semester)

SELECT @student_id = SCOPE_IDENTITY()


GO

CREATE OR ALTER PROC Procedures_StudentSendingCHRequest (
@student_id INT,
@credit_hours INT,
@type VARCHAR(40),
@comment VARCHAR(40)
) AS
BEGIN

IF @type <> 'credit_hours'
	RETURN
DECLARE @advisor_id INT
SELECT @advisor_id = advisor_id
FROM Student s
WHERE s.student_id = @student_id

INSERT INTO Request(student_id,credit_hours,type,comment, advisor_id)
VALUES(@student_id, @credit_hours, @type, @comment, @advisor_id)
END

GO

CREATE OR ALTER PROC Procedures_StudentSendingCourseRequest(
@studentID INT,
@courseID INT,
@type VARCHAR(40),
@comment VARCHAR(40)
)
AS
BEGIN

DECLARE @creditHours int, @advisorID int
SELECT @creditHours = credit_hours FROM Course WHERE course_id = @courseID
SELECT @advisorID = advisor_id FROM Student WHERE student_id = @studentID
INSERT INTO Request(type, comment, status, credit_hours, student_id, advisor_id, course_id)
VALUES(@type, @comment, 'pending', @creditHours, @studentID, @advisorID, @courseID)
END


GO

CREATE OR ALTER PROC Procedures_ViewMS(
@studentID INT
)
AS
BEGIN
SELECT c.course_id, c.course_name, c.credit_hours, c.is_offered, c.major, c.semester
FROM Course c
WHERE c.course_id NOT IN(
SELECT sict.course_id
FROM Student_Instructor_Course_Take sict
WHERE sict.student_id = @studentID 
AND (sict.grade = 'F' OR sict.grade = 'FF' OR sict.grade = 'FA')
)
AND c.course_id NOT IN(SELECT gc.course_id
FROM GradPlan_Course gc
INNER JOIN 
Graduation_Plan gp ON gc.plan_id = gp.plan_id
WHERE gp.student_id = @studentID)
END


GO

CREATE OR ALTER PROC Procedures_ViewOptionalCourses(
@studentID INT,
@currentSemesterCode VARCHAR(40)
)
AS
BEGIN
SELECT c.course_name, c.course_id, c.credit_hours, c.is_offered, c.major, c.semester
FROM Course c
INNER JOIN Student s
ON s.major = c.major
INNER JOIN Course_Semester cs
ON cs.course_id = c.course_id
WHERE cs.semester_code = @currentSemesterCode
AND c.semester >= s.semester
AND c.course_id NOT IN(
SELECT sict.course_id
FROM Student_Instructor_Course_Take sict
WHERE sict.student_id = @studentID 
AND (sict.grade NOT IN('F', 'FF') OR dbo.FN_StudentCheckSMEligibility(c.course_id, @studentID) = 1)
)
END


GO

CREATE OR ALTER PROC Procedures_ViewRequiredCourses(
@studentID INT,
@currentSemesterCode VARCHAR(40)
)
AS
BEGIN
SELECT c.course_name, c.course_id, c.credit_hours, c.is_offered, c.major, c.semester
FROM Course c
INNER JOIN Course_Semester cs
ON cs.course_id = c.course_id
INNER JOIN Student s
ON s.major = c.major
WHERE cs.semester_code = @currentSemesterCode
AND c.semester < s.semester
AND c.course_id NOT IN(
SELECT sict.course_id
FROM Student_Instructor_Course_Take sict
WHERE sict.student_id = @studentID 
AND (sict.grade NOT IN('F', 'FF') OR dbo.FN_StudentCheckSMEligibility(c.course_id, @studentID) = 1)
)
END


GO

