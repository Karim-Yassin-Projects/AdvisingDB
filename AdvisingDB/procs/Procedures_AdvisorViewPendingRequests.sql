CREATE OR ALTER PROC Procedures_AdvisorViewPendingRequests(
@advisorID INT
)
AS
BEGIN
SELECT r.*
FROM Request r
WHERE r.advisor_id = @advisorID AND r.status = 'pending'
END
