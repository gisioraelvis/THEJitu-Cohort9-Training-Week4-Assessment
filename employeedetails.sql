/* 
Write an SQL query to fetch duplicate records from EmployeeDetails 
(without considering the primary key – EmpId)(create dummy data to use)
 */

-- Create the EmployeeDetails table
CREATE TABLE EmployeeDetails
(
    EmpId INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Phone VARCHAR(50) NOT NULL,
    HireDate DATETIME NOT NULL
);
GO

-- Insert some dummy data
INSERT INTO EmployeeDetails
    (EmpId, FirstName, LastName, Email, Phone, HireDate)
VALUES
    (1, 'John', 'Doe', 'johndoe@example.com', '555-555-5555', '2022-01-01'),
    (2, 'Jane', 'Doe', 'janedoe@example.com', '555-555-5556', '2022-01-02'),
    (3, 'John', 'Smith', 'johnsmith@example.com', '555-555-5557', '2022-01-03'),
    (4, 'Jane', 'Smith', 'janesmith@example.com', '555-555-5558', '2022-01-04'),
    (5, 'John', 'Doe', 'johndoe@example.com', '555-555-5555', '2022-01-01'),
    (6, 'Jane', 'Doe', 'janedoe@example.com', '555-555-5556', '2022-01-02'),
    (7, 'John', 'Smith', 'johnsmith@example.com', '555-555-5557', '2022-01-03'),
    (8, 'Jane', 'Smith', 'janesmith@example.com', '555-555-5558', '2022-01-04');
GO

-- Fetch duplicate records, ignoring the primary key
SELECT FirstName, LastName, Email, Phone, HireDate, COUNT(*)
FROM dbo.EmployeeDetails
GROUP BY FirstName, LastName, Email, Phone, HireDate
HAVING COUNT(*) > 1;

