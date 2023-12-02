CREATE OR ALTER FUNCTION FN_Advisors_Request(
@advisor_id INT
)
RETURNS TABLE
AS
RETURN(
SELECT *
FROM Request
WHERE advisor_id = @advisor_id
)