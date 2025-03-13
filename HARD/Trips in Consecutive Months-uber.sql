SELECT DISTINCT a.driver_id
FROM uber_trips a
JOIN uber_trips b ON a.driver_id = b.driver_id AND DATE_FORMAT(DATE_ADD(a.trip_date, INTERVAL 1 MONTH), '%Y-%m') = DATE_FORMAT(b.trip_date, '%Y-%m')
WHERE a.is_completed = 1 AND b.is_completed = 1;