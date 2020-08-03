-- 1) List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;

-- 2) List employees who were hired in 1986
SELECT emp_no, first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date < '1987-01-01';

-- 3) List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT departments.dept_no, departments.dept_name, managers.emp_no, employees.last_name, employees.first_name, managers.from_date, managers.to_date
FROM managers
JOIN departments
ON departments.dept_no = managers.dept_no
JOIN employees
ON managers.emp_no = employees.emp_no;

-- 4) List the department of each employee with the following information: employee number, last name, first name, and department name.
--Question: NOT SURE IF I NEED TO ONLY GET THE MOST RECENT DEPT FOR EMPLOYEES WHO HAVE WORKED IN MORE THAN ONE DEPT
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees 
JOIN dept_staffing ON employees.emp_no = dept_staffing.emp_no
JOIN departments ON dept_staffing.dept_no = departments.dept_no
ORDER BY emp_no ASC;

-- 5) List all employees whose first name is "Hercules" and last names begin with "B."
SELECT employees.emp_no, employees.last_name, employees.first_name
FROM employees 
WHERE first_name LIKE '%Hercules%' AND last_name LIKE '%B%';

-- 6) List all employees in the Sales department, including their employee number, last name, first name, and department name.
--Question: IS THIS SUPPOSED TO INCLUDE ANYONE WHO HAS EVER WORKED IN SALES OR ONLY THE PEOPLE WHO CURRENTLY WORK IN SALES?
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_staffing ON employees.emp_no = dept_staffing.emp_no
JOIN departments ON dept_staffing.dept_no = departments.dept_no
WHERE dept_name = 'Sales';

-- 7) List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
--Question: AGAIN, IS THIS ALL EMPLOYEES OR JUST CURRENT ONES IN EACH DEPT?
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_staffing ON employees.emp_no = dept_staffing.emp_no
JOIN departments ON dept_staffing.dept_no = departments.dept_no
WHERE dept_name in ('Sales', 'Development');

-- 8) In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT COUNT(last_name), last_name
FROM employees
GROUP BY last_name
ORDER BY last_name DESC;