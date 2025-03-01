#select * from twitch_sessions;

SELECT user_id,
        SUM(session_type = 'streamer') AS streaming,
        SUM(session_type = 'viewer') AS view
FROM twitch_sessions
GROUP BY user_id
HAVING streaming > view
ORDER BY (streaming + view) DESC
LIMIT 3