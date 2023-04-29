with cte as(
    select 
        state,
        count(*) as ct
    from yelp_business
    where stars=5
    group by state
    order by 2 desc, state
),
final as(
select 
    *,
    rank() over(order by ct desc) as rk
from cte
)
select 
    state,
    ct 
from final 
where rk<=5