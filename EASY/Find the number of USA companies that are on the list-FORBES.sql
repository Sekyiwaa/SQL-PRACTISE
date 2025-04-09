SELECT 
    count(company) AS n_us_companies
FROM forbes_global_2010_2014
WHERE
    country = 'United States';