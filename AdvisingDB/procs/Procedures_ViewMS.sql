CREATE OR ALTER PROC Procedures_ViewMS(
@studentID INT
)
AS
BEGIN
SELECT c.course_id, c.course_name, c.credit_hours, c.is_offered, c.major, c.semester
FROM Course c
WHERE c.course_id NOT IN(
SELECT sict.course_id
FROM Student_Instructor_Course_Take sict
WHERE sict.student_id = @studentID 
AND (sict.grade = 'F' OR sict.grade = 'FF' OR sict.grade = 'FA')
)
AND c.course_id NOT IN(SELECT gc.course_id
FROM GradPlan_Course gc
INNER JOIN 
Graduation_Plan gp ON gc.plan_id = gp.plan_id
WHERE gp.student_id = @studentID)
END
