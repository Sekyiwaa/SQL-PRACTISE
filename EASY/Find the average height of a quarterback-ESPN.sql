SELECT 
   avg(heightinchestotal) AS avg_height_inches
FROM nfl_combine
WHERE 
    position = 'QB'