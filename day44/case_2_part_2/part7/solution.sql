SELECT
	count(*)
from pizza_runner.customer_orders c_o
join pizza_runner.runner_orders r_o
on c_o.order_id=r_o.order_id
where r_o.cancellation not like '%Cancellation%'
and c_o.exclusions  <> 'null'
and c_o.extras <> 'null'
and c_o.exclusions is not NULL
and c_o.extras is not NULL
and c_o.exclusions  <> ''
and c_o.extras <> ''