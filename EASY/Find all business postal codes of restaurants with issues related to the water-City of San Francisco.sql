SELECT DISTINCT business_postal_code
FROM sf_restaurant_health_violations
WHERE violation_description LIKE '%water%';