CREATE OR ALTER VIEW view_Course_prerequisites AS
SELECT c.course_id, c.course_name, c.major, c.is_offered, c.credit_hours, c.semester,
       pcc.prerequisite_course_id
FROM Course c
LEFT JOIN PreqCourse_course pcc on C.course_id = PCC.course_id
