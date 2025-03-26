SELECT sector,
    MAX(marketvalue) AS ma
FROM forbes_global_2010_2014
GROUP BY sector
ORDER BY ma DESC;