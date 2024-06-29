SELECT 
    year,
    SUM(south + west + midwest+ northeast)
FROM
    housing_units_completed_us
GROUP BY 
    year
ORDER BY 
    year