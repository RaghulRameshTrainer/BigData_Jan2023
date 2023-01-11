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
