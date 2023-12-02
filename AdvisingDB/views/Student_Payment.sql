CREATE OR ALTER VIEW Student_Payment AS
SELECT p.payment_id, p.amount, p.deadline, p.n_installments, p.status,
       p.fund_percentage, p.start_date, p.semester_code,
       s.student_id, s.f_name, s.l_name, s.Gpa, s.faculty, s.email, s.major,
       s.password, s.financial_status, s.semester, s.acquired_hours, s.assigned_hours,
       s.advisor_id
FROM Payment p, Student s
WHERE p.student_id = s.student_id