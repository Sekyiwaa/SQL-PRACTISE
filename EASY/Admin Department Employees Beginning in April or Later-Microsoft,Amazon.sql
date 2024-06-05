SELECT 
    COUNT(*) AS total_employees
FROM
    worker
WHERE 
    department = 'Admin' AND MONTH(joining_date) >= 4; 
