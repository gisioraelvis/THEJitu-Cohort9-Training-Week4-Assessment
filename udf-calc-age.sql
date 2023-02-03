/* 
Write a function that can calculate age given a certain date of birth
 */

-- UDF to calculate age from date of birth in format 'YYYY-MM-DD'
CREATE FUNCTION dbo.CalculateAge
    (
    @DateOfBirth DATETIME
)
RETURNS INT
AS
BEGIN
    -- Declare the return variable here
    DECLARE @Age INT

    -- Calculate the age here
    SET @Age = DATEDIFF(year, @DateOfBirth, GETDATE())

    -- Return the age of the person
    RETURN @Age
END
GO

-- calculate the age of a person born on 20th September 1998
SELECT dbo.CalculateAge('1998-09-20') AS Age
GO



