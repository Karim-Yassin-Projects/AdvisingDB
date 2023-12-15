CREATE OR ALTER PROC Procedures_StudentRegisterFirstMakeup  (
@StudentID INT,
@CourseID INT,
@studentCurrentSemester VARCHAR(40)
)AS
BEGIN
	IF EXISTS( SELECT 1
	FROM Student_Instructor_Course_Take sict
	WHERE sict.student_id = @StudentID
	AND course_id = @CourseID
	AND semester_code = @studentCurrentSemester
	AND sict.grade is NULL OR sict.grade IN('F',  'FF') 
	AND sict.exam_type = 'Normal'
	)
	BEGIN
		IF NOT EXISTS (
		SELECT 1
		FROM Exam_Student ES
		INNER JOIN MakeUp_Exam MUE ON ES.exam_id = MUE.exam_id
		WHERE ES.student_id = @StudentID AND ES.course_id = @CourseID
		)
		BEGIN
			DECLARE @examID int
			SELECT TOP 1 @examID = exam_id
			FROM MakeUp_Exam
			WHERE course_id = @CourseID
			ORDER BY date DESC
			
			INSERT INTO Exam_Student (exam_id, student_id, course_id)
			VALUES(@examID, @StudentID, @CourseID)
			UPDATE Student_Instructor_Course_Take
			SET exam_type = 'First_makeup', grade = NULL
			WHERE course_id = @CourseID AND student_id = @StudentID
			AND semester_code = @studentCurrentSemester

			SELECT @@ROWCOUNT
			RETURN
		END
	END
	SELECT 0
END
