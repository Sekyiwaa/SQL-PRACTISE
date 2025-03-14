SELECT 
    city,
    property_type,
    AVG(bathrooms) AS avg_bathrooms,
    AVG(bedrooms) AS avg_bedrooms
FROM
    airbnb_search_details
GROUP BY
    city,
    property_type