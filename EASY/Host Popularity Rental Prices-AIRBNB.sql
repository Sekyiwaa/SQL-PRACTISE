WITH host_data AS
  (SELECT DISTINCT CONCAT(price, room_type, host_since, zipcode, number_of_reviews) AS host_id,
                   price,
                   number_of_reviews
   FROM airbnb_host_searches),
     pop_ratings AS
  (SELECT CASE
              WHEN number_of_reviews = 0 THEN 'New'
              WHEN number_of_reviews BETWEEN 1 AND 5 THEN 'Rising'
              WHEN number_of_reviews BETWEEN 6 AND 15 THEN 'Trending Up'
              WHEN number_of_reviews BETWEEN 16 AND 40 THEN 'Popular'
              WHEN number_of_reviews > 40 THEN 'Hot'
          END AS host_popularity,
          price
   FROM host_data)
SELECT host_popularity,
       MIN(price) AS min_price,
       AVG(price) AS avg_price,
       MAX(price) AS max_price
FROM pop_ratings
GROUP BY host_popularity
ORDER BY min_price; -- MySQL 8+ allows alias in ORDER BY