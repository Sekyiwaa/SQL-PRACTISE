SELECT  country,
    COUNT(*) AS n_companies
FROM forbes_global_2010_2014
WHERE 
    sector ='Information Technology'
GROUP BY
    country
ORDER BY
    n_companies DESC;