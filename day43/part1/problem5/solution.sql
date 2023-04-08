select c_o.customer_id,
sum(case when c_o.pizza_id=1 then 1 else 0 end )as Meat_lovers,
sum(case when c_o.pizza_id=2 then 1 else 0 end )as Vegetarian
from pizza_runner.runner_orders r_o
join pizza_runner.customer_orders c_o on r_o.order_id=c_o.order_id 
where r_o.cancellation is null or r_o.cancellation not like '%Cancellation%'
group by 1