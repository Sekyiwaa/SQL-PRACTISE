SELECT grade, AVG(score) 
FROM los_angeles_restaurant_health_inspections
GROUP BY grade;