select extract(dow from order_time) as hr,count(1) as volume
from pizza_runner.customer_orders
group by 1