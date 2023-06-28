USE employees;
-- 2.In your script, use DISTINCT to find the unique titles in the titles table. How many unique titles have there ever been? Answer that in a comment in your SQL file.
SELECT DISTINCT title
FROM titles;
-- 7

-- 3.Write a query to to find a list of all unique last names of all employees that start and end with 'E' using GROUP BY.
SELECT last_name
FROM employees
GROUP BY last_name
HAVING last_name LIKE 'e%e';

-- 4.Write a query to to find all unique combinations of first and last names of all employees whose last names start and end with 'E'.
SELECT first_name, last_name
FROM employees
GROUP BY first_name, last_name
HAVING last_name LIKE 'e%e';

-- 5.Write a query to find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code.
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
HAVING last_name LIKE '%q%' AND last_name NOT LIKE  '%qu%';
-- CHleq, Lindqvist, Qiwen

-- 6.Add a COUNT() to your results (the query above) to find the number of employees with the same last name.
SELECT last_name, COUNT(last_name) 
FROM employees
GROUP BY last_name
HAVING last_name LIKE '%q%' AND last_name NOT LIKE  '%qu%';

-- 7.Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names.
SELECT first_name, gender, COUNT(*) AS emp_count
FROM employees
GROUP BY first_name, gender
HAVING first_name IN ('Irena', 'Vidya', 'Maya');


-- 8.Using your query that generates a username for all of the employees, generate a count employees for each unique username.
SELECT username, COUNT(*) AS emp_count
FROM (
  SELECT CONCAT(LOWER(SUBSTRING(first_name, 1, 1)), LOWER(SUBSTRING(last_name, 1, 4)), '_', SUBSTR(birth_date,6,2), SUBSTR(birth_date,3,2)) AS username
  FROM employees
) AS employee_usernames
GROUP BY username;

-- 9.From your previous query, are there any duplicate usernames? What is the highest number of times a username shows up? Bonus: How many duplicate usernames are there from your previous query?
SELECT username, COUNT(*) AS emp_count
FROM (
  SELECT CONCAT(LOWER(SUBSTRING(first_name, 1, 1)), LOWER(SUBSTRING(last_name, 1, 4)), '_', SUBSTR(birth_date,6,2), SUBSTR(birth_date,3,2)) AS username
  FROM employees
) AS employee_usernames
GROUP BY username
HAVING emp_count > 1
ORDER BY COUNT(*) DESC;
-- most showed username is 3
-- there are 1000 duplicates

-- BONUS MORE PRACTICE WITH AGGREGATE FUNCTION




