USE somerville_2279;

# 1.Using the example from the lesson, create a temporary table called employees_with_departments that contains first_name, last_name, and dept_name for employees currently with that department. Be absolutely sure to create this table on your own database. If you see "Access denied for user ...", it means that the query was attempting to write a new table to a database that you can only read.
CREATE TEMPORARY TABLE somerville_2279.employees_with_departments AS (
SELECT first_name, last_name, dept_name
FROM employees.employees
JOIN employees.dept_emp USINg (emp_no)
JOIN employees.departments USING (dept_no)
);

SELECT * 
FROM somerville_2279.employees_with_departments;

# a.Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns.
ALTER TABLE somerville_2279.employees_with_departments ADD full_name VARCHAR(25);

# b.Update the table so that the full_name column contains the correct data.
UPDATE somerville_2279.employees_with_departments SET full_name = CONCAT(first_name, ' ', last_name);

# c.Remove the first_name and last_name columns from the table.
ALTER TABLE somerville_2279.employees_with_departments DROP COLUMN first_name, DROP COLUMN last_name;

# d.What is another way you could have ended up with this same table?
CREATE TEMPORARY TABLE somerville_2279.employees_with_departments AS (
SELECT CONCAT(first_name,' ', last_name) AS full_name, dept_name
FROM employees.employees
JOIN employees.dept_emp USING (emp_no)
JOIN employees.departments USING (dept_no)
);

-- 2. Create a temporary table based on the payment table from the sakila database.
USE sakila;
CREATE TEMPORARY TABLE somerville_2279.payment AS 
(SELECT 
    CAST(amount AS CHAR (20)) AS amount,
    payment_id,
    customer_id,
    staff_id,
    rental_id,
    payment_date,
    last_update
FROM
    sakila.payment);
SELECT * FROM somerville_2279.payment;
