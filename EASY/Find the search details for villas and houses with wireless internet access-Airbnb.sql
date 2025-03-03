SELECT *
FROM
    airbnb_search_details
WHERE
    amenities LIKE '%Wireless Internet%' AND 
    property_type IN ('House', 'Villa');