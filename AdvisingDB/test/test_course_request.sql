DECLARE @studentId int
DECLARE @semesterCode varchar(40)
SELECT @semesterCode = 'S23'
EXECUTE 
Procedures_StudentRegistration 'test_fname', 'test_lname','test123', 'Engineering', 'test@gmail.com', 'Engineering', 4, @studentID OUTPUT 
UPDATE student SET assigned_hours = 15 
WHERE student_id = @studentID
EXECUTE Procedures_AdminLinkStudentToAdvisor @studentID, 1
EXECUTE Procedures_StudentSendingCourseRequest @studentID, 2, 'Course', 'testing course'

DECLARE @requestId int

SELECT TOP 1 @requestId = request_id FROM Request
ORDER BY request_id DESC

SELECT * FROM Request WHERE request_id = @requestId

PRINT 'Semester Code ' + @semesterCode
EXECUTE Procedures_AdvisorApproveRejectCourseRequest @requestId, @semesterCode



