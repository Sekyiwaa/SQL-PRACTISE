SELECT
    games,
    COUNT(DISTINCT name) AS n_athletes
FROM olympics_athletes_events
WHERE
    medal IS NULL
GROUP BY 
    games
ORDER BY 
    n_athletes DESC
LIMIT 1;