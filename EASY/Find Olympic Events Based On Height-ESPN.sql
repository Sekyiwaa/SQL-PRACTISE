SELECT DISTINCT event
FROM olympics_athletes_events
WHERE season = 'Winter' AND 
height BETWEEN 180 AND 210;