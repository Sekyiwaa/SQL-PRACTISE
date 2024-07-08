select user_id, sum(number_of_comments)
from fb_comments_count
where created_at between DATE_SUB('2020-02-10', INTERVAL 30 DAY) 
and '2020-02-10' 
group by user_id;