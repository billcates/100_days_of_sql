select runner_id,count(1) 
from pizza_runner.runner_orders
where cancellation is null or 
cancellation not like '%Cancellation%'
group by 1;