﻿CREATE OR ALTER PROC Procedures_ViewRequiredCourses(
@studentID INT,
@currentSemesterCode VARCHAR(40)
)
AS
BEGIN
SELECT c.course_name, c.course_id, c.credit_hours, c.is_offered, c.major, c.semester
FROM Course c
INNER JOIN Course_Semester cs
ON cs.course_id = c.course_id
INNER JOIN Student s
ON s.major = c.major
WHERE s.student_id = @studentID AND cs.semester_code = @currentSemesterCode
AND c.semester < s.semester
AND c.course_id NOT IN(
SELECT sict.course_id
FROM Student_Instructor_Course_Take sict
WHERE sict.student_id = @studentID 
AND (sict.grade NOT IN('F', 'FF') OR dbo.FN_StudentCheckSMEligiability(c.course_id, @studentID) = 1)
)
END
