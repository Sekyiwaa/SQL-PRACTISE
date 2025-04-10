SELECT
    name
FROM olympics_athletes_events
WHERE 
    age > 40 AND
    medal IN ('Bronze', 'Silver');