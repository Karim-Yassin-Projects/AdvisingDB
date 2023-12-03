CREATE OR ALTER PROC Procedures_AdminDeleteCourse(
@courseID INT
)
AS
---- Don't delete course if a student is taking this course
--IF EXISTS (SELECT * FROM Student_Instructor_Course_Take WHERE course_id = @courseID)
--	RETURN
---- Don't delete course if a student has this course in his/her graduation plan
--IF EXISTS (SELECT * FROM GradPlan_Course WHERE course_id = @courseID)
--	RETURN
---- Don't delete course if a student has a makeup exam in this course
--IF EXISTS (SELECT * FROM Exam_Student WHERE course_id = @courseID)
--	RETURN
---- Don't delete the course if it is a prerequisite for another course (must delete dependent courses first)
--IF EXISTS (SELECT * FROM PreqCourse_course WHERE prerequisite_course_id = @courseID)
--	RETURN
---- DELETE all related records
--DELETE FROM PreqCourse_course
--WHERE PreqCourse_course.course_id = @courseID
--DELETE FROM MakeUp_Exam
--WHERE MakeUp_Exam.course_id = @courseID
--DELETE FROM Instructor_Course
--WHERE Instructor_Course.course_id = @courseID
--DELETE FROM Course_Semester
--WHERE Course_Semester.course_id = @courseID
UPDATE Slot
SET course_id = NULL, instructor_id = NULL
WHERE course_id = @courseID
-- DELETE course itself
DELETE FROM Course
WHERE Course.course_id = @courseID
