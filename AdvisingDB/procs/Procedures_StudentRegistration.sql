CREATE OR ALTER PROC Procedures_StudentRegistration(
@first_name	VARCHAR(40),
@last_name VARCHAR(40),
@password VARCHAR(40),
@faculty VARCHAR(40),
@email VARCHAR(40),
@major VARCHAR(40),
@semester INT,
@student_id INT OUTPUT
)
AS

INSERT INTO Student (f_name, l_name, password, faculty, email, major, semester, financial_status)
VALUES(@first_name, @last_name, @password, @faculty, @email, @major, @semester, 1)

SELECT @student_id = SCOPE_IDENTITY()


