use bigdata;

-- FOREIGN KEY

CREATE TABLE customer(
custid INT PRIMARY KEY,
custname VARCHAR(100) NOT NULL,
city VARCHAR(20) NOT NULL
);

INSERT INTO customer VALUES(1000,'Rajesh','Chennai'),
							(1001,'Bala','Hyderabad'),
                            (1002,'Mohan','Bangalore');
SELECT * FROM CUSTOMER;

CREATE TABLE transaction_tbl(
tranid INT PRIMARY KEY,
custid INT,
product_name VARCHAR(100),
amount DECIMAL(20,2),
purchase_date DATE,
FOREIGN KEY (custid) REFERENCES customer(custid) ON DELETE CASCADE --  ON UPDATE CASCADE
);

INSERT INTO transaction_tbl VALUES(1,1000,'Mobile',30000,curdate());
SELECT * FROM transaction_tbl;
INSERT INTO transaction_tbl VALUES(2,1001,'Mobile',30000,curdate());

DELETE FROM customer WHERE custid=1001;


-- AUTO INCREMENT

CREATE TABLE students(
student_id INT UNIQUE auto_increment,
student_name VARCHAR(25) NOT NULL,
grade tinyint CHECK (grade > 1 AND grade<=12),
city varchar(20) default 'HYDERABAD'
);

INSERT INTO students(student_name, grade, city) VALUES('Shivani',12,'Chennai'),
													  ('Harsha',10,'Bangalore'),
													  ('Arun',7,'Hyderabad');
                                                      
SELECT * FROM STUDENTS;
INSERT INTO students(student_name,grade,city) VALUES('Bala',11,'Pune');
INSERT INTO students(student_id,student_name,grade,city) VALUES(100,'Ashwin',11,'Kolkatat');
INSERT INTO students(student_name,grade,city) VALUES('Tharani',5,'Delhi');


SELECT * FROM STUDENTS;

DELETE FROM STUDENTS WHERE student_id=100;

TRUNCATE TABLE STUDENTS;

DROP TABLE STUDENTS;

-- JOINS
-- 	SELF JOIN
--     INNER JOIN
--     OUTER JOIN
-- 		-- LEFT JOIN
--         -- RIGHT JOIN
--         -- FULL JOIN

CREATE TABLE customer_tbl(
custid INT PRIMARY KEY,
custname VARCHAR(100) NOT NULL,
CITY VARCHAR(20) NOT NULL
);

INSERT INTO customer_tbl VALUES(1000,'Ashwin','Chennai');
INSERT INTO customer_tbl VALUES(1001,'Tharani','Bangalore');
INSERT INTO customer_tbl VALUES(1002,'Bala','Hyderabad');
INSERT INTO customer_tbl VALUES(1003,'Mohan','Pune');
INSERT INTO customer_tbl VALUES(1004,'Siva','Mumbai');
INSERT INTO customer_tbl VALUES(1005,'Ramya','Cochin');

SELECT * FROM customer_tbl;


CREATE TABLE ORDERS(
order_id INT PRIMARY KEY,
custid INT,
prodname VARCHAR(100) NOT NULL,
amount INT 
-- FOREIGN KEY (custid) REFERENCES customer_tbl(custid) ON DELETE CASCADE ON UPDATE CASCADE
);



INSERT INTO orders VALUES(1,1000,'TV',65000);
INSERT INTO orders VALUES(2,1000,'MOBILE',35000);
INSERT INTO orders VALUES(3,1001,'LAPTOP',75000);
INSERT INTO orders VALUES(4,1002,'CHARGER',10000);
INSERT INTO orders VALUES(5,1002,'FRIDGE',50000);
INSERT INTO orders VALUES(6,1001,'WASHING MACHINE',50000);
INSERT INTO orders VALUES(7,1003,'DESKTOP',65000);
INSERT INTO orders VALUES(8,1004,'KEYBOARD',5000);
INSERT INTO orders VALUES(9,1004,'MOBILE',200000);
INSERT INTO orders VALUES(10,1111,'MICROOVEN',35000);


