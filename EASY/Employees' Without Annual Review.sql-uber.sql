SELECT first_name,
       last_name,
       hire_date,
       termination_date
FROM uber_employees
WHERE id NOT IN
    (SELECT DISTINCT emp_id
     FROM uber_annual_review)
ORDER BY hire_date DESC;