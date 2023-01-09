CREATE DATABASE bigdata;

use bigdata;

-- DROP DATABASE bigdata;

-- DDL -> CREATE, ALTER, DROP , TRUNCATE
-- DML -> DELETE, INSERT, UPDATE
-- DCL -> GRANT, REVOKE
-- TCL -> COMMIT, ROLLBACK, SAVEPOINT
-- TQL -> SELECT

-- CREATE A TABLE

CREATE TABLE IF NOT EXISTS employee (
empid INT,
empname VARCHAR(50),
age INT,
gender CHAR(1),
city VARCHAR(20)
);

-- DATA TYPES
-- INT  -> Integer values
-- CHAR  -> Fixed length of characters
-- VARCHAR -> Variable length of characters
-- DATE
-- DECIMAL -> Decimal values

-- LOAD DATA INTO THE TABLE

INSERT INTO employee VALUES(1000,'Raja',35,'M','Chennai');

SELECT * FROM employee;

INSERT INTO employee VALUES(1001,'Ram',36,'M','Bangalore'),(1002,'Priya',30,'F','Hyderabad'),(1003,'Sakshi',31,'F','Pune');

INSERT INTO employee(empid, empname,gender,city) VALUES(1004,'Aveek','M','New Delhi');


-- UPDATE THE EXISTING DATA
SELECT * FROM EMPLOYEE;

SET sql_safe_updates=0;

UPDATE employee SET age=40 WHERE empid=1004;
UPDATE employee SET age=37, city='Chennai' WHERE empid=1002;

SELECT * FROM company;

UPDATE company set salary=1000 WHERE salary='';

-- DELETE

DELETE FROM company WHERE Place='Podicherry';

SELECT * FROM COMPANY;

-- SELECT 

SELECT * FROM COMPANY;
SELECT Company, Place FROM COMPANY;

SELECT * FROM COMPANY WHERE salary>9000;
SELECT * FROM COMPANY WHERE salary>9000 AND Place='Mumbai';

SELECT * FROM COMPANY WHERE age<25 AND (Place='Chennai' OR Place='Hyderabad' OR Place='Mumbai') AND salary>9000;

SELECT company, place, salary FROM company WHERE salary>9000;

-- IN & NOT IN 
-- LIKE
-- DISTINCT

SELECT DISTINCT(Place) FROM COMPANY;


SELECT * FROM COMPANY WHERE Place IN ('Podicherry','Nagpur','Cochin','Bhopal');

-- AGGREGATE FUNCTION
SELECT COUNT(*) FROM COMPANY WHERE Place IN ('Podicherry','Nagpur','Cochin','Bhopal');
SELECT COUNT(*) FROM COMPANY;

SELECT COUNT(*) FROM COMPANY WHERE PLACE='Chennai';
SELECT COUNT(*) FROM COMPANY WHERE PLACE='Hyderabad';

SELECT COUNT(*) FROM COMPANY WHERE PLACE  IN ('Chennai','Hyderabad');

SELECT COUNT(*) FROM COMPANY WHERE PLACE  NOT IN ('Chennai','Hyderabad');

-- LIKE

SELECT * FROM COMPANY WHERE Place LIKE 'C%';
SELECT * FROM COMPANY WHERE Place LIKE '%a';

SELECT * FROM COMPANY WHERE Place LIKE '%a%';

SELECT * FROM COMPANY WHERE Place LIKE '__e%';

SELECT MAX(Salary) FROM COMPANY ;
SELECT MIN(Salary) FROM COMPANY ;
SELECT SUM(Salary) FROM COMPANY ;
SELECT AVG(Salary) FROM COMPANY ;
SELECT COUNT(1) FROM COMPANY;

-- GROUP BY, HAVING , ORDER BY 

SELECT Place, COUNT(*) 
FROM COMPANY
GROUP BY Place
ORDER BY COUNT(*);

SELECT Place, COUNT(*) 
FROM COMPANY
GROUP BY Place
ORDER BY COUNT(*) DESC;

SELECT Place, COUNT(*) 
FROM COMPANY
WHERE Place != ''
GROUP BY Place
HAVING COUNT(*) >= 10
ORDER BY COUNT(*) DESC;

SELECT Place, COUNT(*) as total_employee
FROM COMPANY
WHERE Place != ''
GROUP BY 1
HAVING COUNT(*) >= 10
ORDER BY 2 DESC;


SELECT * FROM COMPANY;

-- 1. Please write a query to get the minimum and maximum salary offered by each company?
-- Company, Min_Salary, Max_Salary
SELECT Company, MAX(salary) , MIN(salary) FROM company GROUP BY Company;
-- 2. Query to get the total salary paid by each company in the descending order based on total_salary column.
-- Company, Total_Salary
SELECT Company, SUM(salary) as total_salary FROM company GROUP BY Company ORDER BY total_salary DESC;
-- 3. Write a query to get the total number of employees in each company, place wise.
-- Company, Place, Total_Employees
SELECT Company, Place, count(*) as Total_employees FROM company GROUP BY Company, Place ORDER BY Company,Place;


-- CONSTRAINTS
-- UNIQUE
-- NOT NULL
-- PRIMARY KEY
-- FOREIGN KEY
-- CHECK
-- DEFAULT

CREATE TABLE unique_table(
empid INT UNIQUE,
empname VARCHAR(20),
gender CHAR(1),
age INT,
city VARCHAR(20)
);

