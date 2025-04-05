SELECT YEAR(inspection_date) AS inspection_year,
       COUNT(violation_id) AS n_violations
FROM sf_restaurant_health_violations
WHERE business_name = 'Roxanne Cafe'
GROUP BY YEAR(inspection_date)
ORDER BY YEAR(inspection_date) ASC;