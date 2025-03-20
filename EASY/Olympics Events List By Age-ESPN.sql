SELECT 
    MIN(age) AS lowest_age,
    AVG(age) AS mean_age,
    MAX(age) AS highest_age
FROM
    olympics_athletes_events;