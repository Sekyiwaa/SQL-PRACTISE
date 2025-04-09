SELECT 
    sum(assets) AS total_assets
FROM forbes_global_2010_2014
WHERE 
    sector = 'Energy';