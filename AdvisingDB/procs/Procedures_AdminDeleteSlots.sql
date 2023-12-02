CREATE OR ALTER PROC Procedures_AdminDeleteSlots(
@current_semester VARCHAR(40)
)
AS

BEGIN
DELETE FROM Slot 
WHERE course_id IN(
SELECT cs.course_id 
FROM Course_Semester cs, Course c
WHERE (cs.course_id = c.course_id) AND cs.semester_code <> @current_semester
)
END
