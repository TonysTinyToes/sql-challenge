-- DROP TABLE IF EXISTS dept_emp;
-- DROP TABLE IF EXISTS dept_manager;
-- DROP TABLE IF EXISTS departments;
-- DROP TABLE IF EXISTS salaries;
-- DROP TABLE IF EXISTS employees;
-- DROP TABLE IF EXISTS titles;
 




CREATE TABLE titles (
	title_id CHAR(5) PRIMARY KEY,
	title VARCHAR(30) NOT NULL

);

CREATE TABLE employees (
	emp_no INT PRIMARY KEY,
	emp_title CHAR(5) NOT NULL,
	birth_date DATE,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex CHAR(1),
	hire_date DATE,
		FOREIGN KEY (emp_title)
		REFERENCES titles(title_id)
);

CREATE TABLE salaries (
	emp_no INT PRIMARY KEY,
	salary INT, 
		FOREIGN KEY (emp_no) 
		REFERENCES employees(emp_no)
);


CREATE TABLE departments (
	dept_no CHAR(5) PRIMARY KEY,
	dept_name VARCHAR(30)

);


CREATE TABLE dept_emp (
	emp_no INT,
	dept_no VARCHAR(5),
		PRIMARY KEY(emp_no, dept_no),
		FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
		FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager (
	dept_no VARCHAR(5),
	emp_no INT,
		PRIMARY KEY (dept_no, emp_no),
		FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
		FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);



