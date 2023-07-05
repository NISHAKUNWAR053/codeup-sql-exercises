USE employees;

-- 1.Write a query that returns all employees, their department number, their start date, their end date, and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not. DO NOT WORRY ABOUT DUPLICATE EMPLOYEES.
 SELECT CONCAT(first_name,'',last_name),from_date, to_date, dept_no,
  IF (to_date > CURDATE(), TRUE, FALSE) AS is_current_employee
  FROM employees
  JOIN dept_emp ON employees.emp_no = dept_emp.emp_no;
  
  
-- 2.Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.
SELECT  last_name,
CASE 
    WHEN SUBSTRING(last_name, 1) BETWEEN 'A' AND 'H' THEN 'A-H'
    WHEN SUBSTRING(last_name, 1) BETWEEN 'I' AND 'Q' THEN 'I-Q'
    WHEN SUBSTRING(last_name, 1) BETWEEN 'R' AND 'Z' THEN 'R-Z'
    ELSE 'Other'
  END AS alpha_group
FROM employees;

-- 3. How many employees (current or previous) were born in each decade?
SELECT 
	CASE
		WHEN substr(birth_date, 1, 4) BETWEEN 1950 AND 1959 THEN '1950s'
       --  WHEN substr(birth_date, 1, 4) BETWEEN 1960 AND 1969 THEN '1960s'
       ELSE '1960s'
        END AS 'birth_decade', 
	COUNT(emp_no)
	FROM employees
	GROUP BY birth_decade;
-- 1950 num of employees were 182886
-- 1960 num of employees were 117138

-- 4.What is the current average salary for each of the following department groups: R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?
-- SELECT R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service,
  SELECT AVG(salary), 
  CASE
       WHEN dept_name IN ('research', 'development') THEN 'R&D'
       WHEN dept_name IN ('sales', 'marketing') THEN 'Sales & Marketing'
       WHEN dept_name IN ('Production', 'Quality Management') THEN 'Prod & QM'
       WHEN dept_name IN ('Finance', 'Human Resources') THEN 'Finance & HR'
       ELSE 'Customer Service'
   END AS dept_group
   FROM dept_emp
   LEFT JOIN salaries ON dept_emp.emp_no = salaries.emp_no AND salaries.to_date > CURDATE()
   LEFT JOIN departments ON dept_emp.dept_no = departments.dept_no
GROUP BY dept_group;

-- BONUS
-- Remove duplicate employees from exercise 1.

SELECT DISTINCT(employees.emp_no), CONCAT(first_name,' ',last_name), dept_no, from_date, to_date, 
IF(to_date > CURDATE(), TRUE, FALSE) AS is_current_employee
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no;



