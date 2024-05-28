SELECT user_id,AVG(TIMESTAMPDIFF(SECOND,LOAD_TIME,EXIT_TIME)) AS SESSION
FROM
(SELECT 
    DATE(timestamp),
    user_id,
    MAX(IF(action='page_load',timestamp,NULL)) AS LOAD_TIME,
    MIN(IF(action='page_exit',timestamp,NULL)) AS EXIT_TIME
FROM facebook_web_log
GROUP BY 1,2)as t

GROUP BY user_id
HAVING SESSION IS NOT NULL;