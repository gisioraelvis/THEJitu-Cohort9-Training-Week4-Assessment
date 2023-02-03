/* 
Write an SQL query to fetch only odd rows from the table (create dummy data to use)
 */

-- Create the Customers table
CREATE TABLE Customers
(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50) NOT NULL,
    ContactName VARCHAR(50) NOT NULL,
    Address VARCHAR(50) NOT NULL,
    City VARCHAR(50) NOT NULL,
    PostalCode VARCHAR(50) NOT NULL,
    Country VARCHAR(50) NOT NULL
);

-- Insert some dummy data
INSERT INTO Customers
    (CustomerID, CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES
    (1, 'John', 'Doe', '123 Main St', 'Anytown', '12345', 'USA'),
    (2, 'Jane', 'Doe', '123 Main St', 'Anytown', '12345', 'USA'),
    (3, 'John', 'Smith', '123 Main St', 'Anytown', '12345', 'USA'),
    (4, 'Jane', 'Smith', '123 Main St', 'Anytown', '12345', 'USA'),
    (5, 'John', 'Doe', '123 Main St', 'Anytown', '12345', 'Canada'),
    (6, 'Jane', 'Doe', '123 Main St', 'Anytown', '12345', 'Canada'),
    (7, 'John', 'Smith', '123 Main St', 'Anytown', '12345', 'Canada'),
    (8, 'Jane', 'Smith', '123 Main St', 'Anytown', '12345', 'Canada'),
    (9, 'John', 'Doe', '123 Main St', 'Anytown', '12345', 'Mexico'),
    (10, 'Jane', 'Doe', '123 Main St', 'Anytown', '12345', 'Mexico'),
    (11, 'John', 'Smith', '123 Main St', 'Anytown', '12345', 'Mexico'),
    (12, 'Jane', 'Smith', '123 Main St', 'Anytown', '12345', 'Mexico'),
    (13, 'John', 'Doe', '123 Main St', 'Anytown', '12345', 'Brazil'),
    (14, 'Jane', 'Doe', '123 Main St', 'Anytown', '12345', 'Brazil'),
    (15, 'John', 'Smith', '123 Main St', 'Anytown', '12345', 'Brazil'),
    (16, 'Jane', 'Smith', '123 Main St', 'Anytown', '12345', 'Brazil'),
    (17, 'John', 'Doe', '123 Main St', 'Anytown', '12345', 'France');
GO

-- list odd rows
SELECT *
FROM dbo.Customers
WHERE CustomerID % 2 = 1;


