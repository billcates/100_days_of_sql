SELECT
	order_id,count(pizza_id) as pizza_count
from pizza_runner.customer_orders
group by 1
order by 2 desc
limit 1;