CREATE OR ALTER VIEW all_Pending_Requests AS
SELECT r.*, s.f_name + ' ' + s.l_name AS student_name, a.advisor_name
FROM Request r
INNER JOIN
Student s ON r.student_id = s.student_id
INNER JOIN
Advisor a ON r.advisor_id = a.advisor_id
WHERE r.status = 'pending'