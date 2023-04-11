with cte as(
    select 
        o.order_id,
        o.pizza_id,
        p.toppings,
        o.extras,
        o.exclusions
    from pizza_runner.customer_orders o
    join pizza_runner.pizza_recipes p on o.pizza_id=p.pizza_id
    where not exists (select order_id 
                    from pizza_runner.runner_orders r 
                    where r.order_id=o.order_id 
                    and cancellation like '%Cancellation')
),cte2 as(
    select UNNEST(STRING_TO_ARRAY(toppings, ',')) AS toppings 
    from cte

    union all
    
    select unnest(string_to_array(extras, ',')) as toppings 
    from cte
),
cte3 as(
    select 
    unnest(string_to_array(exclusions,',')) as exc 
    from cte
),
cte4 as(
    select exc,count(1) as sub
    from cte3
    where exc<>'null'
    and exc is not NULL
    group by 1

),
cte5 as(
    select toppings,count(1) as ad
    from cte2
    where toppings<>'null'
    group by 1
)
select a.toppings,a.ad-coalesce(b.sub,0) as total_occurence
from cte5 a
left join cte4 b
on a .toppings=b.exc
order by a.ad-coalesce(b.sub,0) desc