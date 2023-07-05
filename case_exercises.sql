USE employees;

-- 1.Write a query that returns all employees, their department number, their start date, their end date, and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not. DO NOT WORRY ABOUT DUPLICATE EMPLOYEES.
 SELECT 
  e.emp_no,
  e.first_name,
  e.last_name,
  d.from_date AS start_date,
  d.to_date AS end_date,
  CASE
    WHEN d.to_date IS NULL THEN 1
    ELSE 0
  END AS is_current_employee
FROM employees e
INNER JOIN dept_emp AS d ON e.emp_no = d.emp_no;


-- FROM employees AS e
-- INNER JOIN dept_emp AS d ON e.emp_no = d.emp_no;  
 # CASE
    #WHEN d.end_date IS NULL THEN 1
    #ELSE 0
  #END AS is_current_employee
#FROM employees e
#INNER JOIN dept_emp d ON e.emp_no = d.emp_no;

-- 2.Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.
SELECT emp_no, first_name, last_name,
CASE 
    WHEN SUBSTRING(last_name, 1) BETWEEN 'A' AND 'H' THEN 'A-H'
    WHEN SUBSTRING(last_name, 1) BETWEEN 'I' AND 'Q' THEN 'I-Q'
    WHEN SUBSTRING(last_name, 1) BETWEEN 'R' AND 'Z' THEN 'R-Z'
    ELSE 'Other'
  END AS alpha_group
FROM employees;

-- 3. How many employees (current or previous) were born in each decade?
SELECT 
  YEAR(birth_date) - YEAR(birth_date) % 10 AS birth_decade,
  COUNT(*) AS num_employees
FROM employees
GROUP BY birth_decade
ORDER BY birth_decade;
-- 1950 num of employees were 182886
-- 1960 num of employees were 117138

-- 4.What is the current average salary for each of the following department groups: R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?
SELECT
  dept_name,
  CASE WHEN title = R$D
  CASE WHEN title = Sales & Marketing
  CASE WHEN title = Prod & QM
  CASE WHEN title = Finance  $ HR
  
  
 
SELECT  titles
FROM employees;




