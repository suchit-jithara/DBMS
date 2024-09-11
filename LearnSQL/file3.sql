create table demo1 (
	id int not null primary key auto_increment, 
	name varchar(255), 
	city VARCHAR(255), 
	age int
);

replace into Worker set first_name = "Monika", JOINING_DATE= '2024-02-14 09:00:00';
replace into Worker set worker_id=1, first_name = "Monika", JOINING_DATE= '2024-02-14 09:00:00';
select * from Worker;


-- DDL Constraints.
-- Primary key is always not null, unique, and only one per table.
CREATE TABLE account (
	id INT,
    name VARCHAR(255) UNIQUE,
    balance INT DEFAULT 1001,
    PRIMARY KEY(id),
    CONSTRAINT acc_balance_chk CHECK (balance > 1000)
);

INSERT INTO account (id, name, balance) VALUES (1, "Jay Bhagvan", 1001);
INSERT INTO account (id, name, balance) VALUES (1, "ABC", 11);
INSERT INTO account (id, name) VALUES (2, "ABC");

DESC account;
select * from account;
DROP TABLE account;

CREATE TABLE user (
	id INT,
    account_ref_id INT,
    name VARCHAR(255) UNIQUE,
    PRIMARY KEY(id),
    FOREIGN KEY(account_ref_id) REFERENCES account(id)
);

INSERT INTO user (id, account_ref_id, name) VALUES (1, 1, "Jay Bhagvan");
SELECT * FROM user;
DROP TABLE  user;
DESC user;


-- --------------------------------------------------------------------------------------------------------------
-- ALTER Clause.

-- ADD new column
ALTER TABLE account ADD intrest FLOAT NOT NULL DEFAULT 0;

-- MODIFY the attributes.
ALTER TABLE account MODIFY intrest DOUBLE;

-- CHANGE COLUMN
-- modify the column name 
ALTER TABLE account CHANGE COLUMN intrest intrest_rate FLOAT;

-- DROP COLUMN
ALTER TABLE account DROP COLUMN intrest_rate;	

-- RENAME TO
-- Change table name
ALTER TABLE account RENAME TO savingaccount;
DESC savingaccount;
ALTER TABLE savingaccount RENAME TO account;


-- --------------------------------------------------------------------------------------------------------------
-- DML (DATA MANIPULATION LANGUAGE)

CREATE TABLE Customer (
	id INT,
    cname VARCHAR(255),
    address VARCHAR(255),
    gender CHAR(2),
    city VARCHAR(255),
    pincode INTEGER,
    PRIMARY KEY(id)
);

-- Insert
INSERT INTO customer 
	(id, cname, address, gender, city, pincode) VALUES 
    (1, "Jay Bhagvan", "Surat", "M", "Surat", 123456),
    (2, "Suchit", "Surat", "M", "Surat", 654321);
    
-- second way
-- insert the data  in the same order of the column in the table.
INSERT INTO customer VALUES 
    (3, "Jay Bhagvan", "Surat", "M", "Surat", 123456),
    (4, "Suchit", "Surat", "M", "Surat", 654321);
    
INSERT INTO customer (id, cname) VALUES 
    (6, "Jay Bhagvan");
    
SELECT * FROM customer;

-- UPDATE
UPDATE customer SET cname = "Suchit" WHERE id = 6;

-- UPDATE Multiple Rows
SET SQL_SAFE_UPDATES = 1;
UPDATE customer SET pincode = 111111; -- it give error: Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.
UPDATE customer SET pincode = pincode + 1; 

-- DELETE 
DELETE from customer WHERE id = 6;

-- DELETE all rows
SET SQL_SAFE_UPDATES = 1;
DELETE from customer;

-- --------------------------------------------------------------------------------------------------------------
-- referential constraint 
-- 1. you can not insert into the child table until you  insert in the perent table.
-- 2. you can not delete from the perent table untile the rows is presents in the child table which is refere to the parent table rows.

-- solution for delete 
-- 1. ON DELETE CASCADE --> if we delete from the parent table then auto maticaly delete from the child table.
-- 2. ON DELETE SET NULL --> if we delete from the parent table then they set the null value in foraign key in the child table

CREATE TABLE d1 (
	id INT,
    PRIMARY KEY(id)
);

CREATE TABLE d2 (
	id INT,
    d1_id INT,
    PRIMARY KEY(id),
    FOREIGN KEY(d1_id) REFERENCES d1(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE d3 (
	id INT,
    d1_id INT,
    PRIMARY KEY(id),
    FOREIGN KEY(d1_id) REFERENCES d1(id) ON DELETE SET NULL ON UPDATE CASCADE
);

INSERT INTO d1 (id) VALUES (1), (2);

INSERT INTO d2 (id, d1_id) VALUES (1, 1), (2, 2);

INSERT INTO d3 (id, d1_id) VALUES (1, 1), (2, 2);

DELETE FROM d1 WHERE id = 1;
SELECT * FROM d1;
SELECT * FROM d2;
SELECT * FROM d3;

UPDATE d1 SET id = 3 WHERE id = 2;


-- --------------------------------------------------------------------------------------------------------------
-- REPLACE
-- if data is present then replace it.
-- if data is not present then insert it.

