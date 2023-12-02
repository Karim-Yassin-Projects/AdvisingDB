CREATE OR ALTER PROC Procedures_AdminLinkInstructor(
@InstructorID INT,
@CourseID INT,
@SlotID INT
)
AS
UPDATE Slot
SET instructor_id = @InstructorID
WHERE slot_id = @SlotID AND course_id = @CourseID