SELECT COUNT(*) AS n_5star_reviews
FROM yelp_reviews
WHERE business_name LIKE 'Lo-Lo_s Chicken & Waffles' AND stars = 5