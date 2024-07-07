with n_people as
(select day,count(*) as n
from
(select day,user1
from facebook_user_interactions
union
select day,user2
from facebook_user_interactions) t
group by day
),
n_interactions as
( select day, count(*) as n
    from facebook_user_interactions
    group by day
)
select a.day, b.n as n_interactions,a.n as n_users
from n_people a
join n_interactions b
on a.day=b.day