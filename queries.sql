-- C:\Program Files\MySQL\MySQL Server 8.0\bin

-- access my sql

mysql -u root -p 

--Crud operation    (create read update and delete)

show databases;   
SHOW DATABASES;

-- create database
CREATE DATABASE prodapt_database;

--use database
USE prodapt_database  -- USE .database name

--Show tables/LIST TABLES
SHOW TABLES;

--create table
--VARCHAR(M) 1 AND 255

CREATE TABLE course_list (
    course_id INT NOT NULL AUTO_INCREMENT,
    course_title VARCHAR(50) NOT NULL,
    course_author VARCHAR(40) NOT NULL,
    course_date DATE,
    PRIMARY KEY (cousre_id)
)


CREATE TABLE employee_detail(
    employee_id INT NOT NULL AUTO_INCREMENT,
    employee_name VARCHAR(50) NOT NULL,
    employee_profession VARCHAR(40) NOT NULL,
    employee_post VARCHAR(40) NOT NULL,
    employee_dob DATE,
    PRIMARY KEY (employee_detail)

)

--drop table

DROP TABLE course_list
--DROP TABLE employee_detail

--insert data into table
INSERT INTO course_list(course_title, course_author, course_date) VALUES ("java", "teja", NOW ());

--insert multiple records into tables

INSERT INTO course_list(course_title, course_author, course_date) 
     VALUES
     ("jaav", "teja", now()),
     ("anglar", "teja", now()),
     ("mysql", "teja", now()),

INSERT INTO employee_detail(employee_id, employee_name, employee_profession) VALUES


--select data from table

select * from course_list;
select course_title from course_list;

--update records in the table

UPDATE course_list SET course_title="API Testing" WHERE course_id=4;


--Delete query
DELETE FROM course_list SET course_title="API Testing" WHERE course_id=4;

--rename table
RENAME TABLE old_table_name TO new_table_name

RENAME TABLE course_list to tech_stack;

--alter table
--drop table
--addcolumn


--add multiple column
ALTER TABLE course_list
    ADD course_rating VARCHAR(40) NOT NULL;
    ADD course_scope VARCHAR(40) NOT NULL;

--modify column type
ALTER TABLE course_list
      MODIFY course_scope VARCHAR(60) NOT NULL;

--modify column name
ALTER TABLE course_list
      CHANGE COLUMN  course_rating course_ratings INT NOT NULL;


--delete column
ALTER TABLE course_list
      DROP COLUMN column_name  


--relationships/

CREATE TABLE  Orders (
    OrderID INT NOT NULL,
    OrderNumber INT NOT NULL,
    PersonID int,
    PRIMARY KEY(OrderID)
    CONSTRAINT FK_PersonOrder FOREIGN KEY(PersonID) REFERENCES Persons(PersonID)
    )

CREATE TABLE  Employee (
    EmployeeID INT NOT NULL,
    EmployeeNumber INT NOT NULL,
    ReferID int,
    PRIMARY KEY(EmployeeID)
    FOREIGN KEY(ReferID) REFERENCES Refers(ReferID)
    )


--alter foreign key
ALTER TABLE Orders
ADD CONSTRAINT FK_PersonOrder FOREIGN KEY(PersonID) REFERENCES Persons(PersonID)

--drop foreign key 
ALTER TABLE Orders DROP CONSTRAINT FK_PersonOrder; 

--import existing database
-- source path/mysql_file_name

source D:\MySQL-master



-----------------------------------------

Query data
    --   select
    --   group
    --   subsdries
    --   Set
    --   modify



 --select filed_name FROM tablename;

 select lastname FROM employees;
  select *FROM employees;

select 1 + 1;
select CONCAt("bvs", '', "RAO");

SELECT now ();

--SELEct expression AS column_alias
SELECT CONCAt('bvs', '' "rao") AS fullname;
--sort queriess

SELECT 
     filed_name

FROM 
    new_table_name
ORDER BY
     column1 [asc|desc],
     column2[asc|desc],
     .......,

--user customer tabl to practise sort
---ORDER by Last name

SELECT
  contactLastName,
  ContactFirstName
FROM
   customers
ORDER BY
   contactLastName


------------
SELECT
    jobTitle
FROM
    employees
ORDER BY
    jobTitle DESC   --ASC for ascending order



--orderdetail table

