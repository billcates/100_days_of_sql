
with cte AS(
    select 
        device_id,
        locations as max_location,
        count(*) as no_of_signals
    from device
    group by 1,2
),
final as(
select 
    *,
    sum(no_of_signals) over(partition by device_id) as total_signals,
    rank() over(partition by device_id order by no_of_signals desc) as rk,
    count(max_location) over(partition by device_id) as no_of_loc
from cte
)
select 
    device_id,
    max_location,
    total_signals,
    no_of_loc
from final 
where rk=1