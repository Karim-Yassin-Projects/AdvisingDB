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