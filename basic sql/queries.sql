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




