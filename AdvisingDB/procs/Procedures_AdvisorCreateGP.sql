CREATE PROC Procedures_AdvisorCreateGP(
@semester_code VARCHAR(40),
@expected_graduation_date DATE,
@sem_credit_hours INT,
@advisor_id INT,
@student_id INT
)
AS
BEGIN
DECLARE @acquiredHours INT
SELECT @acquiredHours = acquired_hours
FROM Student
WHERE student_id = @student_id

IF(@acquiredHours <= 157)
RETURN;

INSERT INTO Graduation_Plan(semester_code, semester_credit_hours, expected_grad_date, advisor_id, student_id)
VALUES(@semester_code, @sem_credit_hours, @expected_graduation_date, @advisor_id, @student_id)
END
