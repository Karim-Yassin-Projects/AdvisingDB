CREATE OR ALTER PROC Procedures_AdminIssueInstallment (
@payment_id INT
)
AS
BEGIN

DECLARE @start_date DATETIME
SELECT @start_date = start_date
FROM Payment
WHERE payment_id = @payment_ID

DECLARE @deadline DATETIME
SET @deadline = DATEADD(MONTH, 1, @start_date)


DECLARE @installment_count INT
SELECT @installment_count = n_installments
FROM Payment 
WHERE payment_id = @payment_id

DECLARE @installment_number INT = 1

WHILE  @installment_number <= @installment_count
BEGIN
INSERT INTO Installment(payment_id, deadline, amount, status, start_date)
VALUES (@payment_id, @deadline, (SELECT amount FROM  Payment  WHERE payment_id= @payment_id) / @installment_count, 'NotPaid', @start_date)

SET @deadline = DATEADD(MONTH,1,@deadline)
SET @start_date = DATEADD(MONTH, 1 , @start_date)
SET @installment_number = @installment_number +1
END
END
