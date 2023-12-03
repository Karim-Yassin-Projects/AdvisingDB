-- TEST X
EXECUTE Procedures_AdvisorViewAssignedStudents 1, 'CS'

-- TEST Z
EXECUTE Procedures_AdvisorViewPendingRequests 1

-- TEST AA
SELECT dbo.FN_StudentLogin(1, '')
SELECT dbo.FN_StudentLogin(1, 'password123')
SELECT dbo.FN_StudentLogin(1, 'password1234')

-- TEST CC
SELECT * FROM dbo.FN_SemsterAvailableCourses('S23R1')

-- TEST FF

SELECT * FROM dbo.FN_StudentViewGP(1)

-- TEST GG
SELECT dbo.FN_StudentUpcoming_installment(2)

-- TEST HH
SELECT * FROM dbo.FN_StudentViewSlot(2, 2)

-- TEST JJ
SELECT dbo.FN_StudentCheckSMEligiability(1,1)

-- TEST LL
EXECUTE Procedures_ViewRequiredCourses 1, 'W23'
EXECUTE Procedures_ViewOptionalCourse 1, 'W23'

SELECT * FROM  Course_Semester
SELECT * FROM Course
SELECT * FROM Instructor_Course

SELECT * FROM Student WHERE advisor_id = 1

SELECT * FROM Course

SELECT * FROM Student s
INNER JOIN Request r
ON r.student_id = s.student_id
INNER JOIN Course c
ON c.course_id = r.course_id
WHERE r.request_id = @requestID AND r.student_id = @studentID AND r.advisor_id = @advisorID
AND r.status = 'pending' AND r.type = 'Course'

SELECT * FROM PreqCourse_course
SELECT * FROM Student_Instructor_Course_Take