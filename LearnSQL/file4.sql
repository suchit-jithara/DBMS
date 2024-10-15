Use ORG;

select * from employees;
select * from departments;
select * from salaries;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT
);

INSERT INTO employees (employee_id, first_name, last_name, department_id) VALUES
(1, 'John', 'Doe', 1),
(2, 'Jane', 'Smith', 2),
(3, 'Michael', 'Johnson', 1),
(4, 'Emily', 'Davis', 3),
(5, 'William', 'Brown', NULL);


CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO departments (department_id, department_name) VALUES
(1, 'Human Resources'),
(2, 'Finance'),
(3, 'IT');


CREATE TABLE salaries (
    salary_id INT PRIMARY KEY,
    employee_id INT,
    amount DECIMAL(10, 2)
);

INSERT INTO salaries (salary_id, employee_id, amount) VALUES
(1, 1, 50000.00),
(2, 2, 60000.00),
(3, 3, 55000.00),
(4, 4, 70000.00);


-- -----------------------------------------------------------------------------------------------

-- ALIAS (with column and table name)
SELECT employee_id AS eid FROM employees;
SELECT employee_id FROM employees AS e;


-- JOINS
-- for apply joins, there should be a common attribute, in parent and child table.

-- INNER JOIN 
-- here first, first row of left table is selected and check in right table if any row is present with the same value of depatment_id if present then they SELECT employee_id, first_name, last_name from parent table (empliyee table) and department_name from child table print on the console.
-- if there is a same column name in both table, we need to fetch this column from child table, for this condition we use d.department_name, here we use alians for more specific search.
SELECT e.employee_id, e.first_name, e.last_name, d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id;

SELECT *
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id;

SELECT *
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id
INNER JOIN salaries  s ON e.department_id = s.salary_id;

-- OUTER JOIN
-- LEFT JOIN
-- In LEFT JOIN all the values from the left  table is present and also match the value baced on condition is also present there for we use ON condition in LEFT JOIN query.
-- this returns a resulting table that all the data from left table and the matched data from the right table.
SELECT * 
FROM employees AS e 
LEFT JOIN departments AS d ON  e.department_id = d.department_id;

-- RIGHT JOIN
SELECT * 
FROM departments AS d 
RIGHT JOIN employees AS e ON  e.department_id = d.department_id;

-- FULL JOIN
-- this returns a resulting table that contains all data when there is a match on left or right table data.
SELECT * 
FROM employees AS e 
LEFT JOIN departments AS d ON  e.department_id = d.department_id 
UNION
SELECT * 
FROM departments AS d 
RIGHT JOIN employees AS e ON  e.department_id = d.department_id;

-- UNION ALL, can also be used this will duplicate values as well while UNION gives unique values.
SELECT * 
FROM employees AS e 
LEFT JOIN departments AS d ON  e.department_id = d.department_id 
UNION ALL
SELECT * 
FROM departments AS d 
RIGHT JOIN employees AS e ON  e.department_id = d.department_id;

-- CROSS JOIN
SELECT * FROM employees CROSS JOIN departments;

-- SELF JOIN 
-- this is use for unary relationship model 
SELECT  e2.employee_id , e1.department_id, e1.first_name, e2.last_name FROM employees AS e1 INNER JOIN employees AS e2 ON e1.employee_id = e2.employee_id;


-- ----------------------------------------------------------------------------------------------------------------------
-- Can we do INNER JOIN without using the INNER JOIN keyword?
-- yes
-- we remove INNER JOIN keyword and add ,
-- we use WHERE rather than ON clause
SELECT * FROM employees as e, departments as d where e.employee_id = d.department_id;

-- ----------------------------------------------------------------------------------------------------------------------

CREATE TABLE Dept1 (
	empid int PRIMARY KEY,
    name VARCHAR(255),
    role VARCHAR(255)
);

INSERT INTO Dept1 (empid, name, role) VALUES 
(1, "A", "engineer"),
(2, "B", "salesman"),
(3, "C", "manager"),
(4, "D", "salesman"),
(5, "E", "engineer");

CREATE TABLE Dept2 (
	empid int PRIMARY KEY,
    name VARCHAR(255),
    role VARCHAR(255)
);

INSERT INTO Dept2 (empid, name, role) VALUES 
(3, "C", "manager"),
(6, "F", "marketing"),
(7, "G", "salesman");

INSERT INTO Dept2 (empid, name, role) VALUES 
(4, "C", "marketing");

SELECT * FROM Dept1;
SELECT * FROM Dept2;

-- SET OPERATIONS
-- in mathematics, a SET is a collection of distinct objects, considered as an object in its own right.
-- use to combine multiple select stetments.
-- Always give distict rows.
-- set operations are performe row by rows where join is perform on the columns.

-- UNION
-- need to same the column in the both tables.
SELECT * FROM employees
UNION
SELECT * FROM department;

-- INTERSECT
-- here we use using rather than the ON codition because we know in both table column is same.
SELECT DISTINCT * FROM Dept1 INNER JOIN Dept2 using(empid);

-- MINUS
SELECT Dept1.* FROM Dept1 LEFT JOIN Dept2 USING(empid) WHERE Dept2.empid IS NULL; 