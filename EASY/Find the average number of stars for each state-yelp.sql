SELECT 
    state,
    avg(stars) AS average_stars
FROM yelp_business
GROUP BY 
    state