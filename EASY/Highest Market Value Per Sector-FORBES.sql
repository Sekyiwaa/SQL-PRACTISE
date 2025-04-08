SELECT
    sector,
    MAX(marketvalue) AS max_market_value
FROM forbes_global_2010_2014
GROUP BY 
    sector;