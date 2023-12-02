CREATE OR ALTER PROC Procedures_StudentAddMobile(
@studentID INT,
@mobile_number VARCHAR(40)
)
AS
BEGIN
INSERT INTO Student_Phone(student_id, phone_number)
VALUES(@studentID, @mobile_number)
END
