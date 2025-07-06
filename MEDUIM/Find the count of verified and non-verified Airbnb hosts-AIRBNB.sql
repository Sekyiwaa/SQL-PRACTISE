SELECT 
    host_identity_verified,
    COUNT(*) AS num
FROM airbnb_search_details
GROUP BY
    host_identity_verified