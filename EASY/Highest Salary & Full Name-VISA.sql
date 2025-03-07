SELECT CONCAT(first_name, ' ' , last_name) AS full_name, salary
FROM worker
WHERE salary = (SELECT MAX(salary) FROM worker)