SELECT
    OrderNumber,
    orderLineNumber,
    quantityOrdered * priceEach
FROM
    orderdetail
ORDER BY
 quantityOrdered * priceEach DESC ;
--------------------
 SELECT
    OrderNumber,
    orderLineNumber,
    quantityOrdered * priceEach AS subtotal
FROM
    orderdetail
ORDER BY
 quantityOrdered * priceEach DESC ;


--STATUS
--    IN Progress
--    ON hold
--    cancelled
--    Resolved
--    Disputed
--    shipped


SELECT 
     orderNumber, status
FROM
     Orders
ORDER BY FIELD (
    status,
      "IN Process",
      "ON hold",
      "cancelled",
      "Resolved",
      "Disputed",
      "shipped"
);
-----

SELECT 
   firstName,
   lastName,
   reportsto,
FROM
   employees
ORDER BY reportT0;
    

---filtering data
-- WHERE
-- SELECT DISTINCT
-- AND
-- OR
-- IN
-- NOT IN
-- BETWEEN
-- LIMIT
-- IS NULL

-- FROM -> WHERE -> SELECT -> ORDER BY

 SELECT 
     firstName,
     lastName,
     jobtitles,
FROM
     employees
WHERE  
     jobTitle="Sales Rep" AND
     officeCode=1;
  ------
SELECT 
     firstName,
     lastName,
     jobtitles,
FROM
     employees
WHERE  
     jobTitle="Sales Rep" OR
     officeCode=1;
ORDER BY
      officeCode,
      jobTitle;

-------

SELECT 
     firstName,
     lastName,
     officeCode
FROM
     employees
WHERE  
     officeCode BETWEEN 1 AND 1
ORDER BY officeCode;
----

--like clause

SELECT 
     firstName,
     lastName
FROM
     employees
WHERE  
     lastName LIKE '%son'
ORDER BY firstName;

---

"tho%"
'%son'
'%att%'
'_r%'
'a_%'
't%n'

---in operator
SELECT 
     firstName,
     lastName,
     officeCode
FROM
     employees
WHERE  
     officeCode IN(1, 2, 3)
ORDER BY 
      officeCode;


-------

SELECT
     customerNumber,
     customerName,
     creditLimit
FROM 
     customers
ORDER BY creditLimit DESC
LIMIT 5;          ---- LIMIT MEAN ONLY TOP 5 WILL COM

-------

SELECT                                           
     customerNumber,
     customerName,
     creditLimit
FROM 
     customers
ORDER BY creditLimit ASC
LIMIT 6; 

-----

SELECT
     customerNumber,
     customerName,
     creditLimit
FROM 
     customers
ORDER BY 
          creditLimit,
          customerNumber
LIMIT 6; 

--------------

SELECT COUNT customerNumber FROM customers;
----------------

SELECT                                           
     customerNumber,
     customerName
FROM 
     customers
ORDER BY customerName 
limit 10;
-----
SELECT DISTINCT
      state 
FROM
      customers;
 -------------------

SELECT DISTINCT
      productLine 
FROM
      products
WHERE productLine is NOT NULL;
----------------------

SELECT 
     CONCAT_WS(' ', lastName,firstName) AS 'Full Name'
     FROM
     employees;
------------------------
SELECT 
     CONCAT_WS(',', lastName,firstName) AS 'Full Name'
     FROM
     employees;

--------------------------
SELECT SUM(priceEach)
FROM orderdetails;

     SELECT(priceEach*quantityOrdered) AS total from orderdetails(priceEach*quantityOrdered) WHERE total>10000

--------------


SELECT 
    orderNumber 'OrderNo'
    SUM(priceEach * quantityOrdered) total
FROM 
    orderdetails    
GROUP BY
   orderNumber
HAVING
    total > 60000;    
----------------------------------------
SELECT
      orderNumber
FROM 
      orderdetails
CROSS JOIN
SELECT
      shippedDate
FROM
     orders
------------------
select *  from products INNER JOIN orderdetails ON products.productCode = orderdetails.productCode ;
select *  from productlines INNER JOIN products ON productlines.productLine = products.productLine ;


------------------mysql inner join clause--------------------------------
SELECT
     m.member_id,
     m.name AS member,
     c.committee_id,
     c.name AS committee
FROM
      members m
LEFT JOIN committee c USING (name);


