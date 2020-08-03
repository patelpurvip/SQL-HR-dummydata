CREATE TABLE employees (
	emp_no INT PRIMARY KEY,
	birth_date DATE,
	first_name VARCHAR(20),
	last_name VARCHAR(20),
	gender VARCHAR(1),
	hire_date DATE);

CREATE TABLE departments (
	dept_no VARCHAR(20) PRIMARY KEY,
	dept_name VARCHAR(20));

CREATE TABLE salaries (
	emp_no INT PRIMARY KEY,
	salary INT,
	from_date DATE,
	to_date DATE,
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no));
	
CREATE TABLE dept_staffing (
	emp_no INT,
	dept_no VARCHAR(20),
	from_date DATE,
	to_date DATE DEFAULT '9999-01-01',
	PRIMARY KEY(emp_no, dept_no),
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY(dept_no) REFERENCES departments(dept_no));

CREATE TABLE managers (
	dept_no VARCHAR(20),
	emp_no INT,
	from_date DATE,
	to_date DATE DEFAULT '9999-01-01',
	PRIMARY KEY(dept_no, emp_no),
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY(dept_no) REFERENCES departments(dept_no));

CREATE TABLE titles (
	emp_no 	INT,
	title VARCHAR(20),
	from_date DATE,
	to_date DATE DEFAULT '9999-01-01',
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no));
