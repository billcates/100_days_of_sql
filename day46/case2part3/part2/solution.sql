with cte as(
    select UNNEST(STRING_TO_ARRAY(extras, ',')) AS extras 
    from pizza_runner.customer_orders
    where extras is not NULL and extras <>'null'
    and extras <> 'NaN'
)
select extras,count(1) 
from cte
group by 1
order by 2 desc
limit 1