SELECT
    SUM(streams) as total_number
FROM spotify_worldwide_daily_song_ranking
WHERE   
    position <= 100
ORDER BY    
    position;
    