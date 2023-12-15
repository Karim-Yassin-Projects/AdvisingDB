CREATE OR ALTER PROC AdminListStudentsWithAdvisors
AS 
SELECT s.*, a.advisor_name, a.email as advisor_email, a.office
FROM Student s
LEFT JOIN
Advisor a ON s.advisor_id = a.advisor_id