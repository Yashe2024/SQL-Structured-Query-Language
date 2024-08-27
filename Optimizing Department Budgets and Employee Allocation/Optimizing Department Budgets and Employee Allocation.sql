-- 2.1 Select the last name of all employees.
select LastName from employees;

-- 2.2 Select the last name of all employees, without duplicates.
Select distinct LastName from Employees;

-- 2.3 Select all the data of employees whose last name is "Smith".
Select * from Employees where LastName='Smith';

-- 2.4 Select all the data of employees whose last name is "Smith" or "Doe".
Select * from Employees where LastName in('Smith', 'Doe');

-- 2.5 Select all the data of employees that work in department 14.
Select * from Employees where department='14';

-- 2.6 Select all the data of employees that work in department 37 or department 77.
Select * from Employees where department in ('37', '77');

-- 2.7 Select all the data of employees whose last name begins with an "S".
select LastName from employees where LastName like 'S%';

-- 2.8 Select the sum of all the departments' budgets.
select sum(budget) as Departments_Budgets from departments;

-- 2.9 Select the number of employees in each department 
--(you only need to show the department code and the number of employees).
select department, count(*) from employees group by department;

-- 2.10 Select all the data of employees, including each employee's department's data.
select a.*,b.* from employees a join departments b on a.department=b.code;

-- 2.11 Select the name and last name of each employee, along with the name and budget of the employee's department.
select a.name,a.lastname,b.name department_name,b.budget
from employees a join departments b 
on a.department=b.code;

-- 2.12 Select the name and last name of employees working for departments with a budget greater than $60,000.
SELECT Employees.Name, LastName
  FROM Employees INNER JOIN Departments
  ON Employees.Department = Departments.Code
    AND Departments.Budget > 60000;

-- 2.13 Select the departments with a budget larger than the average budget of all the departments.
select * from departments where budget > (select avg(budget) from departments
);

-- 2.14 
-- Select the names of departments with more than two employees.
select name from departments 
where code in ( select department  from employees  group by department having count (*) >2);

-- 2.15
-- Very Important
-- Select the name and last name of employees working for departments with second lowest budget.

WITH RankedBudgets AS (
    SELECT d.Code, d.Name AS DepartmentName, d.Budget, 
           ROW_NUMBER() OVER (ORDER BY d.Budget DESC) AS BudgetRank
    FROM Departments d
)
SELECT e.SSN, e.Name, e.LastName, d.DepartmentName, d.Budget
FROM Employees e
INNER JOIN RankedBudgets d ON e.Department = d.Code
WHERE d.BudgetRank = 2;

-- 2.16
-- Add a new department called "Quality Assurance", with a budget of $40,000 and departmental code 11. 
-- Add an employee called "Mary Moore" in that department, with SSN 847-21-9811.
insert into departments values ('11','Quality Assurance','40000');
insert into EMPLOYEES values (847219811,'Mary','Moore','11');

-- Reduce the budget of all departments by 10%.
update departments
set budget= budget * 0.90;

-- Reassign all employees from the Research department (code 77) to the IT department (code 14).
update employees 
set department = 14
where department = '77';

-- Delete from the table all employees in the IT department (code 14).
delete employees 
where department = 14;

-- 2.20
-- Delete from the table all employees who work in departments with a budget greater than or equal to $60,000.
delete from employees 
where department in (
select code
from departments	
where budget >=60000
);

-- 2.21
-- Delete from the table all employees.
Delete from employees;