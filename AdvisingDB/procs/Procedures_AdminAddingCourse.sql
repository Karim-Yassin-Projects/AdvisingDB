CREATE OR ALTER PROC Procedures_AdminAddingCourse(
@major VARCHAR(40),
@semester INT,
@credit_hours INT,
@course_name VARCHAR(40),
@offered BIT
)
AS
INSERT INTO Course(major, semester, credit_hours, course_name, is_offered)
VALUES(@major, @semester, @credit_hours, @course_name, @offered)
