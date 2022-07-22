-- CREATE DATABASE `user_bugquery`;
-- USE  `user_bugquery`;



-- --bug query started

-- DROP TABLE IF EXISTS `bug`;
-- CREATE TABLE `bug`(
--       `id` VARCHAR(11) NOT NULL,
--       `project_id`INT(50) NOT NULL,
--       `name` varchar(50) NOT NULL
-- );

-- INSERT INTO `bug`(`id`,`project_id`,`name`) values

-- ('qwerty', 9877600345, 'teja'),
-- ('qwerty', 987005334, 'teja'),
-- ('qwerty', 9877653005, 'teja'),
-- ('qwerty', 9007653345, 'teja');

-- --bug has media query staarted

-- DROP TABLE IF EXISTS `bug_has media`;

-- CREATE TABLE `bug_has_media`(
--       `bug_id` int(11) NOT NULL,
--       `bug_project_id`int(50) NOT NULL,
--       `media_id` int(50) NOT NULL
-- );

-- INSERT INTO `bug_has_media `(`bug_id`,`bug_project_id`,`media_id`) values

-- (123456, 8000007654, 42313445),
-- (123456, 1234567089, 8097340983),
-- (123456, 9870000766 , 456789),
-- (12345, 786875, 8765432) ;

------meida query started
/*

DROP TABLE IF EXISTS `media`;

CREATE TABLE `media`(
      `id` int(11) NOT NULL,
      `user_id` int(50) NOT NULL,
      `path ` varchar(70) NOT NULL,
      `filetype`VARCHAR(20) NOT NULL,
      `filesize`DECIMAL(65,2) NOT NULL
);

INSERT INTO `media `(`id`,`user_id`,`path`, `filetypes`,`filesize`) VALUES

(`123456`, `80000076543`, `rghsnxjcksndmcjx`, `rgdhsbcjcdhx`, `123456789098765.23`),
(`123456`, `80000076543`, `rghsnxjcksndmcjx`, `rgdhsbcjcdhx`, `123456789098765.23`),
(`123456`, `80000076543`, `rghsnxjcksndmcjx`, `rgdhsbcjcdhx`, `123456789098765.23`),
(`123456`, `80000076543`, `rghsnxjcksndmcjx`, `rgdhsbcjcdhx`, `123456789098765.23`),
(`123456`, `80000076543`, `rghsnxjcksndmcjx`, `rgdhsbcjcdhx`, `123456789098765.23`),
(`123456`, `80000076543`, `rghsnxjcksndmcjx`, `rgdhsbcjcdhx`, `123456789098765.23`),
(`123456`, `80000076543`, `rghsnxjcksndmcjx`, `rgdhsbcjcdhx`, `123456789098765.23`)


------comment has media query----------

DROP TABLE IF EXISTS `comment_has_media`;

CREATE TABLE `comment_has_media`(
      `comment_id`int(11) NOT NULL,
      `comment_bug_project_id` INT(50) NOT NULL,
      `comment_bug_id `INT(50) NOT NULL,
      `media_id`INT(20) NOT NULL
      
)

INSERT INTO `comment_has_media `(`comment_id`,`comment_bug_project_id`,`comment_bug_id`, `media_id`) VALUES

(`123456`, `8000007654543`, `42313445`,`756437621`),
(`123456`, `12345434367089`, `809737840983`,`78612543`),
(`123456`, `80000076453543`, `4231349845`,`756439821`),
(`123456`, `1234567743444437089`, `8097340983`,`78666543`),
(`123456`, `800000765765443`, `4231345667445`,`756432177`),
(`123456`, `12345670845559`, `80973498870983`,`78654398`),
(`123456`, `8000007654987653`, `4231309898445`,`756432134`),
(`123456`, `123456708934256`, `8097340123456983`,`78654563`)


------comment query
DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment`(
      `id `INT(11) NOT NULL,
      `bug_project_id `INT(50) NOT NULL,
      `bug_id `INT(50) NOT NULL,
      `text `TEXT(200) NOT NULL
)

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user`(
      `id `INT(11) NOT NULL,
      `media_id `INT(50) NOT NULL,
      `name `VARCHAR(50) NOT NULL
)

DROP TABLE IF EXISTS `project_has_user`;

CREATE TABLE `project_has_user`(
      `project_id` INT(11) NOT NULL,
      `user_id `INT(50) NOT NULL,
      `manager` TINYINT(50) NOT NULL   
)


DROP TABLE IF EXISTS `project`;

CREATE TABLE `project`(
      `id` int(11) NOT NULL,
      `name` varchar(50) NOT NULL
)*/



----------------------------------------------------------------------
------update join

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
  order by ; 
     
