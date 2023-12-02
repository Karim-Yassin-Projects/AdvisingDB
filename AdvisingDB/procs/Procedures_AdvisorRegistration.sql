CREATE OR ALTER PROC Procedures_AdvisorRegistration(
@advisor_name VARCHAR(40),
@advisor_password VARCHAR(40),
@advisor_email VARCHAR(40),
@advisor_office VARCHAR(40),
@advisor_ID INT OUTPUT
)
AS
INSERT INTO Advisor(advisor_name, password, email, office)
VALUES(@advisor_name, @advisor_password, @advisor_email, @advisor_office)

SELECT @advisor_ID = SCOPE_IDENTITY();
Print @advisor_ID
