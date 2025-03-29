WITH user_activity_with_time_period AS
  (SELECT start_timestamp,
          end_timestamp,
          user_count,
          device_type,
          CONCAT(start_timestamp, ' to ', end_timestamp) AS time_period
   FROM user_activity),
     ranked_user_activity AS
  (SELECT *,
          RANK() OVER (PARTITION BY device_type
                       ORDER BY user_count DESC) AS `rank`
   FROM user_activity_with_time_period)
SELECT user_count,
       time_period,
       device_type
FROM ranked_user_activity
WHERE `rank` = 1;