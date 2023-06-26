-- List all the databases
SHOW DATABASES;

-- Write the SQL code necessary to use the albums_db database
USE albums_db;

-- Show the currently selected database
SELECT DATABASE();

-- List all tables in the database
SHOW TABLES;
-- Write the SQL code to switch the employees database
USE employees;
-- Show the currently selected database
SELECT DATABASE();

-- List all the tables in the database
SHOW TABLES;

-- Explore the employees table. What different data types are present on this table?
DESCRIBE employees;


-- Which table(s) do you think contain a numeric type column?
-- emp_no

-- Which table(s) do you think contain a string type column? 
-- first_name and last_name

-- Which table(s) do you think contain a date type column? 
-- birth_date and hire_date 

-- What is the relationship between the employees and the departments tables? 
-- department_id

-- Show the SQL that created the dept_manager table. Write the SQL it takes to show this as your exercise solution.
SHOW CREATE TABLE dept_manager;



