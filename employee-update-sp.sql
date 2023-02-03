/* 
Write one procedure that can insert or update the employee 
(avoid using if statement to check the statement e.g. if (statement ==’Insert))
*/

-- procedure to insert or update employee data
CREATE PROCEDURE dbo.InsertOrUpdateEmployee
    (
    @EmployeeID INT,
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @Email VARCHAR(50),
    @Phone VARCHAR(50),
    @HireDate DATETIME,
    @JobID INT,
    @Salary MONEY,
    @CommissionPct MONEY,
    @ManagerID INT,
    @DepartmentID INT
)
AS
BEGIN
    -- Set up a variable to store the result
    DECLARE @Result INT

    -- Try to update the employee record
    UPDATE dbo.employees
    SET FirstName = @FirstName,
        LastName = @LastName,
        Email = @Email,
        Phone = @Phone,
        HireDate = @HireDate,
        JobID = @JobID,
        Salary = @Salary,
        CommissionPct = @CommissionPct,
        ManagerID = @ManagerID,
        DepartmentID = @DepartmentID
    WHERE EmployeeID = @EmployeeID

    -- Get the number of rows affected by the update
    SET @Result = @@ROWCOUNT

    -- If the update did not affect any rows, try to insert the employee record
    IF (@Result = 0)
    BEGIN
        INSERT INTO dbo.employees
            (EmployeeID, FirstName, LastName, Email, Phone, HireDate, JobID, Salary, CommissionPct, ManagerID, DepartmentID)
        VALUES
            (@EmployeeID, @FirstName, @LastName, @Email, @Phone, @HireDate, @JobID, @Salary, @CommissionPct, @ManagerID, @DepartmentID)
    END
END

-- Test the procedure
EXEC dbo.InsertOrUpdateEmployee
@EmployeeID = 1,
@FirstName = 'John',
@LastName = 'Doe',
@Email = 'johndoe@email.com',
@Phone = '123-456-7890',
@HireDate = '2022-01-01',
@JobID = 1,
@Salary = 50000,
@CommissionPct = 0.05,
@ManagerID = 2,
@DepartmentID = 1
