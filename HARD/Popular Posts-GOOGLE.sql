SELECT post_id, 
       SUM(duration * (perc_viewed/100)) AS total_viewtime
FROM post_views p
JOIN 
  (SELECT session_id, 
          UNIX_TIMESTAMP(session_endtime) - UNIX_TIMESTAMP(session_starttime) AS duration 
   FROM user_sessions) s ON p.session_id = s.session_id
GROUP BY post_id
HAVING SUM(duration * (perc_viewed/100)) > 5