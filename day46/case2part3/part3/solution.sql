with cte as(
    select UNNEST(STRING_TO_ARRAY(exclusions, ',')) AS exclusions from 
    pizza_runner.customer_orders
    where exclusions is not NULL and exclusions <>'null'
    and exclusions <> 'NaN'
)
select exclusions,count(1) 
from cte
group by 1
order by 2 desc
limit 1