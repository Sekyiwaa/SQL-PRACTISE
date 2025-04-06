SELECT jobtitle 
FROM 
    (SELECT
        jobtitle, 
        RANK() OVER (ORDER BY overtimepay DESC) AS rnk
     FROM 
        sf_public_salaries
     WHERE 
        overtimepay IS NOT NULL AND 
        overtimepay <> 0) AS cte
WHERE rnk <= 3