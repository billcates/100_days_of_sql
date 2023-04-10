select 
    c_o.order_id,
    r_o.pickup_time,
    c_o.order_time,
    extract('minute' from to_timestamp(r_o.pickup_time,'YYYY-MM-DD HH24:MI:SS')-c_o.order_time) as diff_in_minutes
from pizza_runner.customer_orders c_o
join pizza_runner.runner_orders r_o
on c_o.order_id=r_o.order_id
and r_o.pickup_time is not NULL
and r_o.pickup_time <>'null'