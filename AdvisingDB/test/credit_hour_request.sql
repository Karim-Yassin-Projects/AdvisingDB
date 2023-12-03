DECLARE @studentID int
DECLARE @semesterCode varchar(40)
SELECT @semesterCode = 'S23'
EXECUTE 
Procedures_StudentRegistration 'test_fname', 'test_lname','test123', 'Engineering', 'test@gmail.com', 'Engineering', 4, @studentID OUTPUT 
UPDATE student SET assigned_hours = 0 
WHERE student_id = @studentID
EXECUTE Procedures_AdminLinkStudentToAdvisor @studentID, 1
EXECUTE Procedures_StudentSendingCHRequest @studentID, 3, 'credit_hours', 'testing credit hours'


DECLARE @requestId int

SELECT TOP 1 @requestId = request_id FROM Request
ORDER BY request_id DESC

SELECT * FROM Student WHERE student_id = @studentID

SELECT * FROM Request WHERE request_id = @requestId
EXECUTE Procedures_AdvisorApproveRejectCHRequest @requestId, @semesterCode

SELECT * FROM Installment i
INNER JOIN Payment p
ON i.payment_id = p.payment_id
WHERE p.student_id = @studentID

SELECT * FROM Student WHERE student_id = @studentID


