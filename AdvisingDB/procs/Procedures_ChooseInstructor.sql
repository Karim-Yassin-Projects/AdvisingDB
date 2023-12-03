CREATE OR ALTER PROC Procedures_ChooseInstructor (
@student_id INT,
@instructor_id INT,
@course_id INT,
@curr_sem_code VARCHAR(40)
) AS
BEGIN

IF NOT EXISTS (SELECT * FROM Instructor_Course WHERE
	instructor_id = @instructor_id AND course_id = @course_id)
BEGIN
	PRINT 'Instructor does not teach this course'
	RETURN
END
UPDATE Student_Instructor_Course_Take
SET Instructor_id = @instructor_id
WHERE Student_id = @student_id
AND course_id = @course_id
AND semester_code = @curr_sem_code
END