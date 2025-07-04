SELECT id_host,
    AVG(DATEDIFF(ds_checkin,ts_booking_at)) AS avg_days_between_booking_and_checkin 
FROM airbnb_contacts
GROUP BY id_host
HAVING AVG(DATEDIFF(ds_checkin,ts_booking_at)) >= 0
ORDER BY avg_days_between_booking_and_checkin DESC