----
SELECT
   CONCAT(m.lastName, ' , ', m.firstName) AS Manager,
   CONCAT(e.lastName, ' , ', e.firstName) AS Direct report ---(their is space in direct report that why it is showing error)
FROM
   employees e
LEFT JOIN employees m ON
       m.employeeNumber = e.reportsTo
ORDER BY
       Manager;

-------------------------
SELECT
   CONCAT(m.lastName, ' , ', m.firstName) AS Manager,
   CONCAT(e.lastName, ' , ', e.firstName) AS 'Direct report'
FROM
   employees e
LEFT JOIN employees m ON
       m.employeeNumber = e.reportsTo
ORDER BY
       Manager;

-----------------
------------------------------------------
-----------------------------------------------
---------------------------------------------------
today 22nd july 2022 
---------------------------------------------
------------------------------







create databases if not exists empdb;

use empdb;

--create table
CREATE TABLE merit (
      performance int (11) NOT NULL,
      percentage FLOAT NOT NULL,
      PRIMARY KEY(performance)
);
CREATE TABLE employees(
      emp_id int(11)NOT NULL AUTO_INCREMENT,
      emp_name VARCHAR(225) NOT NULL,
      performance INT(11)DEFAULT NULL,
      salary FLOAT DEFAULT NULL,
      PRIMARY KEY (emp_id),
      CONSTRAINT fk_performance FOREIGN KEY(performance)
        REFERENCES
)


INSERT INTO merits(performance,percentage) 
VALUES(1,0),(2,0.01)(3,0.03),(4,0.05),(5,0.08);

INSERT INTO employees(emp_name,performance,salary)
VALUES ('Tinku BHati',1,120220),
       ('Roop BHati',3,90220),
       ('Rohan Bisht'2,56764),
       ('Suraj',4,63544),
       ('Yogesh',4,456752);




UPDATE employees
      INNER JOIN 
      merit ON employees.performance = merit.performance
SET 
      salary = salary + salary * percentage;



-----------------------------------------------
--suppose company hires two new wmployee



INSERT INTO employees(emp_name,performance,salary)
VALUES ('Tinku bakra',NULL,120220),
       ('suraj chand',NULL,90220);


--you can increase new joining slalary by 1.5%

UPDATE employees
     LEFT JOIN 
     merit ON employees.performance = merit.performance
SET salary = salary + salalry*0.5
WHERE merit.percentage is NULL;


 ------COde language: SQL(STRUCTURED QUERY LANGUAGE) (SQL)


 -----delete joins
 DROP TABLE IF EXISTS t1,t2;
 CREATE TABLE t1(
      id INT PRIMARY KEY AUTO_INCREMENT
 );

 CREATE TABLE t2(
      id VARCHAR(20) PRIMARY KEY,
      ref INT NOT NULL
 );
INSERT INTO t1 VALUES (1),(2),(3);
INSERT INTO t2(id,ref) VALUES ('A',1),('B',2),('C',3);

DELETE  t1,t2 FROM t1
INNER JOIN 
t2 ON t2.ref = t1.id
  WHERE t1.id=1;


  ---------------------
  SELECT 
   customerNumber,
   checkNumber,
   amount
FROM 
     payments
WHERE
     amount = (SELECT MAX(amount) FROM payments);


---


SELECT * 
FROM payments
WHERE amount >
    (SELECT AVG(amount) FROM payments);



-------------------
select 
   customerNumber
from  
   customers
WHERE 
  customerNumber not in (select Distinct
  customerNumber 
  from orders  );


-------------
select 
   productName,
   buyPrice
from  
   products p1
WHERE 
  buyPrice >(SELECT 
  AVG(buyPrice)
  From products
  where productLine = p1.productLine )
  order by buyPrice asc; 


-------------------
----   customers who placed one sales order with total value greater than 60 k using existin goperator

SELECT
      customerName, 
      customerNumber
FROM 
       customers
WHERE
      EXISTS ( SELECT orderNumber,SUM(priceEach * quantityOrdered)
      from 
          orderDetails
      INNER JOIN
      Orders USING (orderNumber)
      WHERE
      customerNumber = customers.customerNumber
      GROUP BY orderNumber
      HAVING SUM(priceEach * quantityOrdered) > 10000);


--------------------------------------

---------------index
select 
     email
from
     employees


