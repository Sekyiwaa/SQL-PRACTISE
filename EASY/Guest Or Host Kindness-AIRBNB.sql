SELECT from_type, ROUND(AVG(review_score),2) AS WINNER
FROM airbnb_reviews
GROUP BY from_type
ORDER BY winner DESC
LIMIT 1