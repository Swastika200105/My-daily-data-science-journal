--SQL LEARNING FULL COURSE---

--Data Definition Language (CREATE, ALTER, DROP)--

/*Create a new table called persons with columns: id, person_name, birth_date, and phone */
CREATE TABLE persons (
     id INT NOT NULL,
	 person_name VARCHAR(25) NOT NULL,
	 birth_date DATE,
	 phone VARCHAR(15) NOT NULL,
	 CONSTRAINT pk_persons PRIMARY KEY(id))

select * from persons;

-- ALTER means edit the definition of table/ add new columns and changing the datatype --
/* Add a new column called email to the persons table*/
ALTER TABLE persons 
ADD email VARCHAR(50) NOT NULL;

ALTER TABLE persons
ADD phone VARCHAR(15) NOT NULL;


--DROP delete completely from database--
--Remove the column phone from the persons table
ALTER TABLE persons 
DROP COLUMN phone
-- Delete the table persons from the database 
DROP TABLE persons --it completely destroy data 
 
--Data Manipulation Language (DML) INSERT, UPDATE, DELETE--
/* Syntax
INSERT INTO table_name (column1, column2, column3, ...) 
VALUES (value1, value2, value3,...)
Rules
. Match the number of columns and values.
. Multiple inserts also allow 
*/

INSERT INTO customers(id, first_name, country, score)
VALUES (6, 'Sobika', 'Nepal', NULL),
       (7, 'Ida', 'India', 100);
INSERT INTO customers(id, first_name)
VALUES (8, 'swastika')

SELECT * FROM customers;

-- Manual Entry (values) --
/* Insert data from 'customers' into 'persons' */
INSERT INTO persons(id, person_name, birth_date, email, phone)
SELECT 
id,
first_name,
NULL,
'Unknown',
'not given'
FROM customers;
select * from persons;

--UPDATE_ MODIFY--
/* SYNTAX
UPDATE table_name 
SET column1 = value1,
    column2 = value2
	WHERE <condition>;
	*/
-- Change the score of customer 6 to 0 */
SELECT * FROM customers;

UPDATE customers
SET  score = 0
WHERE id = 6;

--Change the score of customer with ID 8 to 0 and update the country to "UK"
UPDATE customers
SET score = 0, country='UK'
WHERE id = 8;
--Change all customers with a NULL score by setting their score to 0
UPDATE customers
SET score = 0
WHERE score IS NULL;

SELECT * FROM customers WHERE score IS NULL;


--DELETE-> REMOVING ALREADY EXISTING ROWS--
/* syntax
DELETE FROM table_name
WHERE <condition>
NOTE:- Always use WHERE to avoid DELETING  all rows unintentionally
*/
-- Delete all customers with an ID greater than 5 
DELETE FROM customers
WHERE id > 5;
 select * from customers;

-- delete all data from table persons(TRUNCATE->clears the whole table at once without checking or logging)

TRUNCATE TABLE persons --data deleted but table exist 
