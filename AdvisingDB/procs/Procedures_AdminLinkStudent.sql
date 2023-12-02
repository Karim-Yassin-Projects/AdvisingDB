CREATE OR ALTER PROC Procedures_AdminLinkStudent(
@instructor_id INT ,
@student_id INT,
@course_id INT,
@semester_code VARCHAR(40)
)
AS
INSERT INTO Student_Instructor_Course_Take (instructor_id, student_id, course_Id, semester_code)
VALUES (@instructor_id, @student_id, @course_id, @semester_code)
