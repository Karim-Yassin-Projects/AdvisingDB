CREATE OR ALTER PROC Procedures_StudentSendingCHRequest (
@student_id INT,
@credit_hours INT,
@type VARCHAR(40),
@comment VARCHAR(40)
) AS
BEGIN

IF @type <> 'credit_hours'
	RETURN
DECLARE @advisor_id INT
SELECT @advisor_id = advisor_id
FROM Student s
WHERE s.student_id = @student_id

INSERT INTO Request(student_id,credit_hours,type,comment, advisor_id)
VALUES(@student_id, @credit_hours, @type, @comment, @advisor_id)
END