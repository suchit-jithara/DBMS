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

-- Outer Join
-- Left Join
select * 
from employees as e 
LEFT JOIN departments as d ON  e.department_id = d.department_id;

-- Right Joint
select * 
from departments as d 
RIGHT JOIN employees as e ON  e.department_id = d.department_id;

-- crose join
select * from employees CROSS JOIN departments;

-- self join 
select  e2.employee_id , e1.department_id, e1.first_name, e2.last_name from employees as e1 INNER JOIN employees as e2;