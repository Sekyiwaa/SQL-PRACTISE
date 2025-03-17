SELECT 
    AVG(score) AS avg_score
FROM  los_angeles_restaurant_health_inspections
WHERE score BETWEEN 91 AND 100;