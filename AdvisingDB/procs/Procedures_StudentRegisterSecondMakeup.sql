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
IF dbo.FN_StudentCheckSMEligiability(@courseID, @studentID) = 1
BEGIN
	DECLARE @exam_id int
	SELECT TOP 1 @exam_id = exam_id FROM 
	MakeUp_Exam WHERE course_id = @courseID
	AND type = 'Second MakeUp'
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
