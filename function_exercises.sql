SHOW DATABASES;
USE employees;

# 2. Write a query to to find all employees whose last name starts and ends with 'E'. Use concat() to combine their first and last name together as a single column named full_name.
SELECT *
FROM employees
WHERE last_name LIKE 'e%e';

SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees
WHERE last_name LIKE 'e%e';

#3. Convert the names produced in your last query to all uppercase.
SELECT UPPER (CONCAT(first_name, ' ', last_name)) AS full_name
FROM employees
WHERE last_name LIKE 'e%e';

# 4.Use a function to determine how many results were returned from your previous query.
SELECT COUNT(*)
FROM employees
WHERE last_name LIKE 'e%e';
 
# 5.Find all employees hired in the 90s and born on Christmas. Use datediff() function to find how many days they have been working at the company (Hint: You will also need to use NOW() or CURDATE()),
SELECT first_name,last_name,
    DATEDIFF(CURDATE(), hire_date) AS days_worked
FROM
    employees
    WHERE hire_date LIKE '199%' AND birth_date LIKE '%12-25';
    
# 6. Find the smallest and largest current salary from the salaries table.
SELECT
    MIN(salary) AS smallest_salary,
    MAX(salary) AS largest_salary
FROM
    salaries;
    
# 7. Use your knowledge of built in SQL functions to generate a username for all of the employees. A username should be all lowercase, and consist of the first character of the employees first name, the first 4 characters of the employees last name, an underscore, the month the employee was born, and the last two digits of the year that they were born. Below is an example of what the first 10 rows will look like:

SELECT
    CONCAT(
        LOWER(SUBSTRING(first_name, 1, 1)),
        LOWER(SUBSTRING(last_name, 1, 4)),
        '_',
      SUBSTRING(birth_date,6, 2),
       SUBSTRING(birth_date,3, 2)
    ) AS username
FROM
    employees
LIMIT 10;








