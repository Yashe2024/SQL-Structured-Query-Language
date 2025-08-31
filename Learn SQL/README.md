# SQL Tutorial – Detailed Guide

This is a complete SQL tutorial covering basics to advanced concepts with examples.  
Works across MySQL, SQL Server, PostgreSQL, Oracle.  

---

## Table of Contents
1. [SQL Home](#sql-home)  
2. [SQL Intro](#sql-intro)  
3. [SQL Syntax](#sql-syntax)  
4. [SQL SELECT Statements](#sql-select-statements)  
5. [SQL Data Manipulation](#sql-data-manipulation)  
6. [SQL Advanced Queries](#sql-advanced-queries)  
7. [SQL Joins](#sql-joins)  
8. [SQL Set Operations](#sql-set-operations)  
9. [SQL Grouping & Filtering](#sql-grouping--filtering)  
10. [SQL Table Operations](#sql-table-operations)  
11. [SQL Programmability](#sql-programmability)  
12. [SQL Database Management](#sql-database-management)  
13. [SQL Tables](#sql-tables)  
14. [SQL Constraints](#sql-constraints)  
15. [SQL Advanced Topics](#sql-advanced-topics)  

---

## SQL Home
SQL (**Structured Query Language**) is the standard language for relational databases.  
Supported by: MySQL, SQL Server, Oracle, PostgreSQL  

**Key Features**
- Create databases, tables, views, indexes  
- Insert, update, delete, select data  
- Secure data with constraints  
- Support for transactions & rollbacks  

---

## SQL Intro
- Declarative: specify *what* you want, not *how*  
- Developed in 1970s by IBM, standardized by ANSI  
- Used in BI, web apps, analytics, ETL  

**Benefits**
- Platform independent  
- English-like syntax  
- Efficient with large data  

---

## SQL Syntax
```sql
SELECT column1, column2
FROM table_name
WHERE condition
ORDER BY column1;
-- Select columns
SELECT CustomerName, City FROM Customers;

-- Distinct values
SELECT DISTINCT Country FROM Customers;

-- Filter
SELECT * FROM Customers WHERE Country='Mexico';

-- Order by
SELECT * FROM Products ORDER BY Price DESC;

-- AND / OR / NOT
SELECT * FROM Customers WHERE Country='Spain' AND City='Madrid';
SELECT * FROM Customers WHERE Country='Germany' OR Country='Spain';
SELECT * FROM Customers WHERE NOT Country='Spain';
-- Insert
INSERT INTO Customers (CustomerName, City, Country)
VALUES ('Cardinal', 'Stavanger', 'Norway');

-- NULL check
SELECT * FROM Customers WHERE Address IS NULL;

-- Update
UPDATE Customers SET City='Frankfurt' WHERE CustomerID=1;

-- Delete
DELETE FROM Customers WHERE CustomerID=1;
-- Limit results
SELECT TOP 5 * FROM Customers;   -- SQL Server
SELECT * FROM Customers LIMIT 5; -- MySQL

-- Aggregates
SELECT MIN(Price), MAX(Price), AVG(Price) FROM Products;

-- LIKE
SELECT * FROM Customers WHERE CustomerName LIKE 'A%';

-- IN
SELECT * FROM Customers WHERE Country IN ('Germany','France','UK');

-- BETWEEN
SELECT * FROM Products WHERE Price BETWEEN 10 AND 20;

-- Aliases
SELECT CustomerID AS ID, CustomerName AS Name FROM Customers;

-- Inner Join
SELECT Orders.OrderID, Customers.CustomerName
FROM Orders
INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;

-- Left Join
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID=Orders.CustomerID;

-- Right Join
SELECT Orders.OrderID, Employees.LastName
FROM Orders
RIGHT JOIN Employees ON Orders.EmployeeID=Employees.EmployeeID;

-- Full Join
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
FULL OUTER JOIN Orders ON Customers.CustomerID=Orders.CustomerID;

-- Self Join
SELECT A.CustomerName, B.CustomerName, A.City
FROM Customers A, Customers B
WHERE A.City=B.City AND A.CustomerID<>B.CustomerID;

-- UNION removes duplicates
SELECT City FROM Customers
UNION
SELECT City FROM Suppliers;

-- UNION ALL keeps duplicates
SELECT City FROM Customers
UNION ALL
SELECT City FROM Suppliers;

-- Group By
SELECT COUNT(CustomerID), Country 
FROM Customers GROUP BY Country;

-- Having
SELECT Country, COUNT(CustomerID) 
FROM Customers GROUP BY Country 
HAVING COUNT(CustomerID) > 5;

-- Exists
SELECT * FROM Customers 
WHERE EXISTS (SELECT * FROM Orders WHERE Customers.CustomerID=Orders.CustomerID);

-- Any & All
SELECT ProductName 
FROM Products 
WHERE Price > ANY (SELECT Price FROM Products WHERE CategoryID=1);

-- Copy into new table
SELECT * INTO CustomersBackup FROM Customers;

-- Insert from another table
INSERT INTO CustomersBackup SELECT * FROM Customers;

-- CASE expression
SELECT OrderID, Quantity,
CASE
    WHEN Quantity > 30 THEN 'Large'
    WHEN Quantity BETWEEN 10 AND 30 THEN 'Medium'
    ELSE 'Small'
END AS OrderSize
FROM OrderDetails;

-- Replace NULL
SELECT ISNULL(Address, 'No Address') FROM Customers; -- SQL Server

-- Stored Procedure
CREATE PROCEDURE SelectAllCustomers AS
SELECT * FROM Customers;

EXEC SelectAllCustomers;

-- Comments
-- Single line
/* Multi-line */

-- Operators
+ - * / %         -- Arithmetic
= < > <= >= <>    -- Comparison
AND OR NOT        -- Logical

-- Create / Drop DB
CREATE DATABASE TestDB;
DROP DATABASE TestDB;

-- Backup
BACKUP DATABASE TestDB TO DISK='D:\backup\testdb.bak';

-- Create Table
CREATE TABLE Customers (
    CustomerID int PRIMARY KEY,
    CustomerName varchar(255) NOT NULL,
    Country varchar(50)
);

-- Drop Table
DROP TABLE Customers;

-- Alter Table
ALTER TABLE Customers ADD Email varchar(255);
ALTER TABLE Customers DROP COLUMN Email;

-- Not Null
CREATE TABLE Persons (ID int NOT NULL, Name varchar(255) NOT NULL);

-- Unique
CREATE TABLE Persons (ID int UNIQUE, Email varchar(255) UNIQUE);

-- Primary Key
CREATE TABLE Persons (ID int PRIMARY KEY, Name varchar(255));

-- Foreign Key
CREATE TABLE Orders (
    OrderID int PRIMARY KEY,
    CustomerID int,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Check
CREATE TABLE Products (ID int PRIMARY KEY, Price int CHECK (Price > 0));

-- Default
CREATE TABLE Orders (ID int, OrderDate date DEFAULT GETDATE());

-- Index
CREATE INDEX idx_customername ON Customers(CustomerName);

-- Auto Increment (MySQL)
CREATE TABLE Persons (
    ID int AUTO_INCREMENT PRIMARY KEY,
    Name varchar(255)
);

-- Date filtering
SELECT * FROM Orders 
WHERE OrderDate BETWEEN '2024-01-01' AND '2024-12-31';

-- Views
CREATE VIEW GermanyCustomers AS
SELECT * FROM Customers WHERE Country='Germany';

-- SQL Injection (unsafe)
SELECT * FROM Users WHERE Username='' OR '1'='1';
-- ✅ Use prepared statements to prevent injection