create table t(
     c1 int primary key,
     c2 int  not NULL,
     c3 int not null,
     c4 VARCHAR(10),
     index (c2,c3)
)
--create index index_name ON table_name(column_list)
create index idx_c4 ON t(c4)
create index jobtTitle On employees(jobTitle);
------------------
EXPLAIN SELECT 
employeeNumber,
lastName,
firstName

from
employees
where 
jobtitle='Sales rep';
----------------------

SHOW INDEXES from employees;
---------------------
CREATE TABLE leads(
     lead_id INT AUTO_INCREMENT,
     first_name varchar(100) not null,
     last_name varchar(100) not null,
     email varchar(255) not null,
     information_source VARCHAR(255),
     INDEX name (first_name,last_name),
     unique email(email),
     primary key(lead_id)
);



drop index name on leads;

-----------------
show index from ...... 

create unique index index_name
ON table_name(index_column_1,index_column_2,.....);


---
ALTER Table table_name
ADD CONSTRAINT constraint_name UNIQUE KEY(column_1, column_2,.....);

------
create UNIQUE INDEX iinnnndde
ON employees(firstName);
---------

CREATE TABALE IF NOT EXISTS contacts (
     id INT AUTO_INCREMENT PRIMARY KEY,
     first_name VARCHAR(50) NOT NULL,
     last_name VARCHAR(50) NOT NULL,
     phoneno VARCHAR(50) NOT NULL, 
     email VARCHAR(50) NOT NULL,
     UNIQUE KEY unique_email (email)

);

INSERT INTO contacts(first_name,lastName,phone,email)
VALUES('JOHN','DOE','1234567898765','FKVFEBVHV@ORG.COM');

INSERT INTO contacts(first_name,lastName,phone,email)
VALUES('JOHDFGFDSAN','DOE','12345898765','FKSDSADFSADFVFEBVHV@ORG.COM');



-----
-- COMPOSITE INDEX

CREATE TABLE table_name (
     c1 data_type
)


-----
 
CREATE INDEX tejavail
ON employees(lastName, firstName);
----find employees whose last name is pearson
SELECT
   firstName,
   lastName,
   email
FROM 
   employees
where 
  lastName='patterson';



--------
EXPLAIN SELECT
   firstName,
   lastName,
   email
FROM 
   employees
where 
  lastName='patterson';

-- - ------

SELECT
   firstName,
   lastName,
   email
FROM 
   employees
where 
  lastName='patterson' AND 
  firstName='steve';

----------------------------

EXPLAIN SELECT
   firstName,
   lastName,
   email
FROM 
   employees
where 
  lastName='patterson' AND 
  firstName='steve';
- - ---------
------------------

SELECT
   firstName,
   lastName,
   email
FROM 
   employees
where 
  lastName='patterson' AND 
 ( firstName='steve' OR
   firstName='Mary')
-
----


EXPLAIN SELECT
   firstName,
   lastName,
   email
FROM 
   employees
where 
  lastName='patterson' AND 
 ( firstName='steve' OR
   firstName='Mary');
--------------------------------------



----------------

---

------
----create Procedures:

DELIMITER $$

CREATE PROCEDURE GetCustomerNames()
BEGIN
     SELECT
         customerName,
         city,
         state,
         postalCode,
         country
     FROM 
         customers
     ORDER BY customerName;
END$$

DELIMITER ;

CALL GetCustomerNames();
----------------------


---\


DELIMITER $$

CREATE PROCEDURE GetEmployeesN()
BEGIN
     SELECT
         firstName,
         lastName,
         city,
         state,
         country
     FROM 
         employees
     INNER JOIN offices using (officeCode);
END$$

DELIMITER ;

CALL GetEmployeesN();


----------------------------------
DELIMITER //

CREATE PROCEDURE GetOfficeByCountry(
     IN countryName VARCHAR(255)
)
BEGIN 
     SELECT *
     FROM offices
WHERE country = countryName;

END //

DELIMITER ;


CALL GetOfficeByCountry('USA');


------------------------------------------------

--IN AND Out


DELIMITER $$

CREATE PROCEDURE GetOrderCountByStatus(
     IN orderStatus VARCHAR(25),
     OUT total INT
)
BEGIN 
     SELECT COUNT(orderNumber)
     INTO total
     FROM orders
     WHERE status = orderStatus;.
END$$

DELIMITER ;

CALL GetOrderCountByStatus('Shipped', @total);
SELECT@total;











