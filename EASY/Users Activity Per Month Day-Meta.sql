select DAY(post_date),count(*)
from facebook_posts
GROUP BY DAY(post_date);