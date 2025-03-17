SELECT 
    distinct business_name
FROM sf_restaurant_health_violations
WHERE 
    business_phone_number IS NOT NULL