CREATE OR ALTER FUNCTION FN_IsEvenSemesterCode
(
@semesterCode varchar(40)
)
RETURNS BIT
BEGIN

	IF LEN(@semesterCode) = 5
		RETURN CASE WHEN RIGHT(@semesterCode, 2) = 'R2' THEN 1 ELSE 0 END
	RETURN CASE WHEN LEFT(@semesterCode, 1) = 'S' THEN 1 ELSE 0 END
END
