CREATE OR ALTER PROC AdminListStudentsWithAdvisors
AS 
SELECT s.*, a.*
FROM Student s
LEFT JOIN
Advisor a ON s.advisor_id = a.advisor_id