SELECT * FROM orders;

-- INNER JOIN

SELECT * FROM CUSTOMER_TBL c JOIN ORDERS o ON c.custid=o.custid;

-- LEFT JOIN
SELECT * FROM CUSTOMER_TBL c LEFT JOIN ORDERS o ON c.custid=o.custid;

-- RIGHT JOIN
SELECT * FROM CUSTOMER_TBL c RIGHT JOIN ORDERS o ON c.custid=o.custid;

-- FULL JOIN
SELECT * FROM CUSTOMER_TBL c JOIN ORDERS o;

-- SELF JOIN

CREATE TABLE EMPLOYEE (
empid INT,
empname VARCHAR(100),
salary INT,
mgr_id INT 
);

INSERT INTO EMPLOYEE VALUES(1,'Bala',10000,5),
							(2,'Mohan',7000,5),
                            (3,'Venkatesh',20000,2),
                            (4,'Shanmugam',5000,2),
                            (5,'Ranga',8000,5);
                            
SELECT * FROM EMPLOYEE;

SELECT e1.empname, e1.salary as emp_salary , e2.salary as mgr_salary, e2.empname as mgr_name 
FROM employee e1, employee e2
WHERE e1.mgr_id=e2.empid
AND e1.salary>e2.salary;

-- SUB QUERY

SELECT * FROM CUSTOMER_TBL;

SELECT * FROM ORDERS;

SELECT * FROM CUSTOMER_TBL 
WHERE CUSTID NOT IN (
SELECT DISTINCT CUSTID FROM ORDERS
);

-- PLEASE GET ME THE CUSTOMERS DETAILS WHO DID NOT MADE ANY TRANSACTION
-- [ USING THE LEFT JOIN ]
SELECT * FROM CUSTOMER_TBL c LEFT JOIN ORDERS o ON c.custid=o.custid
WHERE o.order_id IS NULL;

-- CO-RELATED SUB QUERY 
CREATE TABLE department (
dept_id INT,
empname VARCHAR(100),
salary INT,
dept_name VARCHAR(100)
);

INSERT INTO department VALUES(1,'Levin',100000,'HR'),
							  (2,'Dinesh',50000,'Finance'),
								(3,'Anita',70000,'IT'),
                                (3,'Mahima',100000,'IT'),
                                (4,'Kavita',200000,'IT'),
                                (1,'Siva',60000,'HR'),
                                (1,'Vnkatesh',80000,'HR'),
                                (2,'Arun',30000,'Finance'),
                                (2,'Ramesh',50000,'Finance');
                                
SELECT * FROM department;

SELECT * FROM department d1
WHERE salary > (
SELECT avg(salary) FROM department d2
WHERE d2.dept_id=d1.dept_id
GROUP BY dept_id);

-- ALTER QUERY

DESC employee;
SHOW create table  employee;
SELECT * FROM employee;

ALTER TABLE employee
ADD COLUMN city VARCHAR(20) DEFAULT 'Hyderabad';

ALTER TABLE employee
DROP COLUMN mgr_id;

ALTER TABLE employee
MODIFY COLUMN empname VARCHAR(25) NOT NULL;

ALTER TABLE employee
RENAME COLUMN city TO location;

RENAME TABLE employee TO developer;

ALTER TABLE developer 
RENAME TO employee;

SELECT * FROM employee;

SELECT * FROM employee WHERE salary<10000  -- Mohan. Shanmugam, Ranga
UNION ALL 
SELECT * FROM employee WHERE salary>7500;  -- Bala, Venkateshm Ranga


SELECT * FROM employee WHERE salary<10000  -- Mohan. Shanmugam, Ranga
UNION  
SELECT * FROM employee WHERE salary>7500; 