CREATE OR ALTER FUNCTION FN_StudentViewGP(
@studentID INT
)
RETURNS TABLE
AS
RETURN(
SELECT s.f_name + ' ' + s.l_name AS StudentName, s.student_id, 
g.plan_id AS PlanID, gc.course_id AS CourseID, c.course_name, g.semester_code, g.expected_grad_date, g.semester_credit_hours, g.advisor_id
FROM Student s
INNER JOIN Graduation_Plan g ON g.student_id = s.student_id
INNER JOIN GradPlan_Course gc ON gc.plan_id = g.plan_id
INNER JOIN Course c ON c.course_id = gc.course_id
WHERE s.student_id = @studentID
)
