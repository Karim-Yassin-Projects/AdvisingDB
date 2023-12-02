CREATE OR ALTER PROC Procedures_AdminUpdateStudentStatus(
@student_id INT
)
AS 
BEGIN 
DECLARE @CurrentTime DATE = GETDATE()
IF EXISTS(
SELECT 1 
FROM Installment i
INNER JOIN 
Payment p ON i.payment_id = p.payment_id
INNER JOIN
Student s ON p.student_id = s.student_id
WHERE s.student_id = @student_id
AND i.status = 'notPaid'
AND i.deadline < @CurrentTime
)
BEGIN
UPDATE Student 
SET financial_status = 0
WHERE student_id = @student_id
END
ELSE
BEGIN
UPDATE Student
SET financial_status = 1
WHERE student_id = @student_id
END
END
