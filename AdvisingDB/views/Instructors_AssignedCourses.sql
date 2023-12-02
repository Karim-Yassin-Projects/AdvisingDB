CREATE OR ALTER VIEW Instructors_AssignedCourses AS
SELECT i.*,c.*
FROM Instructor i 
INNER JOIN Instructor_Course i_c 
ON i.instructor_id = i_c.instructor_id 
INNER JOIN Course c 
ON i_c.course_id = c.course_id