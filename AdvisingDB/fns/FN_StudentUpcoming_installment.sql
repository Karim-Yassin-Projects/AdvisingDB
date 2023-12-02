CREATE OR ALTER FUNCTION FN_StudentUpcoming_installment
(@student_id INT)
RETURNS DATETIME
AS 
BEGIN
DECLARE @deadline DATETIME
SELECT TOP 1 @deadline = i.deadline
FROM Installment i, Payment p
WHERE p.payment_id = i.payment_id AND p.student_id = @student_id AND i.statuts = 'notPaid'
ORDER BY i.deadline

RETURN @deadline
END
