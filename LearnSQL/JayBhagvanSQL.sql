CREATE DATABASE LearnDatabase;
SHOW DATABASES;
USE LearnDatabase;

CREATE TABLE student (
	id INT PRIMARY KEY,
    name VARCHAR(255)
);

INSERT INTO student (id , name) VALUES (1, "Jay Bhagvan"), (2, "Atulbhai"), (3,"Mintuben");

SELECT * FROM  student;

DESC student;

-- DROP TABLE IF EXISTS student;
-- DROP DATABASE IF EXISTS learndatabase;
