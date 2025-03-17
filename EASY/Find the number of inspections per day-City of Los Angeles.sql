SELECT 
    activity_date,
    COUNT(*) AS n_inspections
FROM
    los_angeles_restaurant_health_inspections
GROUP BY 
    activity_date
ORDER BY
    activity_date