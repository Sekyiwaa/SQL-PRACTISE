SELECT name, 
       sum(IF(score < 5, 1, 0)) / (COUNT(*) - sum(IF(score < 5, 1, 0))) AS negative_ratio
FROM instacart_reviews r
JOIN instacart_stores s ON r.store_id = s.id
WHERE opening_date BETWEEN '2021-07-01' AND '2021-12-31'
GROUP BY name
HAVING sum(IF(score < 5, 1, 0)) / COUNT(*) > 0.2