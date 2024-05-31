SELECT
    trackname,
    streams
FROM spotify_worldwide_daily_song_ranking
WHERE
    streams < 2000
ORDER BY
    streams DESC;