SELECT hotel_name,
       total_number_of_reviews
FROM hotel_reviews
GROUP BY hotel_name,
         total_number_of_reviews
ORDER BY total_number_of_reviews DESC