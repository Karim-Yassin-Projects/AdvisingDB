CREATE OR ALTER PROC Procedures_ViewMS(
@studentID INT
)
AS
BEGIN
SELECT c.course_id, c.course_name, c.credit_hours, c.is_offered, c.major, c.semester
FROM Course c
INNER JOIN Student s 
ON c.major = s.major
WHERE s.student_id = @studentID AND c.course_id NOT IN(
SELECT sict.course_id
FROM Student_Instructor_Course_Take sict
WHERE sict.student_id = @studentID 
/*AND (sict.grade IS NOT NULL AND sict.grade NOT IN ('F', 'FF', 'FA'))*/
)

END
