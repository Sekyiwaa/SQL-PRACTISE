SELECT 
    stars, 
    COUNT(*) AS n_reviews
FROM yelp_reviews
WHERE 
    business_name LIKE 'Lo-Lo\'s Chicken & Waffles'
GROUP BY 
    stars
ORDER BY
    stars;