CREATE OR ALTER PROC Procedures_AdvisorDeleteFromGP ( 
@student_id INT,
@semester_code VARCHAR(40),
@course_id INT 
) AS
BEGIN
DECLARE @plan_id INT
SELECT @plan_id = plan_id
FROM Graduation_Plan
WHERE student_id = @student_id

DELETE FROM GradPlan_Course
WHERE  plan_id = @plan_id AND semester_code = @semester_code AND course_id = @course_id
END
