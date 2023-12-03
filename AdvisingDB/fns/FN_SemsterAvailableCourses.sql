CREATE OR ALTER FUNCTION FN_SemsterAvailableCourses
(@semester_code VARCHAR(40))
RETURNS Table
AS
RETURN
(SELECT cs.course_id, c.course_name 
FROM Course_Semester cs 
INNER JOIN Course C on cs.course_id = c.course_id 
WHERE cs.semester_code = @semester_code)