SELECT 
    first_name,
    bonus
FROM employee
WHERE 
    bonus < 150 OR bonus IS NULL
