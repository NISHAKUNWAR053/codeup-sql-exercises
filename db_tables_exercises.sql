-- 3.List all the databases
SHOW DATABASES;

-- 4. Write the SQL code necessary to use the albums_db database
USE albums_db;

-- 5.Show the currently selected database
SELECT DATABASE();

-- 6.List all tables in the database
SHOW TABLES;
-- 7.Write the SQL code to switch the employees database
USE employees;
-- 8.Show the currently selected database
SELECT DATABASE();

-- 9.List all the tables in the database
SHOW TABLES;

-- 10.Explore the employees table. What different data types are present on this table?
-- INT, Date, Varchar, date


-- 11.Which table(s) do you think contain a numeric type column?
-- emp_no, salaries, dept_emp, titles

-- 12.Which table(s) do you think contain a string type column? 
-- departments, dept_emp, dept_manager, employees, titles

-- 13. Which table(s) do you think contain a date type column? 
-- dept_emp, dept_manager, employees, salaries, title

-- 14.What is the relationship between the employees and the departments tables? 
-- There is no direct relationship.

-- 15.Show the SQL that created the dept_manager table. Write the SQL it takes to show this as your exercise solution.
SHOW CREATE TABLE dept_manager;



