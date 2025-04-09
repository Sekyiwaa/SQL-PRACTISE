SELECT DISTINCT name
FROM olympics_athletes_events
WHERE 
    team LIKE '%Denmark%' AND
    medal IS NOT NULL;