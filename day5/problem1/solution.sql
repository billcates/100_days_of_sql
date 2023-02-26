with a AS(
    select *,row_number() over(order by (select NULL)) rn 
    from call_start_logs
), b as(
    select *,row_number() over(order by (select NULL)) rn 
    from call_end_logs
)
select 
    a.phone_number,
    a.start_time,
    b.end_time,
    datediff(minute,a.start_time,b.end_time) duration_in_minutes
from a join b 
on a.rn=b.rn