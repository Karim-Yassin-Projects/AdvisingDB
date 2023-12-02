CREATE OR ALTER PROC Procedures_AdvisorUpdateGP(
@expected_grad_date DATE,
@studentID INT
)
AS
BEGIN
UPDATE Graduation_Plan
SET expected_grad_date = @expected_grad_date
WHERE student_id = @studentID
END