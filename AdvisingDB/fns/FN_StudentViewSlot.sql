CREATE OR ALTER FUNCTION FN_StudentViewSlot(
@courseID INT, 
@instructorID INT
)
RETURNS TABLE
AS RETURN(
SELECT s.slot_id, s.slot_location, s.slot_time, s.slot_day
FROM Slot s
INNER JOIN 
Course c ON s.course_id = c.course_id
INNER JOIN 
Instructor i ON s.instructor_id = i.instructor_id
WHERE s.course_id = @courseID AND s.instructor_id = @instructorID
)
