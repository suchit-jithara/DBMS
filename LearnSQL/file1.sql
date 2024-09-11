create DATABASE ORG;

SHOW DATABASES;
USE ORG;

-- DQL(Learning Data Query Language)
-- here we create a three table for learning perpuse, after creating this tables we can able to see the ER- Diagram of this, first go in the Databse -> reverse Engineering.

CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    FIRST_NAME CHAR(25),
    LAST_NAME CHAR(25),
    SALARY INT(15),
    JOINING_DATE DATETIME,
    DEPARTMENT CHAR(25)
);
 
-- MySQL uses the AUTO_INCREMENT keyword to perform an auto-increment feature.
-- By default, the starting value for AUTO_INCREMENT is 1, and it will increment by 1 for each new record.
-- ALTER TABLE WORKER_ID AUTO_INCREMENT=100; now WORKER_ID is start from 100
-- if we not provide the WORKER_ID then they add auto incremented value.

-- in below insert query if we insert all the column of table then we don't need to add column names in the query, but remember you need to add all the values in the same order of the table column.
INSERT INTO Worker 
    (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES 
    (001, 'Monika', 'Arora', 100000, '2020-02-14 09:00:00', 'HR'),
    (002, 'Niharika', 'Verma', 80000, '2021-06-11 09:00:00', 'Admin'),
    (003, 'Vishal', 'Singhal', 300000, '2019-01-12 09:00:00', 'HR'),
    (004, 'Amitabh', 'Singh', 500000, '2018-12-23 09:00:00', 'Admin'),
    (005, 'Vivek', 'Bhati', 600000, '2019-03-11 09:00:00', 'Admin'),
    (006, 'Vipul', 'Diwan', 200000, '2020-07-15 09:00:00', 'Account'),
    (007, 'Satish', 'Kumar', 75000, '2021-01-01 09:00:00', 'Account'),
    (008, 'Geetika', 'Chauhan', 90000, '2021-04-11 09:00:00', 'Admin');

INSERT INTO Worker 
    (FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES 
    ('Monika', 'Arora', 100000, '2020-02-14 09:00:00', 'HR');
    
SELECT * FROM Worker ;

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus 
    (WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES 
    (001, 5000, '16-02-20'),
    (002, 7000, '2021-03-15'),
    (003, 6000, '2020-12-12'),
    (004, 8000, '2019-11-11'),
    (005, 9000, '2021-04-21');

CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
    (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES 
    (001, 'Manager', '2016-02-20 00:00:00'),
    (002, 'Assistant Manager', '2017-03-25 00:00:00'),
    (003, 'Lead Developer', '2018-01-10 00:00:00'),
    (004, 'Senior Developer', '2019-05-15 00:00:00'),
    (005, 'Junior Developer', '2020-06-20 00:00:00'),
    (006, 'HR Specialist', '2021-07-30 00:00:00'),
    (007, 'Accountant', '2019-09-01 00:00:00'),
    (008, 'Sales Manager', '2020-10-10 00:00:00');
