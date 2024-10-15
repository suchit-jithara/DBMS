-- Sub Querys 
-- alternative of joins
-- EXAMPLE: query1(query2)
-- Generally outer query is depending on inner query, because inner query is fust execute and then based on the output outer query is execute.

-- EXAMPLE: select * from table where id IN (select * from table where name="cat");






-- ------------------------------------------------------------------------------------
-- view 

SELECT * FROM employees;

-- Creating a view
CREATE VIEW custom_view AS SELECT first_name, last_name FROM employees;
SELECT * FROM custom_view;

ALTER VIEW custom_view AS SELECT employee_id, first_name, last_name FROM employees;

DROP VIEW IF EXISTS custom_view;