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