with cte as(
select user1_id,user2_id
from friendship
union all
select user2_id as user1_id,user1_id as user2_id
from friendship
)
select 
    t1.user1_id,
    t1.user2_id,
    count(1) common_friend
from cte t1,cte t2
where t1.user2_id=t2.user1_id
and t1.user1_id<t1.user2_id
and t2.user2_id in (select user2_id from cte where user1_id=t1.user1_id)
group by t1.user1_id,t1.user2_id
having count(1)>=3
order by t1.user1_id,t1.user2_id desc