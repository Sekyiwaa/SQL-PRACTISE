with cte as (
select player_id,match_result, row_number() over(partition by player_id
order by match_date) as rowid  from players_results
), 
cte2 as (
select player_id, rowid
from cte where match_result = 'W'
), 
cte3 as (
select player_id, rowid - dense_rank() over(partition by player_id order by rowid) as ref 
from cte2),
cte4 as (
select player_id, ref, count(*) as streak, rank() over(
order by count(*) desc) rank1
from cte3 
group by 1, ref)
select player_id, streak
from cte4 where rank1 =1