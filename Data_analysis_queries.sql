-- Salary of each employee. Listing employee number, last name, first name, and sex. 
SELECT	employees.emp_no,
		employees.last_name,
		employees.first_name,
		employees.sex,
		salaries.salary
FROM employees
LEFT JOIN salaries
ON (employees.emp_no = salaries.emp_no)
ORDER BY employees.emp_no;

-- Employees who were hired in 1986. Listing the first name, last name, and hire date.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--The manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT	dept_manager.dept_no,
		departments.dept_name,
		dept_manager.emp_no,
		employees.last_name,
		employees.first_name
FROM dept_manager
INNER JOIN departments
ON(dept_manager.dept_no = departments.dept_no)
INNER JOIN employees
ON(dept_manager.emp_no = employees.emp_no);

-- The department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT	employees.emp_no,
		employees.last_name,
		employees.first_name,
		departments.dept_name
FROM employees
INNER JOIN dept_emp
ON (employees.emp_no = dept_emp.emp_no)
INNER JOIN departments
ON (dept_emp.dept_no = departments.dept_no)
ORDER BY employees.emp_no;

-- Employee(s) whose first name is Hercules and whose last name begins with the letter B. Listing first name, last name, and sex.
SELECT first_name, last_name, birth_date, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- Each employee in the Sales department, including their employee number, last name, and first name.
SELECT	employees.emp_no,
		employees.last_name,
		employees.first_name,
		departments.dept_name
FROM employees
INNER JOIN dept_emp
ON(employees.emp_no = dept_emp.emp_no)
INNER JOIN departments
ON (dept_emp.dept_no = departments.dept_no)
WHERE departments.dept_name = 'Sales'
ORDER BY employees.emp_no;

-- Each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT	employees.emp_no,
		employees.last_name,
		employees.first_name,
		departments.dept_name
FROM employees
INNER JOIN dept_emp
ON(employees.emp_no = dept_emp.emp_no)
INNER JOIN departments
ON (dept_emp.dept_no = departments.dept_no)
WHERE departments.dept_name IN ('Sales', 'Development')
ORDER BY employees.emp_no;

-- Frequency counts in descending order, of all the employee share each last name
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
