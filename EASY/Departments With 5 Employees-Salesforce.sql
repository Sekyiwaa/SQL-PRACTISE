SELECT
        department
FROM 
        employee 
GROUP BY 
        department
HAVING 
        COUNT(DISTINCT id) >= 5;
