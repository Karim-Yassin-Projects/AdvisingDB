CREATE OR ALTER PROC Procedures_AdvisorADDCourseGP (
@student_id INT,
@semester_code VARCHAR(40),
@course_name VARCHAR(40)
) AS
BEGIN
DECLARE @course_id INT, @plan_id INT

SELECT @course_id = course_id
FROM Course
WHERE course_name = @course_name

SELECT @plan_id = plan_id
FROM Graduation_Plan
WHERE @student_id = student_id

INSERT INTO GradPlan_Course(plan_id,semester_code,course_id)
VALUES(@plan_id, @semester_code, @course_id)
END
