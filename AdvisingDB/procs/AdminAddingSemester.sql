CREATE OR ALTER PROC AdminAddingSemester(
@start_date DATE,
@end_date DATE,
@semester_code VARCHAR(40)
)
AS
INSERT INTO Semester(semester_code, start_date, end_date)
VALUES(@semester_code, @start_date, @end_date)