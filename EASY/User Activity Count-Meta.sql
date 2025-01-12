WITH unique_activities AS
  (SELECT user_id,
          COUNT(DISTINCT activity_type) AS total_unique_activities
   FROM activity_log
   GROUP BY user_id)
SELECT DISTINCT p.user_id,
                COALESCE(a.total_unique_activities, 0) AS total_unique_activities
FROM user_profiles AS p
LEFT JOIN unique_activities AS a ON p.user_id = a.user_id;