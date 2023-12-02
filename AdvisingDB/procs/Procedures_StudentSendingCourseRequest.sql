CREATE OR ALTER PROC Procedures_StudentSendingCourseRequest(
@studentID INT,
@courseID INT,
@type VARCHAR(40),
@comment VARCHAR(40)
)
AS
BEGIN
INSERT INTO Request(type, comment, status, credit_hours, student_id, advisor_id, course_id)
VALUES(@type, @comment, 'pending', (SELECT credit_hours FROM Request WHERE course_id = @courseID), @studentID, @courseID)
END
