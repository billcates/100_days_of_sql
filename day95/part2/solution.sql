with cte as(
    select 
        case when from_id<to_id then from_id else to_id end as from_id, 
        case when from_id>to_id then from_id else to_id end as to_id,
        duration
    from calls
)
select 
    from_id,
    to_id,
    count(*),
    sum(duration) as total_duration
from cte
group by 1,2
order by 1,2