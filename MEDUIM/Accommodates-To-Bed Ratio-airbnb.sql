SELECT 
    city,
    AVG(CAST(accommodates AS float)/ CAST(beds AS float)) AS avg_crowdness_ratio
FROM  
    airbnb_search_details
WHERE room_type = "Shared room"
GROUP BY city
ORDER BY avg_crowdness_ratio DESC