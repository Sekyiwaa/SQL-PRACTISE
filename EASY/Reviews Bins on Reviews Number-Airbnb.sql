SELECT
    CASE 
        WHEN number_of_reviews = 0 THEN 'NO'
        WHEN number_of_reviews BETWEEN 1 AND 5 THEN 'FEW'
        WHEN number_of_reviews BETWEEN 5 AND 15 THEN 'SOME'
        WHEN number_of_reviews BETWEEN 15 AND 40 THEN 'MANY'
        WHEN number_of_reviews > 40 THEN 'A LOT'
    END AS reviews_qualificiation,
    price
FROM airbnb_search_details