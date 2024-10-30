SELECT  
    neighbourhood,
    AVG(beds) as average_beds
FROM
    airbnb_search_details
WHERE neighbourhood IS NOT NULL
GROUP BY neighbourhood
HAVING SUM(beds) >= 3
ORDER BY average_beds DESC