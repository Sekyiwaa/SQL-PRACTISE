SELECT
    company,
    profits / sales AS profit_to_sales_ratio
FROM forbes_global_2010_2014
WHERE 
    company = 'Royal Dutch Shell'