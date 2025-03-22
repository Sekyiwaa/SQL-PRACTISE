With recursive cte as (
    Select 1 as n
    Union
    Select n + 1 from cte where n < (select max(if(CHAR_LENGTH(filter_room_types) - CHAR_LENGTH(replace(filter_room_types, ",", "")) = 0, 1, CHAR_LENGTH(filter_room_types) - CHAR_LENGTH(replace(filter_room_types, ",", "")))) as num_rooms from airbnb_searches)
)

select t4.room_types as cleaned_filter, sum(t3.n_searches) as sum_searches from airbnb_searches as t3 
    right join (
        select distinct(
            substring_index(
                trim(',' from 
                    substring_index(filter_room_types, ",", t2.n)
                ), ",", -1)
            ) as room_types 
            from airbnb_searches as t1 
                left join (select * from cte) as t2 
                    on if(CHAR_LENGTH(filter_room_types) - CHAR_LENGTH(replace(filter_room_types, ",", "")) = 0, 1, CHAR_LENGTH(filter_room_types) - CHAR_LENGTH(replace(filter_room_types, ",", ""))) < t2.n
                ) as t4
    on t3.filter_room_types like concat('%', t4.room_types, '%') where t4.room_types is not null group by t4.room_types order by sum_searches desc;