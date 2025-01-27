--Deliverable 1

SELECT e.emp_no,
    e.first_name,
    e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no ASC;


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
              first_name,
              last_name,
              title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no ASC, to_date DESC;

-- Creating a Retirement Titles Table
SELECT COUNT(emp_no), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(emp_no) DESC;


--Deliverable 2

-- Create a Mentorship Eligibility Table
SELECT DISTINCT ON (e.emp_no) e.emp_no,
    e.first_name,
    e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as t
ON (e.emp_no = t.emp_no) 
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
AND (t.to_date = '9999-01-01')
ORDER BY e.emp_no;


-- Current Employees Roles to be filled as "Silver Tsunami" Begins

SELECT DISTINCT ON (emp_no) emp_no,
              first_name,
              last_name,
              title,
			  to_date
INTO current_tsunami_emp			  
FROM retirement_titles
WHERE to_date = '9999-01-01' 
ORDER BY emp_no ASC;


-- Breakdown By Roles of Current Employees to be Replaced as Silver Tsunami Begins

SELECT COUNT(emp_no), title
FROM current_tsunami_emp
GROUP BY title
ORDER BY COUNT(emp_no) DESC;