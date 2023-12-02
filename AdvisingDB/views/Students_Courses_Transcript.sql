CREATE OR ALTER VIEW Students_Courses_Transcript AS
SELECT s.student_id, s.f_name + ' ' + s.l_name as student_name, c.course_id, c.course_name, sict.exam_type, sict.grade, c.semester
FROM Student s
INNER JOIN 
Student_Instructor_Course_Take sict ON s.student_id = sict.student_id
INNER JOIN 
Course c ON sict.course_id = c.course_id
INNER JOIN 
Instructor i ON sict.instructor_id = i.instructor_id