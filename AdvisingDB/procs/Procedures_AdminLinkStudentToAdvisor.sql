CREATE OR ALTER PROC Procedures_AdminLinkStudentToAdvisor (
@student_id INT,
@advisor_id INT
)
AS
UPDATE Student
SET advisor_id = @advisor_id
WHERE student_id = @student_id