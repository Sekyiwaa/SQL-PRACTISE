SELECT 
    department,
    COUNT(id) as total_employees
FROM
    employee
GROUP BY
    department
ORDER BY total_employees DESC,department;