INSERT INTO unique_table VALUES (1000,'Raja','M',35,'Chennai');
INSERT INTO unique_table VALUES (1000,'Bala','M',40,'Bangalore');  -- ERROR DUE TO DUPLICATE empid
INSERT INTO unique_table VALUES (1001,'Bala','M',40,'Bangalore');

SELECT * FROM unique_table;
INSERT INTO unique_table(empname, gender, age, city) VALUES ('Durga','F',36,'Hyderabad');
INSERT INTO unique_table(empname, gender, age, city) VALUES ('Satya','F',36,'Pune');

-- NOT NULL CONSTRAINT

CREATE TABLE notnull_table(
empid INT NOT NULL,
empname VARCHAR(20),
gender CHAR(1),
age INT,
city VARCHAR(20)
);

INSERT INTO notnull_table VALUES (1000,'Raja','M',35,'Chennai');
INSERT INTO notnull_table VALUES (1000,'Bala','M',40,'Bangalore'); 
INSERT INTO notnull_table VALUES (1001,'Bala','M',40,'Bangalore');
SELECT * FROM notnull_table;
INSERT INTO notnull_table(empname, gender, age, city) VALUES ('Durga','F',36,'Hyderabad'); -- ERROR since NULL for empid

-- UNIQUE and NOT NULL 


CREATE TABLE unique_notnull_tbl (
empid INT UNIQUE NOT NULL,
empname VARCHAR(20),
gender CHAR(1),
age INT,
city VARCHAR(20)
);

INSERT INTO unique_notnull_tbl VALUES (1000,'Raja','M',35,'Chennai');
INSERT INTO unique_notnull_tbl VALUES (1000,'Bala','M',40,'Bangalore'); -- Error due to duplicate value 1000
INSERT INTO unique_notnull_tbl VALUES (1001,'Bala','M',40,'Bangalore');
SELECT * FROM unique_notnull_tbl;
INSERT INTO unique_notnull_tbl(empname, gender, age, city) VALUES ('Durga','F',36,'Hyderabad'); -- ERROR since NULL for empid

-- CHECK CONSTRAINT

CREATE TABLE check_table (
empid INT UNIQUE NOT NULL,
empname VARCHAR(20),
gender CHAR(1),
age INT CHECK (age >0 AND age <=100),
city VARCHAR(20)
);

INSERT INTO check_table VALUES (1000,'Raja','M',35,'Chennai');
SELECT * FROM check_table;
INSERT INTO check_table VALUES (1001,'Bala','M',140,'Bangalore'); -- Fails
INSERT INTO check_table VALUES (1001,'Bala','M',-1,'Bangalore');  -- Fails
INSERT INTO check_table VALUES (1001,'Bala','M',40,'Bangalore');


CREATE TABLE check_table_2 (
empid INT UNIQUE NOT NULL,
empname VARCHAR(20),
gender CHAR(1),
age INT CHECK (age >0 AND age <=100),
city VARCHAR(20) CHECK (city IN ('Chennai','Bangalore','Hyderabad'))
);

INSERT INTO check_table_2 VALUES (1000,'Raja','M',35,'Chennai');
SELECT * FROM check_table_2;
INSERT INTO check_table_2 VALUES (1001,'Chandra','M',35,'Pune'); -- Fails
INSERT INTO check_table_2 VALUES (1001,'Chandra','M',35,'Hyderabad'); 


CREATE TABLE default_table (
empid INT UNIQUE NOT NULL,
empname VARCHAR(20),
gender CHAR(1),
age INT CHECK (age >0 AND age <=100),
city VARCHAR(20) DEFAULT 'Hyderabad'
);

INSERT INTO default_table VALUES (1000,'Raja','M',35,'Chennai');
SELECT * FROM default_table;
INSERT INTO default_table VALUES (1001,'Chandra','M',35,'Pune'); 
INSERT INTO default_table(empid,empname,gender,age) VALUES (1002,'Venkatesh','M',35); 

-- PRIMAY KEY ( UNIQUE + NOT NULL)
CREATE TABLE pk_table (
empid INT PRIMARY KEY,    -- Simple Primary Key
empname VARCHAR(20),
gender CHAR(1),
age INT CHECK (age >0 AND age <=100),
city VARCHAR(20) DEFAULT 'Hyderabad'
);

INSERT INTO pk_table VALUES(1000,'Raja','M',35,'Chennai');
SELECT * FROM pk_table;
INSERT INTO pk_table VALUES(1000,'Raja','M',35,'Chennai');
INSERT INTO pk_table(empname, gender, age, city) VALUES('Raja','M',35,'Chennai');

-- SHOW INDEXES FROM pk_table;

CREATE TABLE comp_pk_table (
empid INT ,    
empname VARCHAR(20),
gender CHAR(1),
age INT CHECK (age >0 AND age <=100),
city VARCHAR(20) DEFAULT 'Hyderabad',
constraint pk_key primary key(empid, empname)  -- composite primary key
);

INSERT INTO comp_pk_table VALUES(1000,'Raja','M',35,'Chennai');
SELECT * FROM comp_pk_table;
INSERT INTO comp_pk_table VALUES(1000,'Bala','M',35,'Chennai');
INSERT INTO comp_pk_table VALUES(1000,'Bala','M',40,'Chennai'); -- Error since it is duplicate 1000-Bala
INSERT INTO comp_pk_table(empid,gender,age,city) VALUES(1000,'M',35,'Chennai');  -- Error since it is null for empname
INSERT INTO comp_pk_table VALUES(1001,'Bala','M',35,'Chennai');



INSERT INTO comp_pk_table(empname, gender, age, city) VALUES('Raja','M',35,'Chennai');