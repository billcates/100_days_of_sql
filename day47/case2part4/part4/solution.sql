with cte as(
    select  
        c_o.*,
        r_o.runner_id,
        r_o.pickup_time,
        case when pizza_id=1 then 12
            when pizza_id=2 then 10
            end as cost,
        extract('minute' from (to_timestamp(pickup_time,'YYYY-MM-DD HH24:MI:SS')-order_time)) as diff_in_time,
        replace(r_o.distance,'km','') as distance,
        replace(replace(replace(r_o.duration,'minutes',''),'mins',''),'minute','') as duration
    from pizza_runner.customer_orders c_o
    join pizza_runner.runner_orders r_o
    on c_o.order_id=r_o.order_id
    where r_o.cancellation not like '%Cancellation%'
    or r_o.cancellation is NULL
)
select runner_id,sum(cost+distance :: float * 0.30) from cte
group by 1
order by 1