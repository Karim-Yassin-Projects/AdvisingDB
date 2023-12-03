CREATE OR ALTER PROC Procedures_StudentSendingCourseRequest(
@studentID INT,
@courseID INT,
@type VARCHAR(40),
@comment VARCHAR(40)
)
AS
BEGIN

DECLARE @creditHours int, @advisorID int
SELECT @creditHours = credit_hours FROM Course WHERE course_id = @courseID
SELECT @advisorID = advisor_id FROM Student WHERE student_id = @studentID
INSERT INTO Request(type, comment, status, credit_hours, student_id, advisor_id, course_id)
VALUES(@type, @comment, 'pending', @creditHours, @studentID, @advisorID, @courseID)
END
