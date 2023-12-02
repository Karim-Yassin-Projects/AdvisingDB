CREATE PROC Procedures_AdminAddExam (
@Type  VARCHAR(40),
@date DATETIME,
@course_id INT
)
AS

INSERT INTO MakeUp_Exam (type, date, course_id)
VALUES (@type, @date, @course_id)
