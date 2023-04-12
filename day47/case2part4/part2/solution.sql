with cte as(
    select c_o.*,r_o.runner_id,r_o.pickup_time,r_o.distance,r_o.duration,
    case    when pizza_id=1 then 12
            when pizza_id=2 then 10
    end as cost 
    from pizza_runner.customer_orders c_o
    join pizza_runner.runner_orders r_o
    on c_o.order_id=r_o.order_id
    where r_o.cancellation not like '%Cancellation%'
    or r_o.cancellation is NULL
)
,cte2 as(
select extras,unnest(string_to_array(extras,','))
from cte
where extras <> 'null'
)
select (select sum(cost) from cte)+(select count(extras) from cte2) as total_earning
