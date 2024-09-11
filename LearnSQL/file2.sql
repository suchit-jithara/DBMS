-- select query execution is from RIGHT to LEFT.
SELECT WORKER_ID, FIRST_NAME, SALARY FROM Worker;

-- we can use select without from, using the DUAL Table.
-- Dual tables are dummy tables created by MySQL, help users to do certain obvious actions without referring to user defined tables.
SELECT 1 + 10;
SELECT now();
SELECT lcase("JAY BHAGVAN");
SELECT ucase("jay bhagvan");

-- WHERE clause (Reduce rows based on given conditions.)
SELECT * FROM Worker where SALARY > 100000;
SELECT * FROM Worker where DEPARTMENT = 'HR';

-- BETWEEN clause (in below query 100000 and 300000 are inclusive.)
SELECT * FROM Worker WHERE SALARY BETWEEN 100000 AND 300000;

-- AND, OR clause
SELECT * FROM Worker where DEPARTMENT = 'HR' AND LAST_NAME = 'Arora';
SELECT * FROM Worker where DEPARTMENT = 'HR' OR LAST_NAME = 'Arora'; 

-- IN Clause (for reduse the multiple or statment we can use IN clause.)
SELECT * FROM Worker where DEPARTMENT = 'HR' or DEPARTMENT = 'Admin' or DEPARTMENT = 'Account'; 
SELECT * FROM Worker where DEPARTMENT IN ('HR', 'Admin', 'Account'); 

-- NOT 
SELECT * FROM Worker where DEPARTMENT NOT IN ('HR', 'Admin', 'Account'); 

SELECT * FROM Worker where SALARY BETWEEN 100000 and 500000;

-- IS NULL Cluse 
SELECT * FROM Worker WHERE DEPARTMENT IS NULL;

-- Pattern Searching / wildcard
select * from worker WHERE FIRST_NAME LIKE '_i%'; 
-- _ only one charachter.
-- % any number of charachter.
-- it means first later should be any thing but second shoud be i and after i infinite number of later should be alows. 

-- ORDER BY Clause
-- default value is ASC
select * from worker ORDER BY  SALARY;
select * from worker ORDER BY  SALARY DESC;

-- Distinct
select * from worker;
SELECT DISTINCT FIRST_NAME from Worker; -- here print only distinct names
SELECT DISTINCT DEPARTMENT from Worker; -- here print only distinct department.
SELECT DISTINCT DEPARTMENT, FIRST_NAME from Worker; -- here print if combination of department and firstName is distinct.

-- Aggrigation functions
-- An aggregate function is a function that performs a calculation on a set of values, and returns a single value.
-- Aggregate functions are often used with the GROUP BY clause of the SELECT statement. The GROUP BY clause splits the result-set into groups of values and the aggregate function can be used to return a single value for each group.
-- Aggregate functions ignore null values (except for COUNT()).
SELECT MAX(SALARY) FROM Worker;
SELECT COUNT(FIRST_NAME) FROM Worker;
SELECT AVG(SALARY) FROM Worker;
SELECT MIN(SALARY) FROM Worker;
SELECT SUM(SALARY) FROM Worker;

SELECT MIN(FIRST_NAME) FROM Worker;
SELECT MAX(FIRST_NAME) FROM Worker;
SELECT SUM(FIRST_NAME) FROM Worker;

-- The word group is sometimes confused with the word aggregate. An aggregate is a collection of people who happen to be at the same place at the same time but who have no other connection to one another. Example: The people gathered in a restaurant on a particular evening are an example of an aggregate, not a group.
-- Group By
-- The GROUP BY clause groups similar or identical values in a table and is used with aggregate functions like AVG(), SUM(), MAX(), MIN(), COUNT(), etc. It is employed with the SELECT statement and is positioned after the WHERE clause. Unlike DISTINCT, GROUP BY doesn’t directly remove duplicate records; instead, it groups similar values into sets and applies aggregate functions.
select DEPARTMENT from worker GROUP BY DEPARTMENT; -- here we not use aggrigate function so it act like distinct.
select DEPARTMENT, sum(SALARY) from worker GROUP BY DEPARTMENT;
select DEPARTMENT, COUNT(WORKER_ID) from worker GROUP BY DEPARTMENT;
select DEPARTMENT, COUNT(FIRST_NAME) from worker GROUP BY DEPARTMENT;

select DEPARTMENT, FIRST_NAME, sum(SALARY) from worker GROUP BY DEPARTMENT, FIRST_NAME;
select DEPARTMENT, FIRST_NAME, sum(SALARY) from worker GROUP BY DEPARTMENT;


-- Having 
-- if we want a filtering with group by cluse then we can use a HAVING clause, like where with SELECT clause.
-- having is only worke with the groupe by.
select DEPARTMENT, count(WORKER_ID) from worker GROUP BY DEPARTMENT HAVING COUNT(WORKER_ID) >2;
select DEPARTMENT, count(WORKER_ID) from worker GROUP BY DEPARTMENT HAVING max(SALARY) > 200000;
select DEPARTMENT, count(WORKER_ID), max(SALARY) from worker GROUP BY DEPARTMENT HAVING max(SALARY) > 200000;


-- Genral order of command 
select DEPARTMENT 
from worker 
where SALARY > 200000 
GROUP BY DEPARTMENT 
HAVING count(WORKER_ID) >1;