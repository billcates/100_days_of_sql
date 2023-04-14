with cte as(
    SELECT * 
    FROM foodie_fi.subscriptions
    where exists ( 
            select customer_id 
            from foodie_fi.subscriptions 
            where plan_id='0') 
    and plan_id<>'0'
    and plan_id<>'4'
)
select 
    count(distinct customer_id),
    round(count(distinct customer_id)*(100.0)/(select count(distinct customer_id) from foodie_fi.subscriptions),2) as pct
from cte