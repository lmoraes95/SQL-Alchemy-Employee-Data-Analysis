CREATE TABLE "departments" (
    "dept_no" varchar(250)   NOT NULL,
    "dept_name" varchar(250)   NOT NULL
);

CREATE TABLE "dept_emp" (
    "emp_no" int   NOT NULL,
    "dept_no" varchar(250)   NOT NULL
);

CREATE TABLE "dept_manager" (
    "dept_no" varchar(250)   NOT NULL,
    "emp_no" int   NOT NULL
);

CREATE TABLE "employees" (
    "emp_no" int   NOT NULL,
    "emp_title" varchar(250)   NOT NULL,
    "birth_date" varchar(250)   NOT NULL,
    "first_name" varchar(250)   NOT NULL,
    "last_name" varchar(250)   NOT NULL,
    "sex" varchar(250)   NOT NULL,
    "hire_date" date   NOT NULL
);

CREATE TABLE "salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL
);

CREATE TABLE "titles" (
    "title_id" varchar(250)   NOT NULL,
    "title" varchar(250)   NOT NULL
);

--List the following details of each employee: employee number, last name, first name, sex, and salary.

select e.emp_no, first_name, last_name, sex, s.salary
from employees as e
join salaries s
on e.emp_no = s.emp_no
order by e.emp_no

--List first name, last name, and hire date for employees who were hired in 1986.

select first_name, last_name, hire_date
from employees
where hire_date >= '01/01/1986' and hire_date <= '12/31/1986'
order by hire_date desc


--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name

select d.dept_no, dept_name, e.emp_no, first_name, last_name
from departments as d
inner join dept_manager as dm
on d.dept_no = dm.dept_no
inner join employees as e
on e.emp_no = dm.emp_no

--List the department of each employee with the following information: employee number, last name, first name, and department name.

select dept_name, e.emp_no, first_name, last_name
from departments as d
inner join dept_emp as de
on d.dept_no = de.dept_no
inner join employees as e
on e.emp_no = de.emp_no

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

select first_name, last_name, sex
from employees
where first_name = 'Hercules' and last_name like 'B%'

--List all employees in the Sales department, including their employee number, last name, first name, and department name.

select e.emp_no,last_name, first_name, dept_name
from departments as d
inner join dept_emp as de
on d.dept_no = de.dept_no
inner join employees as e
on e.emp_no = de.emp_no
where d.dept_name = 'Sales'

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

select e.emp_no,last_name, first_name, dept_name
from departments as d
inner join dept_emp as de
on d.dept_no = de.dept_no
inner join employees as e
on e.emp_no = de.emp_no
where d.dept_name = 'Sales' or d.dept_name = 'Development'

--List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.

select distinct(last_name), count(last_name) as count
from employees
group by last_name
order by count desc





