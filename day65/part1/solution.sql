with cte as(
    select user1,user2 
    from facebook_friends

    union all
    
    select user2,user1
    from facebook_friends
)
select 
    user1,
    (count(distinct user2)*(100.0))/(select count(distinct user1) from cte) as pop_pct
from cte
group by 1;