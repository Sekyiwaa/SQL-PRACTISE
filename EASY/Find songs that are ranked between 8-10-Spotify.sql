SELECT 
    trackname,
    position
FROM spotify_worldwide_daily_song_ranking
WHERE 
    position BETWEEN 7 AND 11
ORDER BY position asc;