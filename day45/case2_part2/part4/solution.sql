with cte as(
select replace(replace(duration,'minutes',''),'mins','') as duration
from pizza_runner.runner_orders
where duration is not NULL
and duration <> 'null'
)

select (max(replace(duration,'minute','')::int)-min(replace(duration,'minute','')::int))as diff
from cte