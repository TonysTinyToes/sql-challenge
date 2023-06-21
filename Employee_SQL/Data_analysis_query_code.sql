-- query 1: List the employee number, last name, first name, sex, 
-- and salary of each employee 
select
	e.emp_no,
	e.first_name,
	e.last_name,
	e.sex,
	s.salary
from employees e
		join salaries s 
		on e.emp_no = s.emp_no
		
		
-- query 2: List the first name, last name, and hire date for 
-- the employees who were hired in 1986

select 
	first_name,
	last_name,
	hire_date
from (
	select
	first_name,
 	last_name,
 	hire_date,
 	extract(year from hire_date) as hire_year
	from employees e
	) subQ
where hire_year = 1986


--query 3: List the manager of each department along with their department 
--number, department name, employee number, last name, and first name.
select 
	dm.dept_no,
	d.dept_name,
	dm.emp_no,
	e.last_name, 
	e.first_name
from dept_manager dm
	inner join employees e
	on dm.emp_no = e.emp_no
	inner join departments d
	on dm.dept_no = d.dept_no
	

--query 4: List the department number for each employee along with 
--that employee’s employee number, last name, first name, 
--and department name.

select
	de.dept_no,
	de.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
from dept_emp de
	inner join employees e on de.emp_no = e.emp_no
	inner join departments d on de.dept_no = d.dept_no

--query 5:List first name, last name, and sex of each employee 
--whose first name is Hercules and whose last name begins 
--with the letter B.

select
	e.first_name,
	e.last_name,
	e.sex
from employees e
where e.first_name = 'Hercules'
and e.last_name like 'B%'


--query 6: List each employee in the Sales department, 
--including their employee number, last name, and first name.

select 
	sub.dept_name,
	 e.emp_no,
	 e.last_name,
	 e.first_name
from (
	select 
	de.emp_no,
	d.dept_name
	from dept_emp de
	inner join departments d on de.dept_no = d.dept_no
	where d.dept_name = 'Sales'
) sub
inner join employees e on e.emp_no = sub.emp_no



-- query 7: List each employee in the Sales and Development 
-- departments, including their employee number, 
-- last name, first name, and department name.

select 
	sub.dept_name,
	 e.emp_no,
	 e.last_name,
	 e.first_name
from (
	select 
	de.emp_no,
	d.dept_name
	from dept_emp de
	inner join departments d on de.dept_no = d.dept_no
	where d.dept_name = 'Sales' or d.dept_name = 'Development'
) sub
inner join employees e on e.emp_no = sub.emp_no



-- query 8: List the frequency counts, in descending order,
--of all the employee last names (that is, how many
--employees share each last name).

select 
	count(e.last_name) as Last_name_frequency,
	e.last_name
from employees e
group by e.last_name
order by Last_name_frequency desc 


