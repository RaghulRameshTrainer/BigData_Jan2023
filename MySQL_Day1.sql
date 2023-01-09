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





