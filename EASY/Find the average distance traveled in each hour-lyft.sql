SELECT 
    hour,
    AVG(travel_distance) AS avg_dis
FROM
    lyft_rides
GROUP BY 
    hour
ORDER BY
    hour