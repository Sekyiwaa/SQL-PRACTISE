SELECT
    count(*) as totals
FROM
    airbnb_search_details
WHERE
    amenities LIKE "%TV%" AND
    neighbourhood = "Westlake" AND
    property_type = "House"