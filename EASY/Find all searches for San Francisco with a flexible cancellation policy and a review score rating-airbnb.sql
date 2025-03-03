SELECT *
FROM airbnb_search_details
WHERE 
    city = 'SF' AND
    cancellation_policy ='flexible' AND
    review_scores_rating IS NOT NULL
ORDER BY
    review_scores_rating DESC