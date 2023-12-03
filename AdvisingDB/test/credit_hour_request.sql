DECLARE @studentId int
SET @studentId = 1
EXECUTE Procedures_StudentSendingCHRequest 1, 3, 'credit_hours', 'testing credit hours'


DECLARE @requestId int, @semesterCode varchar(40)

SELECT TOP 1 @requestId = request_id FROM Request
ORDER BY request_id DESC

SELECT * FROM Request WHERE request_id = @requestId

SELECT TOP 1 @semesterCode = s.semester_code
FROM Semester s
WHERE s.end_date > GETDATE()
ORDER BY s.end_date

PRINT 'Semester Code ' + @semesterCode
EXECUTE Procedures_AdvisorApproveRejectCHRequest @requestId, @semesterCode



