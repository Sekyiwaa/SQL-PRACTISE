with t as (select 
user1 as user ,msg_count from fb_messages
union all
select user2 as user,msg_count from fb_messages)

select user,sum(msg_count) as total
from t
group by user
order by total desc
limit 10;
