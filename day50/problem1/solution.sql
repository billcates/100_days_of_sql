with cte as(
    select case when start_date>max(end_date) 
              over(partition by hall_id 
                   order by start_date asc,end_date asc 
                   rows between unbounded PRECEDING and 1 preceding) then 1 else 0 end as f 
,*
from hall_events
)
select 
    hall_id,
    min(start_date) as start_date,
    max(end_date) as end_date
from cte
group by hall_id,f
order by hall_id