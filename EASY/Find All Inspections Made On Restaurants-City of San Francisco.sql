SELECT business_name,
    inspection_score
FROM sf_restaurant_health_violations
WHERE business_name LIKE '%restaurant%';