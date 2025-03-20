SELECT 
    COUNT(DISTINCT name) AS n_athletes
FROM nfl_combine
WHERE 
    year = 2013 AND
    pickround <> 0