DECLARE @studentId int
SET @studentId = 1
EXECUTE Procedures_StudentSendingCourseRequest 1, 2, 'Course', 'testing course'


DECLARE @requestId int, @semesterCode varchar(40)

SELECT TOP 1 @requestId = request_id FROM Request
ORDER BY request_id DESC

SELECT * FROM Request WHERE request_id = @requestId

SELECT TOP 1 @semesterCode = s.semester_code
FROM Semester s
WHERE s.end_date > GETDATE()
ORDER BY s.end_date

PRINT 'Semester Code ' + @semesterCode
EXECUTE Procedures_AdvisorApproveRejectCourseRequest @requestId, @semesterCode



