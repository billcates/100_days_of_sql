with RECURSIVE cte as(
    select 
        searches,
        num_users,
        1 as temp 
        from search_frequency
    union ALL

    select 
        searches,
        num_users,
        temp+1 as TEMP
    from cte
    where temp<num_users
)
select PERCENTILE_CONT(.5) within group (order by searches) 
from cte
