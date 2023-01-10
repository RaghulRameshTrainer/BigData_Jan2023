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