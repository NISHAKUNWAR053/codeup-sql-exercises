SHOW DATABASES;
USE employees;


-- 1.Find all the current employees with the same hire date as employee 101010 using a subquery.
SELECT *
FROM employees
JOIN titles ON employees.emp_no = titles.emp_no
WHERE hire_date = (
    SELECT hire_date
    FROM employees
    WHERE emp_no = 101010 AND to_date > NOW()
);

# 2.Find all the titles ever held by all current employees with the first name Aamod.
SELECT DISTINCT title 
FROM titles
WHERE emp_no IN (
	SELECT emp_no 
    FROM employees
    WHERE first_name = 'Aamod' AND to_date > NOW()
    );
    
# 3.How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.
SELECT COUNT(*) AS total
FROM employees
WHERE emp_no NOT IN (
	SELECT emp_no
	FROM dept_emp
	WHERE to_date > NOW()
);
-- 59900

#4.Find all the current department managers that are female. List their names in a comment in your code.
SELECT first_name, last_name
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_manager
    WHERE to_date > NOW()
)
  AND gender = 'F';
-- Isamu, karsten, Hilary,leon 

#5.Find all the employees who currently have a higher salary than the companies overall, historical average salary.
SELECT COUNT(*) AS total
FROM salaries
WHERE salary > (
        SELECT AVG(salary) 
        FROM salaries
    ) AND to_date > NOW();

# 6.How many current salaries are within 1 standard deviation of the current highest salary? (Hint: you can use a built in function to calculate the standard deviation.) What percentage of all salaries is this?
SELECT MAX(salary)
FROM salaries
WHERE to_date > CURDATE();

SELECT STDDEV(salary)
FROM salaries
WHERE to_date > CURDATE();

SELECT COUNT(*)
FROM salaries
WHERE salary > ((
	SELECT MAX(salary)
    FROM salaries
    WHERE to_date > CURDATE()
) - (
	SELECT STDDEV(salary)
    FROM salaries
    WHERE to_date > CURDATE()
)) AND to_date > CURDATE();
SELECT COUNT(*)
FROM salaries
WHERE to_date > CURDATE();


SELECT (
		SELECT COUNT(*)
		FROM salaries
		WHERE salary > ((
			SELECT MAX(salary)
			FROM salaries
			WHERE to_date > CURDATE()
			) - (
			SELECT STDDEV(salary)
			FROM salaries
			WHERE to_date > CURDATE()
			)) AND to_date > CURDATE()
		) / (COUNT(*)) * 100 AS percent_emp
FROM salaries
WHERE to_date > CURDATE();

