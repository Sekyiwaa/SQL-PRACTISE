with cte as 
(select rider_id, city_id, date(timestamp) as signup_date
from signup_events
where date(timestamp) between '2022-01-01' and '2022-01-07'
and event_name = 'su_success'
)

select c.city_id, c.signup_date,
COUNT(DISTINCT t.driver_id) /COUNT(DISTINCT c.rider_id) * 100 as percentage
from cte c
left join trip_details t on c.rider_id = t.driver_id
and c.signup_date <= t.request_at 
AND DATEDIFF(t.request_at,c.signup_date ) < 7
and t.status = 'completed'
group by 1, 2