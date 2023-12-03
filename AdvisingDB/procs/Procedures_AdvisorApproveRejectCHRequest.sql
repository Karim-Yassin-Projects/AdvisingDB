CREATE OR ALTER PROC Procedures_AdvisorApproveRejectCHRequest(
@requestID INT,
@current_semester_code VARCHAR(40)
)
AS
BEGIN
DECLARE @status VARCHAR(40), @comment VARCHAR(40), @assignedHours int, @gpa decimal(3,2), @hoursRequested int, @studentId int, @semesterCode varchar(40)


SELECT @assignedHours = s.assigned_hours, @gpa = s.gpa, @hoursRequested = r.credit_hours, @studentId = r.student_id  
FROM Student s
INNER JOIN Request r
ON r.student_id = s.student_id
WHERE r.request_id = @requestID
AND r.status = 'pending' AND r.type = 'credit_hours'

IF @studentId IS NULL
BEGIN
	RETURN
END

SELECT TOP 1 @semesterCode = s.semester_code
FROM Semester s
WHERE s.end_date > GETDATE()
ORDER BY s.end_date


IF @hoursRequested > 3 OR @hoursRequested < 1
BEGIN
	SET @status = 'rejected'
	SET @comment = 'hours requests must be from 1-3 hours.'
END
ELSE IF @assignedHours IS NULL
BEGIN
	SET @status = 'rejected'
	SET @comment = 'student does not have assigned hours.'
END
ELSE IF @assignedHours + @hoursRequested >= 34
BEGIN
	SET @status = 'rejected'
	SET @comment = 'student would exceed 34hrs threshold.'
END
ELSE IF @gpa >= 3.7
BEGIN
	SET @status = 'rejected'
	SET @comment = 'student is under probation.'
END
ELSE
BEGIN
	SET @status = 'accepted'
	SET @comment = 'request accepted.'
	UPDATE Student
		SET assigned_hours = @assignedHours + @hoursRequested
		WHERE student_id = @studentId
	
	DECLARE @paymentId int
	SELECT @paymentId = payment_id FROM Payment 
	WHERE student_id = @studentId
	AND semester_code = @semesterCode

	IF @paymentId IS NULL
	BEGIN
		INSERT INTO Payment
		(amount, deadline, n_installments, status, fund_percentage, student_id, start_date, semester_code)
		VALUES
		(1000*@hoursRequested, DATEADD(month, 1, GETDATE()), 0, 'notPaid', 0, @studentId, GETDATE(), @semesterCode) 
		SELECT @paymentId = SCOPE_IDENTITY()
	END
	ELSE
	BEGIN
		UPDATE Payment
			SET amount = amount+(1000*@hoursRequested),
			status = 'notPaid'
			WHERE payment_id = @paymentId
		
		
	END

	DECLARE @deadline DATETIME
	SELECT TOP 1 @deadline = deadline
	FROM Installment
	WHERE payment_id = @paymentId
	AND deadline > GETDATE()
	ORDER BY deadline

	if @deadline IS NULL
	BEGIN
		INSERT INTO Installment (payment_id, deadline, amount, status, start_date)
		VALUES
		(@paymentId, DATEADD(month, 1, GETDATE()), 1000 * @hoursRequested, 'notPaid', GETDATE())
		UPDATE Payment SET n_installments = n_installments + 1 WHERE payment_id = @paymentId
	END
	ELSE
	BEGIN
		UPDATE Installment
		SET amount = amount + 1000*@hoursRequested,
		status = 'notPaid'
		WHERE payment_id = @paymentId AND deadline = @deadline
	END
	
	UPDATE Student
	SET financial_status = dbo.FN_CalculateStatus(@studentId)
	WHERE student_id = @studentId
END

UPDATE Request SET status = @status, comment = @comment WHERE request_id = @requestID
PRINT @status
PRINT @comment
END
