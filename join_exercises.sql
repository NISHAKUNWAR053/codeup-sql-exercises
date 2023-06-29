SHOW DATABASES;
USE employees;
# Explore the indexes in the employees database
SHOW tables;
SHOW indexes FROM departments; 
# USE your employees database.
USE employees;
 
#DESCRIBE each table and inspect the keys and see which columns have indexes and keys.
SHOW indexes FROM departments; 

USE information_employees;



# JOINS
#Use the join_example_db. Select all the records from both the users and roles tables.
USE join_example_db;

#Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. Before you run each query, guess the expected number of results.

SELECT *
FROM users
JOIN roles ON users.role_id = roles.id;

SELECT *
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;

SELECT *
FROM users
LEFT JOIN roles ON users.role_id = roles.id;

#Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. Use count and the appropriate join type to get a list of roles along with the number of users that has the role. Hint: You will also need to use group by in the query.
SELECT roles.role_name, COUNT(users.user_id) AS user_count
FROM roles
JOIN users ON roles.role_id = users.role_id
GROUP BY roles.role_name;

# 1.JOIN DATABASE (EMPLOYEE DATABASE)
USE employees;
SELECT *
FROM employees;

# 2.write a query that shows each department along with the name of the current manager for that department.

SELECT d.dept_name, CONCAT(e.first_name, ' ', e.last_name) AS manager_name
FROM departments d
JOIN dept_manager dm ON d.dept_no = dm.dept_no
JOIN employees e ON dm.emp_no = e.emp_no
WHERE dm.to_date = '9999-01-01';


# 3.Find the name of all departments currently managed by women.

SELECT d.dept_name, CONCAT(e.first_name, ' ', e.last_name) AS manager_name, gender
FROM departments AS d
JOIN dept_manager AS dm ON d.dept_no = dm.dept_no
JOIN employees AS e ON dm.emp_no = e.emp_no
WHERE e.gender = 'F' AND dm.to_date = '9999-01-01';


# 4.Find the current titles of employees currently working in the Customer Service department.
SELECT title, COUNT(*) AS emp_no
FROM departments AS d
JOIN dept_emp AS de ON d.dept_no = de.dept_no
JOIN employees AS e ON de.emp_no = e.emp_no
JOIN titles AS t ON e.emp_no = t.emp_no
WHERE d.dept_name = 'Customer Service' AND de.to_date = '9999-01-01'
GROUP BY title;

  
# 5.Find the current salary of all current managers.

SELECT CONCAT(first_name, ' ', last_name) AS manager_name, salary
FROM employees AS e
JOIN dept_manager AS dm ON e.dept_no = dm.dept_no
JOIN salaries AS s ON e.emp_no = e.dept_no
WHERE dm.to_date = '9999-01-01';

# 6.Find the number of current employees in each department.
SELECT d.dept_name, COUNT(*) AS employee_count
FROM departments AS d
JOIN dept_emp AS de ON d.dept_no = de.dept_no
GROUP BY d.dept_name;


# 7.Which department has the highest average salary? Hint: Use current not historic information.
SELECT d.dept_name, AVG(salary) AS average_salary
FROM departments d
JOIN dept_emp AS de ON d.dept_no = de.dept_no
JOIN salaries AS s ON de.emp_no = s.emp_no
WHERE de.to_date = '9999-01-01' AND s.to_date = '9999-01-01'
GROUP BY d.dept_name
ORDER BY average_salary DESC
LIMIT 1;

# 8.Who is the highest paid employee in the Marketing department?
SELECT CONCAT(first_name, ' ', last_name) AS employee_name, MAX(salary) AS highest_salary 
FROM employees AS e
JOIN dept_emp AS de ON e.emp_no = de.emp_no
JOIN salaries AS s ON e.emp_no = s.emp_no
JOIN departments AS d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Marketing' 
GROUP BY e.emp_no
ORDER BY highest_salary DESC
LIMIT 1;

# 9.Which current department manager has the highest salary?

SELECT d.dept_name, CONCAT(first_name, ' ', last_name) AS manager_name, MAX(salary) AS highest_salary
FROM departments AS d
JOIN dept_manager AS dm ON d.dept_no = dm.dept_no
JOIN employees AS e ON dm.emp_no = e.emp_no
JOIN salaries AS s ON e.emp_no = s.emp_no
WHERE dm.to_date = '9999-01-01' 
GROUP BY d.dept_name, e.emp_no
ORDER BY highest_salary DESC
LIMIT 1;

# 10.Determine the average salary for each department. Use all salary information and round your results.

SELECT dept_name, ROUND(AVG(s.salary)) AS average_salary
FROM departments d
JOIN dept_emp de ON d.dept_no = de.dept_no
JOIN salaries s ON de.emp_no = s.emp_no
WHERE de.to_date = '9999-01-01' AND s.to_date = '9999-01-01'
GROUP BY dept_name;

# 11.Bonus Find the names of all current employees, their department name, and their current manager's name.

SELECT CONCAT(e.first_name, ' ', e.last_name) AS employee_name, d.dept_name AS department_name, CONCAT(m.first_name, ' ', m.last_name) AS manager_name
FROM employees AS e
JOIN dept_emp AS de ON e.emp_no = de.emp_no
JOIN departments AS d ON de.dept_no = d.dept_no
JOIN dept_manager AS dm ON d.dept_no = dm.dept_no
JOIN employees m ON dm.emp_no = m.emp_no
WHERE de.to_date = '9999-01-01' AND dm.to_date = '9999-01-01';



