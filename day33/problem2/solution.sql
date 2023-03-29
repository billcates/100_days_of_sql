with cte as (
select person_name,turn,sum(weight) over(order by turn) as total_weight
from queue
)
,final as(
    select * from cte 
    where total_weight<=1000
)
select person_name from final
where turn =(select max(turn) from final)