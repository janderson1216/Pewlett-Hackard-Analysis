--Create list of retirement titles
SELECT DISTINCT e.emp_no,
				e.first_name,
				e.last_name,
				t.title,
				t.from_date,
				t.to_date
into retirement_titles
from employees as e
inner join titles as t
on (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
--create list of unique titles
SELECT DISTINCT On (e.emp_no) e.first_name,
				e.last_name,
				t.title,
				t.from_date,
				t.to_date
into unique_titles
from employees as e
inner join titles as t
on (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no, t.to_date Desc;

--Count number of retirees per title
SELECT Count(ut.title), ut.title
into retiring_titles
from unique_titles as ut
group by ut.title
order by count(ut.title) desc

--Create mentorship eligibility list 
SELECT DISTINCT ON (e.emp_no)e.first_name,
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
ORDER BY e.emp_no;


