CREATE OR ALTER FUNCTION FN_CalculateStatus(
@studentID INT
)
RETURNS BIT
AS
BEGIN
DECLARE @status BIT
IF EXISTS(SELECT 1
FROM Installment i
INNER JOIN 
Payment p ON i.payment_id = p.payment_id
WHERE p.student_id = @studentID
AND i.status = 'notPaid' AND i.deadline > GETDATE())
BEGIN 
SET @status = 0
END
ELSE
BEGIN
SET @status = 1
END
RETURN @status
END
