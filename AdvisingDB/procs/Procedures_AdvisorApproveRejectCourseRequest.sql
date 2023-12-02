CREATE OR ALTER PROC Procedures_AdvisorApproveRejectCourseRequest(
@requestID INT,
@currentSemesterCode VARCHAR(40)
)
AS
BEGIN
DECLARE @courseID INT, @studentID INT, @status VARCHAR(40), @comment VARCHAR(40), @assignedHours INT, @semesterCode VARCHAR(40), @courseHours int, @advisorID INT

SELECT @assignedHours = s.assigned_hours, @courseID = r.course_id, @courseHours = c.credit_hours
FROM Student s
INNER JOIN Request r
ON r.student_id = s.student_id
INNER JOIN Course c
ON c.course_id = r.course_id
WHERE r.request_id = @requestID AND r.student_id = @studentID AND r.advisor_id = @advisorID
AND r.status = 'pending' AND r.type = 'Course'

IF @assignedHours IS NULL
	RETURN

SELECT TOP 1 @semesterCode = s.semester_code
FROM Semester s
WHERE s.end_date > GETDATE()
ORDER BY s.end_date

IF @semesterCode IS NULL
	RETURN

IF EXISTS (SELECT *
	FROM PreqCourse_course pc
	LEFT JOIN Student_Instructor_Course_Take sict
	ON pc.prerequisite_course_id = sict.course_id AND sict.student_id = @studentID
	WHERE pc.course_id = @courseID AND sict.course_id IS NULL)
BEGIN 
	SET @status = 'rejected'
	SET @comment = 'prerequisite course not taken'
END
ELSE IF @courseHours + ISNULL((SELECT SUM(c.credit_hours) FROM Student_Instructor_Course_Take sict INNER JOIN Course c ON sict.course_id = c.course_id
		WHERE sict.student_id = @studentID AND sict.semester_code = @semesterCode), 0) > @assignedHours
		BEGIN 
	SET @status = 'rejected'
	SET @comment = 'exceeded assigned hours'
END
ELSE
BEGIN
		SET @status = 'accepted'
		SET @comment = 'request accepted.'
		INSERT INTO Student_Instructor_Course_Take (course_id, exam_type, grade, instructor_id, semester_code, student_id)
		SELECT TOP 1 @courseID, 'Normal', NULL, ic.instructor_id, @semesterCode, @studentID
		FROM Instructor_Course ic WHERE ic.course_id = @courseID
END

UPDATE Request SET status = @status, comment = @comment WHERE request_id = @requestID
END
