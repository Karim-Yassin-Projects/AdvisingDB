CREATE OR ALTER FUNCTION FN_AdvisorLogin (
@id INT,
@password VARCHAR(40)
)
RETURNS BIT
AS
BEGIN
DECLARE @success BIT = 0
IF  EXISTS (SELECT 1 FROM Advisor WHERE advisor_id = @id AND password = @password) 
	SET @success = 1
RETURN @success
END
