SELECT  
    department,
    SUM(salary)
FROM worker
GROUP BY
    department
    