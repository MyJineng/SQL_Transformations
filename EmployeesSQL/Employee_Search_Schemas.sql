-- 1. List the employee number, last name, first name, sex, and salary of each employee
select "Employees".emp_no, "Employees".last_name, "Employees".first_name, "Employees".sex, "Salaries".salary
from "Employees"
inner join "Salaries" on
"Employees".emp_no="Salaries".emp_no;
-- 2. List the first name, last name, and hire date for the employees who were hired in 1986
select first_name, last_name, hire_date
from "Employees" 
where hire_date between '1986-01-01' AND '1987-01-01'
ORDER BY hire_date;
;
-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name
select "Department_Managers".dept_no, "Departments".dept_name, 
"Department_Managers".emp_no, "Employees".last_name, "Employees".first_name
from "Department_Managers" 
join "Departments" on "Department_Managers".dept_no="Departments".dept_no
join "Employees" on "Department_Managers".emp_no="Employees".emp_no
;
-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name
select "Departments".dept_no, "Department_Employees".emp_no, "Employees".last_name, "Employees".first_name, "Departments".dept_name
from "Departments"
join "Department_Employees" on "Departments".dept_no="Department_Employees".dept_no 
join  "Employees" on "Department_Employees".emp_no="Employees".emp_no
;
-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
select first_name, last_name, sex from "Employees"
where first_name='Hercules' and last_name like 'B%'
;
-- 6. List each employee in the Sales department, including their employee number, last name, and first name
select "Department_Employees".emp_no, "Employees".last_name, "Employees".first_name from "Departments"
join "Department_Employees" on "Departments".dept_no="Department_Employees".dept_no
join "Employees" on "Department_Employees".emp_no="Employees".emp_no
where "Departments".dept_name = 'Sales'
;
-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
select "Department_Employees".emp_no, "Employees".last_name, "Employees".first_name, "Departments".dept_name from "Departments"
join "Department_Employees" on "Departments".dept_no="Department_Employees".dept_no
join "Employees" on "Department_Employees".emp_no="Employees".emp_no
where "Departments".dept_name = 'Sales' or "Departments".dept_name = 'Development'
;
-- 8. List the frequency counts, in descending order, of all the employee last names
select last_name,
COUNT(last_name) AS "last_name_count"
FROM "Employees"
GROUP BY last_name
ORDER BY
"last_name_count" DESC;
;