CREATE OR ALTER VIEW Advisors_Graduation_Plan AS
SELECT gp.plan_id,gp.semester_code,gp.semester_credit_hours,gp.expected_grad_date,gp.student_id, a.advisor_id, a.advisor_name
FROM Graduation_Plan gp
INNER JOIN
Advisor a ON gp.advisor_id = a.advisor_id