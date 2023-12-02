CREATE OR ALTER PROC Procedures_AdvisorViewAssignedStudents (
@advisor_id INT,
@major VARCHAR(40)
)
AS
BEGIN
SELECT s.student_id, s.f_name + ' ' + s.l_name as student_name, s.major, c.course_name
FROM Student s INNER JOIN Student_Instructor_Course_Take sict on s.student_id = sict.student_id
LEFT JOIN course c on c.course_id = sict.course_id
WHERE s.advisor_id = @advisor_id and s.major = @major
END
