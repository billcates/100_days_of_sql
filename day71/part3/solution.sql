select  distinct t1.user_id
--,t2.user_id,t1.id,t2.id,datediff('day',t1.created_at,t2.created_at) 
from amazon_transactions t1
join amazon_transactions t2
on t1.user_id=t2.user_id
and t1.id<t2.id
where abs(datediff('day',t1.created_at,t2.created_at)) between 0 and 7
order by 1;