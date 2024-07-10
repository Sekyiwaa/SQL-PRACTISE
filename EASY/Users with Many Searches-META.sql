select count(user_id) from 
(select user_id,count(search_id)  as aug
from fb_searches
where date between '2021-08-01' and '2021-08-31'
group by user_id) a
where aug >5;