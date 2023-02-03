/* 
In database called 'Assessment'
Create two tables, employees and sales. 
Get a list of all employees who did not make any sales.
*/

-- Create a new table called 'employees' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.employees', 'U') IS NOT NULL
 DROP TABLE dbo.employees
 GO
-- Create the table in the specified schema
CREATE TABLE dbo.employees
(
    EmployeeID INT NOT NULL PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Phone VARCHAR(50) NOT NULL,
    HireDate DATETIME NOT NULL,
    JobID INT NOT NULL,
    Salary MONEY NOT NULL,
    CommissionPct MONEY NOT NULL,
    ManagerID INT NOT NULL,
    DepartmentID INT NOT NULL
);
GO

-- Create a new table called 'sales' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.sales', 'U') IS NOT NULL
 DROP TABLE dbo.sales
 GO
-- Create the table in the specified schema
CREATE TABLE dbo.sales
(
    SalesID INT NOT NULL PRIMARY KEY,
    EmployeeID INT NOT NULL,
    CustomerID INT NOT NULL,
    ProductID INT NOT NULL,
    StoreID INT NOT NULL,
    DateSold DATETIME NOT NULL,
    Quantity INT NOT NULL
);
GO

-- Insert dummy data into the 'employees' table
INSERT INTO dbo.employees
    (EmployeeID, FirstName, LastName, Email, Phone, HireDate, JobID, Salary, CommissionPct, ManagerID, DepartmentID)
VALUES
    (1, 'John', 'Doe', 'john.doe@email.com', '123-456-7890', '2022-01-01', 1, 50000, 0.05, 2, 1),
    (2, 'Jane', 'Doe', 'jane.doe@email.com', '123-456-7891', '2022-02-01', 2, 60000, 0.06, 3, 2),
    (3, 'Jim', 'Smith', 'jim.smith@email.com', '123-456-7892', '2022-03-01', 3, 70000, 0.07, 4, 3),
    (4, 'Sarah', 'Johnson', 'sarah.johnson@email.com', '123-456-7893', '2022-04-01', 4, 80000, 0.08, 5, 4),
    (5, 'Tom', 'Brown', 'tom.brown@email.com', '123-456-7894', '2022-05-01', 5, 90000, 0.09, 6, 5),
    (6, 'Amy', 'Jones', 'amy.jones@email.com', '123-456-7895', '2022-06-01', 6, 100000, 0.1, 7, 6),
    (7, 'Michael', 'Davis', 'michael.davis@email.com', '123-456-7896', '2022-07-01', 7, 110000, 0.11, 8, 7),
    (8, 'Emily', 'Miller', 'emily.miller@email.com', '123-456-7897', '2022-08-01', 8, 120000, 0.12, 9, 8),
    (9, 'Matthew', 'Wilson', 'matthew.wilson@email.com', '123-456-7898', '2022-09-01', 9, 130000, 0.13, 10, 9),
    (10, 'Ashley', 'Anderson', 'ashley.anderson@email.com', '123-456-7899', '2022-10-01', 10, 140000, 0.14, 11, 10),
    (11, 'John', 'Doe', 'johndoe@example.com', '555-555-5555', '2022-01-01', 1, 50000, 0, 1, 1),
    (12, 'Jane', 'Doe', 'janedoe@example.com', '555-555-5556', '2022-01-02', 2, 55000, 0, 2, 2),
    (13, 'Jim', 'Smith', 'jimsmith@example.com', '555-555-5557', '2022-01-03', 3, 60000, 0, 3, 3),
    (14, 'Sara', 'Johnson', 'sarajohnson@example.com', '555-555-5558', '2022-01-04', 4, 65000, 0, 4, 4),
    (15, 'Alex', 'Williams', 'alexwilliams@example.com', '555-555-5559', '2022-01-05', 5, 70000, 0, 5, 5)
GO

-- Insert dummy data into the 'sales' table
INSERT INTO dbo.sales
    (SalesID, EmployeeID, CustomerID, ProductID, StoreID, DateSold, Quantity)
VALUES
    (1, 1, 1001, 2001, 3001, '2022-11-01', 5),
    (2, 2, 1002, 2002, 3002, '2022-11-02', 10),
    (3, 3, 1003, 2003, 3003, '2022-11-03', 15),
    (4, 4, 1004, 2004, 3004, '2022-11-04', 20),
    (5, 5, 1005, 2005, 3005, '2022-11-05', 25),
    (6, 6, 1006, 2006, 3006, '2022-11-06', 30),
    (7, 7, 1007, 2007, 3007, '2022-11-07', 35),
    (8, 8, 1008, 2008, 3008, '2022-11-08', 40),
    (9, 9, 1009, 2009, 3009, '2022-11-09', 45),
    (10, 10, 1010, 2010, 3010, '2022-11-10', 50);
GO

-- list of all employees who did not make any sales
SELECT
    e.EmployeeID,
    e.FirstName,
    e.LastName,
    e.Email,
    e.Phone,
    e.HireDate,
    e.JobID,
    e.Salary,
    e.CommissionPct,
    e.ManagerID,
    e.DepartmentID
FROM dbo.employees AS e
    LEFT JOIN dbo.sales AS s ON e.EmployeeID = s.EmployeeID
WHERE s.EmployeeID IS NULL
GO






