-- 1 List the employee number, last name, first name, sex, and salary of each employee (2 points)
--SELECT *

SELECT employees.emp_no, last_name, first_name, sex, salary
FROM employees
INNER JOIN salaries
ON employees.emp_no = salaries.emp_no;


--2  List the first name, last name, and hire date for the employees who were hired in 1986 (2 points)

SELECT last_name, first_name, extract(year from hire_date) as "hire_year"
FROM employees
WHERE extract(year from hire_date) = 1986


-- 3 List the manager of each department along with their department number, 
--department name, employee number, last name, and first name (2 points)

SELECT dept_manager.dept_manager_id, dept_manager.dept_no, dept_manager.emp_no, last_name, first_name
FROM dept_manager
INNER JOIN employees ON dept_manager.emp_no = employees.emp_no

--4  List the department number for each employee along with that employee’s employee number, 
--last name, first name, and department name (2 points)

SELECT employees.emp_no,  first_name,last_name, dept_emp.dept_no, departments.dept_name
FROM employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no;


--5  List first name, last name, and sex of each employee whose first name is Hercules and whose last name 
--begins with the letter B (2 points)

Select first_name, last_name, sex
from employees
WHERE first_name = 'Hercules' and last_name LIKE 'B%'

-- 6 List each employee in the Sales department, including their employee number, last name, and first name (2 points)

Select employees.emp_no, first_name, last_name
FROM employees
INNER JOIN dept_emp 
ON employees.emp_no = dept_emp.emp_no
AND dept_no = 'd007';


-- 7List each employee in the Sales and Development departments, including their employee number, last name, first name, 
--and department name (4 points)

Select employees.emp_no, first_name, last_name, departments.dept_name
FROM employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_emp.dept_no = 'd005'
OR  dept_emp.dept_no = 'd007'



-- 8 List the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name) (4 points)

SELECT count(last_name) as frequency, last_name
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;