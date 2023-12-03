DECLARE @studentID int
DECLARE @semesterCode varchar(40)
SELECT @semesterCode = 'S23'
EXECUTE 
Procedures_StudentRegistration 'test_fname', 'test_lname','test123', 'Engineering', 'test@gmail.com', 'Engineering', 4, @studentID OUTPUT 

SELECT @studentID
EXECUTE Procedures_ViewRequiredCourses @studentID, @semesterCode
EXECUTE Procedures_ViewOptionalCourse @studentID, @semesterCode
INSERT INTO Student_Instructor_Course_Take
(student_id, course_id, instructor_id, semester_code, exam_type, grade)
VALUES
(@studentID, 6, 1, @semesterCode, 'normal', 'A+'),
--(@studentID, 2, 1, @semesterCode, 'normal', 'F'),
(@studentID, 3, 1, @semesterCode, 'normal', 'F')

SELECT * FROM Makeup_Exam
--SELECT * FROM Course_semester

SELECT dbo.FN_StudentCheckSMEligiability(6,@studentID)

EXECUTE Procedures_StudentRegisterSecondMakeup @studentID, 6, @semesterCode

EXECUTE Procedures_ViewRequiredCourses @studentID, @semesterCode
EXECUTE Procedures_ViewOptionalCourse @studentID, @semesterCode
EXECUTE Procedures_ViewMS @studentID

EXECUTE Procedures_ChooseInstructor @studentID, 6, 6, @semesterCode
SELECT * FROM Student_Instructor_Course_Take WHERE student_id = @studentID