with cte as(
    select runner_id,count(1) total_orders
    from pizza_runner.runner_orders
    group by 1
),
cte2 as(
select 
    runner_id,
    count(1) as succ_orders
    from pizza_runner.runner_orders
    where cancellation not like '%Cancellation%'
    group by 1
)
select a.runner_id,round(b.succ_orders*(100.0)/a.total_orders,2) as pct
from cte a
join cte2 b on a.runner_id=b.runner_id