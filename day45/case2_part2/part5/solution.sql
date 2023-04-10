with cte as(
select 
    *, replace(replace(replace(duration,'minutes',''),'mins',''),'minute','') :: int as duration_new,
  replace(distance,'km','')::float as distance_new
  from pizza_runner.runner_orders
  where duration is not NULL
  and duration <> 'null'
  and distance is not NULL
  and distance <> 'null'
  
)
select runner_id,avg(distance_new/duration_new) as speed
from cte
group by runner_id
order by 1


