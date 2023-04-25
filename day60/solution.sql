with cte as(
    select 
        *,
        row_number() over(partition by section order by number desc) as rk 
    from section_data
),
final as(
    select 
        section,
        number,
        sum(number) over(partition by section) as s,
        max(number) over(partition by section) as mx
    from cte
    where rk<=2
),
res as (
    select 
        *,
        dense_rank() over(order by s desc,mx desc) as rnk
    from final
)
select section,number
from res 
where rnk<=2