CREATE OR ALTER PROC Procedures_StudentRegisterSecondMakeup(
@studentID INT,
@courseID INT,
@studentCurrentSemester VARCHAR(40)
)
AS
BEGIN 
IF NOT EXISTS (SELECT * FROM Course_Semester WHERE course_id = @courseID AND semester_code = @studentCurrentSemester)
BEGIN
	SELECT 'Registration for second makeup failed because course is not offered in the current semester.', CAST(0 as bit)
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
		SELECT 'Registration for second makeup failed because there is no exam scheduled.', CAST(0 as bit)
		RETURN
	END 

	IF EXISTS (SELECT * FROM Exam_student WHERE student_id = @studentID AND exam_id = @exam_id) 
	BEGIN 
		SELECT 'Student is already registered for this exam.', CAST(0 as bit)
		RETURN
	END 

	INSERT INTO Exam_Student(exam_id, student_id, course_id)
	VALUES(@exam_id, @studentID, @courseID)
	SELECT 'Registration for second makeup successful.', CAST(1 as bit)
END
ELSE
BEGIN
	SELECT 'Registration for second makeup failed because student is not eligible.', CAST(0 as bit)
END
END
