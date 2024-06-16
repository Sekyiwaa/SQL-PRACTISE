SELECT
 COUNT(*) AS n_approved
FROM
 facebook_friendship_requests
WHERE 
 MONTH(date_approved) IN (1, 2);