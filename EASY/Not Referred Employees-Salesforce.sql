SELECT first_name
FROM employee
WHERE manager_id != 1 OR manager_id IS NULL