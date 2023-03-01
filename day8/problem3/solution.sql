with cte as
(
    select 
        r1.user_id as user1_id,
        r2.user_id as user2_id,
        count(*) as ct
    from relations r1
    join relations r2
    on r1.follower_id=r2.follower_id
    and r1.user_id<r2.user_id
    group by r1.user_id,r2.user_id
)
select 
user1_id,user2_id
from cte 
where ct=(select max(ct) from cte)