SELECT
    name, 
    team,
    games, 
    sport,
    medal
FROM olympics_athletes_events
WHERE 
    team LIKE '%/%';