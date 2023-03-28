with cte as(
    select event_type,avg(occurences) as avg_occurences
    from events
    group by 1
),
final as(
    select a.business_id,
    sum(case when a.occurences>b.avg_occurences then 1 else 0 end) as rk
    from events a 
    join cte b on a.event_type=b.event_type
    group by 1
)
select business_id 
from final
where rk>1