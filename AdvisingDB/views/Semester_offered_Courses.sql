CREATE OR ALTER VIEW Semester_offered_Courses AS
SELECT c.course_id,
c.course_name,
CS.semester_code
FROM Course_Semester CS, Course c
WHERE CS.course_id = C.course_id