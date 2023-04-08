select c_o.pizza_id,count(1) 
from pizza_runner.runner_orders r_o
join pizza_runner.customer_orders c_o on r_o.order_id=c_o.order_id 
where r_o.cancellation is null or r_o.cancellation not like '%Cancellation%'
group by 1;