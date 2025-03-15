select video_id, yt_reviewed
from (
    select video_id, rank() over(order by count(*) desc) as rnk,
    sum(case when reviewed_by_yt is true then 1 else 0 end) as yt_reviewed
    from user_flags t1
    join flag_review t2
    on t1.flag_id = t2.flag_id
    group by 1
) s1
where rnk = 1;