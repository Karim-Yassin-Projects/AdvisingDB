CREATE OR ALTER VIEW view_Students AS
SELECT s.*
FROM Student s
WHERE s.financial_status = 1