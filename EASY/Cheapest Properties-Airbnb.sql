SELECT
    city,
    MIN(price) AS min_price
FROM
    airbnb_search_details
GROUP BY 
    city