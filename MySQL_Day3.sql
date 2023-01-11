use bigdata;
-- TRANSACTION CONTROL LANGUAGE
-- COMMIT , ROLLBACK, SAVEPOINT

SELECT * FROM EMPLOYEE;

START TRANSACTION;

DELETE FROM EMPLOYEE WHERE empid=3;

COMMIT;

START TRANSACTION;
DELETE FROM EMPLOYEE;
ROLLBACK;

START TRANSACTION;
TRUNCATE TABLE EMPLOYEE;
ROLLBACK;

SELECT * FROM company;
SELECT Place , count(1) FROM company GROUP BY 1 ORDER BY 2 DESC;

START transaction;

savepoint empty_city;
DELETE FROM company WHERE Place='';

savepoint Mumbai;
DELETE FROM company WHERE Place='Mumbai';

savepoint Calcutta;
DELETE FROM company WHERE Place='Calcutta';

ROLLBACK TO savepoint Mumbai;

COMMIT;

-- DCL (Data Control Language)

-- SELECT
-- INSERT
-- UPDATE
-- DELETE
-- VIEW
-- ALL
-- GRANT

GRANT SELECT ON customer TO root@localhost;
GRANT INSERT,UPDATE,DELETE on customer TO root@localhost;
REVOKE DELETE on customer FROM root@localhost;

GRANT ALL ON customer TO root@localhost;

-- VIEW (Virtual Table)
SELECT * FROM COMPANY;

CREATE OR REPLACE VIEW comp_info AS
SELECT Company, City FROM COMPANY ;

SELECT * FROM comp_info WHERE Company='Infosys';

CREATE OR REPLACE VIEW tcs_info AS
SELECT Company, City FROM COMPANY WHERE Company='TCS';

SELECT * FROM tcs_info;

ALTER TABLE COMPANY RENAME COLUMN Place to City;

DROP VIEW comp_info;

-- INDEX 
SELECT * FROM company WHERE city IN ('Delhi','Chennai');

SELECT * FROM company ;

SHOW INDEXES  FROM company;

CREATE INDEX comp_city_idx ON company(Age);
CREATE INDEX comp_comp_idx ON CUSTOMER(company);

-- Windowing Funtions(row_number, rank, dense_rank, lead, lag)

SELECT * FROM company;

SELECT company, age, salary, city, country, gender , rnk FROM (
SELECT company, age, salary, city, country, gender, row_number() over(order by salary DESC) rnk
FROM company) t1
WHERE rnk<=10;

SELECT company, age, salary, city, country, gender , rnk FROM (
SELECT company, age, salary, city, country, gender, row_number() over(partition by company order by salary DESC) rnk
FROM company) t1
WHERE rnk<=3;

SELECT * FROM ORDERS;
CREATE INDEX order_prod_idx ON ORDERS(prodname);

SHOW INDEXES FROM ORDERS;

-- ---------------------------------------------------------------

SELECT * FROM company ORDER BY SALARY DESC LIMIT 3;

SELECT *, rk FROM (
SELECT * , row_number() OVER(partition by company ORDER BY salary DESC) as rk FROM company) tbl
WHERE rk<=2;

SELECT *, rk FROM (
SELECT * , row_number() OVER(partition by company,City ORDER BY salary DESC) as rk FROM company) tbl
WHERE rk<=2;


-- -------------rank----------------

SELECT company, age, salary, city, country, gender , rnk FROM (
SELECT company, age, salary, city, country, gender, rank() over(order by salary DESC) rnk
FROM company) t1
WHERE rnk<=2;


SELECT company, age, salary, city, country, gender , rnk FROM (
SELECT company, age, salary, city, country, gender, rank() over(partition by company,city order by salary DESC) rnk
FROM company) t1
WHERE rnk<=2;

-- -------------dense_rank----------------

SELECT company, age, salary, city, country, gender , rnk FROM (
SELECT company, age, salary, city, country, gender, dense_rank() over(order by salary DESC) rnk
FROM company) t1
WHERE rnk<=2;


SELECT company, age, salary, city, country, gender , rnk FROM (
SELECT company, age, salary, city, country, gender, dense_rank() over(partition by company order by salary DESC) rnk
FROM company) t1
WHERE rnk<=2;

-- ---------------------------- lead ----------------------------

CREATE TABLE cust_trans(
custid INT,
product VARCHAR(100),
amount INT,
trans_date date
);

INSERT INTO cust_trans VALUES(1000, 'TV', 50000, '2023-01-01');
INSERT INTO cust_trans VALUES(1000, 'Mobile', 30000, '2023-01-10');
INSERT INTO cust_trans VALUES(1000, 'Pendrive', 10000, '2023-01-11');

INSERT INTO cust_trans VALUES(1001, 'Laptop', 70000, '2023-01-01');
INSERT INTO cust_trans VALUES(1001, 'Desktop', 60000, '2023-01-10');
INSERT INTO cust_trans VALUES(1001, 'Charger', 15000, '2023-01-11');


SELECT * FROM cust_trans;

SELECT custid, product,amount, LEAD(amount) OVER (partition by custid) as next_amt, trans_date FROM cust_trans;
SELECT custid, product,amount, LEAD(amount,2) OVER (partition by custid) as next_amt, trans_date FROM cust_trans;

SELECT custid, product,amount,prev_amt,(amount-coalesce(prev_amt,0)) as diff,trans_date  FROM (
SELECT custid, product,amount, LAG(amount,1,1000) OVER (partition by custid) as prev_amt, trans_date FROM cust_trans) tbl;



-- COUNT, MIN, MAX, SUM, AVG

-- STRING FUNCTION

SELECT * FROM cust_trans;

SELECT product, amount FROM cust_trans;
SELECT concat(product,'-',amount) as prod_details FROM cust_trans;
SELECT concat(product,'-',amount,'-',trans_date) as prod_details FROM cust_trans;
SELECT concat_ws('-',custid,product,amount,trans_date) as prod_details FROM cust_trans;

SELECT upper(product), amount FROM cust_trans;
SELECT lower(product), amount FROM cust_trans;

SELECT replace(product,'e','E') FROM cust_trans;

SELECT LTRIM(product) FROM cust_trans;  -- check 

SELECT reverse(product) FROM cust_trans;

-- SPECIAL FUNCTION

Select * FROM company;

SELECT coalesce(company,'UNKNOWN'), salary FROM company;

SELECT * FROM customer;
INSERT INTO customer(custid, city) VALUES(1003,'Hyderabad');

SELECT coalesce(custname,'MISSING'), city FROM customer;

ALTER TABLE customer
MODIFY COLUMN custname varchar(20);

SELECT company, IF(salary=0,0,salary) FROM company;

-- CASE
-- DATE FUCNTION

SELECT * FROM cust_trans;

