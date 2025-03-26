WITH cte AS
    (SELECT grade,
            COUNT(*) AS freq
    FROM los_angeles_restaurant_health_inspections
    WHERE facility_name LIKE '%BAKERY%'
    GROUP BY grade)
SELECT grade
FROM cte
WHERE freq =(
    SELECT MAX(freq)
    FROM cte)