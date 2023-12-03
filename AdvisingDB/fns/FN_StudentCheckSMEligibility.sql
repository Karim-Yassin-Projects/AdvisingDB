CREATE OR ALTER FUNCTION FN_StudentCheckSMEligibility(
@courseID INT,
@studentID INT
)
RETURNS BIT
AS
BEGIN
DECLARE @eligible BIT, @countFailedCourses INT
SELECT @countFailedCourses = COUNT(*)
FROM Student_Instructor_Course_Take sict
INNER JOIN Student s ON sict.student_id = s.student_id
WHERE sict.student_id = @studentID
AND (sict.grade = 'F' OR sict.grade = 'FF')
AND (s.semester % 2 = 0 AND dbo.FN_IsEvenSemesterCode(sict.semester_code) = 1 OR 
s.semester % 2 = 1 AND dbo.FN_IsEvenSemesterCode(sict.semester_code) = 0)

RETURN CASE WHEN @countFailedCourses <= 2 THEN 1 ELSE 0 END
END
