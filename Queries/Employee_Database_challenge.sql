
SELECT employees.emp_no,
employees.first_name,
employees.last_name,
titles.title,
titles.from_date,
titles.to_date
INTO retirement_titles
FROM employees
INNER JOIN titles
ON employees.emp_no = titles.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO Unique_titles
FROM retirement_titles
ORDER BY emp_no ASC, to_date DESC;

Select COUNT(title),title 
INTO Retiring_Titles
from unique_titles
GROUP BY title
ORDER BY count(title) DESC;


SELECT DISTINCT ON (emp_no) e.emp_no,e.first_name, e.last_name,e.birth_date,titles.from_date, titles.to_date, titles.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
on (e.emp_no = de.emp_no)
INNER JOIN titles
on (e.emp_no = titles.emp_no)
WHERE titles.to_date = ('9999-01-01')
AND e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY emp_no