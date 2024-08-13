SELECT 
    origin,
    AVG(distance) as avg_distance
FROM 
    us_flights
GROUP BY 
    origin