with cte as(
    select 
        *,
        lag(plan_id,1) over(partition by customer_id order by start_date) as prev_plan
    FROM foodie_fi.subscriptions
)
select 
    count(distinct customer_id) as customer_ct,
    round((count(distinct customer_id)) *(100.0)/
    (select count(distinct customer_id)from foodie_fi.subscriptions),0) as pct
from cte
where plan_id=4
and prev_plan=0