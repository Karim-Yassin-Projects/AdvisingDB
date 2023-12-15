CREATE OR ALTER FUNCTION FN_StudentLogin(
@id INT,
@password VARCHAR(40)
)
RETURNS BIT
AS
BEGIN
DECLARE @success BIT = 0
IF  EXISTS (SELECT 1 FROM Student s WHERE s.student_id = @id AND s.password = @password) 
SET @success = 1
RETURN @success
END

go

