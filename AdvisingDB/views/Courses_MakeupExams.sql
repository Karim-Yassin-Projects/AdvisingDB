CREATE OR ALTER VIEW Courses_MakeupExams AS
SELECT C.course_name,
C.semester,
M.*
FROM Course C
LEFT JOIN MakeUP_Exam M on C.course_id = M.course_id