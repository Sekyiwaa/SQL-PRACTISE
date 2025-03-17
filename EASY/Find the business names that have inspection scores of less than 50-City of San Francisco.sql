SELECT DISTINCT business_name,
    inspection_score,
    inspection_date
FROM sf_restaurant_health_violations
WHERE inspection_score < 50;