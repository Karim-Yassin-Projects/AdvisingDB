CREATE OR ALTER VIEW Courses_Slots_Instructor AS
SELECT c.course_id, c.course_name, s.slot_id, s.slot_day, s.slot_time, s.slot_location, i.instructor_name
FROM Course c
INNER JOIN 
Slot s ON c.course_id = s.course_id
LEFT JOIN 
Instructor i ON s.instructor_id = i.instructor_id