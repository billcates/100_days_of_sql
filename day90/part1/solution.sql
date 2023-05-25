with cte as(
    select 
        continents,
        country,
        sum(sales) as s 
    from salesinfo
    group by continents,country
),
final as(
    select 
        *,
        rank() over(partition by continents order by s desc) as rk
    from cte
)
select 
    continents,
    country,
    s
from final 
where rk=1