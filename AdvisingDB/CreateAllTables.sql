CREATE OR ALTER PROC CreateAllTables AS

CREATE TABLE Advisor(
advisor_id INT PRIMARY KEY IDENTITY,
advisor_name VARCHAR(40),
email VARCHAR(40),
office VARCHAR(40),
password VARCHAR(40)
)

CREATE TABLE Student (
student_id int PRIMARY KEY IDENTITY,
f_name VARCHAR(40),
l_name VARCHAR(40),
Gpa decimal(3,2),
faculty VARCHAR(40),
email VARCHAR(40),
major VARCHAR(40),
password VARCHAR(40),
financial_status BIT,
semester INT,
acquired_hours INT,
assigned_hours INT,
advisor_id INT
)

CREATE TABLE Student_Phone(
student_id INT,
phone_number VARCHAR(40)
PRIMARY KEY(phone_number, student_id)
FOREIGN KEY(student_id) REFERENCES Student(student_id) 
)

CREATE TABLE Course(
course_id INT PRIMARY KEY IDENTITY,
course_name VARCHAR(40),
major VARCHAR(40),
is_offered BIT,
credit_hours INT,
semester INT
)

CREATE TABLE PreqCourse_course(
prerequisite_course_id INT,
course_id INT
PRIMARY KEY(prerequisite_course_id, course_id)
FOREIGN KEY(prerequisite_course_id) REFERENCES Course(course_id),
FOREIGN KEY(course_id) REFERENCES Course(course_id)
)

CREATE TABLE Instructor(
instructor_id INT PRIMARY KEY IDENTITY,
instructor_name VARCHAR(40),
email VARCHAR(40),
faculty VARCHAR(40),
office VARCHAR(40)
)

CREATE TABLE Instructor_Course(
course_id INT FOREIGN KEY REFERENCES Course,
instructor_id INT FOREIGN KEY REFERENCES Instructor
PRIMARY KEY(course_id, instructor_id)
)

CREATE TABLE Student_Instructor_Course_Take(
student_id INT, 
course_id INT,
instructor_id INT,
semester_code VARCHAR(40),
exam_type VARCHAR(40),
grade VARCHAR(40),
PRIMARY KEY(student_id, course_id, instructor_id),
CONSTRAINT FK_SICT_STUD FOREIGN KEY(student_id) REFERENCES Student(student_id),
CONSTRAINT FK_SICT_COURSE FOREIGN KEY(course_id) REFERENCES Course(course_id),
CONSTRAINT FK_SICT_INS FOREIGN KEY(instructor_id) REFERENCES Instructor(instructor_id)
)

CREATE TABLE Semester(
semester_code VARCHAR(40) PRIMARY KEY,
start_date DATE,
end_date DATE
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
slot_day VARCHAR(40),
slot_time VARCHAR(40),
slot_location VARCHAR(40),
course_id INT,
instructor_id INT,
CONSTRAINT FK_Slot_Course FOREIGN KEY(course_id) REFERENCES Course(course_id),
CONSTRAINT FK_Slot_Instructor FOREIGN KEY(instructor_id) REFERENCES Instructor(instructor_id)
)

CREATE TABLE Graduation_Plan(
plan_id INT IDENTITY,
semester_code VARCHAR(40),
semester_credit_hours INT,
expected_grad_date DATE,
advisor_id INT,
student_id INT
PRIMARY KEY(plan_id, semester_code),
CONSTRAINT FK_Grad_Advisor FOREIGN KEY(advisor_id) REFERENCES Advisor(advisor_id), 
CONSTRAINT FK_Grad_Student FOREIGN KEY(student_id) REFERENCES Student(student_id)
)

CREATE TABLE GradPlan_Course(
plan_id	INT,
semester_code VARCHAR(40), 
course_id INT,
PRIMARY KEY(plan_id, semester_code, course_id),
CONSTRAINT FK_Grad_Course_Plan FOREIGN KEY(plan_id,semester_code) REFERENCES Graduation_Plan(plan_id,semester_code),
CONSTRAINT FK_Grad_Course_Course FOREIGN KEY(course_id) REFERENCES Course(course_id)
)
CREATE TABLE Request(
request_id INT PRIMARY KEY IDENTITY,
type VARCHAR(40),
comment VARCHAR(40),
status VARCHAR(40) DEFAULT 'pending',
credit_hours INT,
student_id INT, 
advisor_id INT,
CONSTRAINT FK_Request_Student FOREIGN KEY(student_id) REFERENCES Student(student_id),
CONSTRAINT FK_Request_Advisor FOREIGN KEY(advisor_id) REFERENCES Advisor(advisor_id),
course_id INT
)

CREATE TABLE MakeUp_Exam(
exam_id INT PRIMARY KEY IDENTITY,
date Date,
type VARCHAR(40) DEFAULT 'normal',
course_id INT 
CONSTRAINT FK_MakeUp_Course FOREIGN KEY(course_id) REFERENCES Course(course_id)
)

CREATE TABLE Exam_Student(
exam_id INT,
student_id INT,
course_id INT,
PRIMARY KEY(exam_id, student_id),
FOREIGN KEY(exam_id) REFERENCES MakeUp_Exam(exam_id),
FOREIGN KEY(student_id) REFERENCES Student(student_id)
)

CREATE TABLE Payment(
payment_id INT PRIMARY KEY IDENTITY,
amount DECIMAL(8,2),
deadline DATETIME,
n_installments INT,
status VARCHAR(40),
fund_percentage DECIMAL(5,2),
student_id INT,
start_date DATE,
semester_code VARCHAR(40), 
FOREIGN KEY(semester_code) REFERENCES Semester(semester_code) ,
FOREIGN KEY(student_id) REFERENCES Student(student_id) ,
FOREIGN KEY(semester_code) REFERENCES Semester(semester_code) 
)

CREATE TABLE Installment(
payment_id INT,
deadline DATETIME,
amount Decimal(8,2),
status VARCHAR(40) DEFAULT 'notPaid',
start_date DATETIME
PRIMARY KEY(payment_id, deadline)
FOREIGN KEY(payment_id) REFERENCES Payment(payment_id)
)