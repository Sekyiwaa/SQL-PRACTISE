SELECT CONCAT(first_name, ' ', last_name) AS full_name,
salary
FROM worker
WHERE salary BETWEEN 50000 AND 100000