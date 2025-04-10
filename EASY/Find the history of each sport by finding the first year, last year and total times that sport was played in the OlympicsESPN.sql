SELECT
    sport,
    MIN(year) AS first_time_played,
    MAX(year) AS last_time_played,
    COUNT(year) AS total_years_played
FROM
    (SELECT DISTINCT
        sport,
        year
    FROM olympics_athletes_events) tmp
GROUP BY 
    sport
ORDER BY 
    first_time_played DESC