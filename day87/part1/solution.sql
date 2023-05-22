with cte as(
    select 
        *,
        rank() over(partition by source_phone_nbr order by call_start_datetime) as rk,
        rank() over(partition by source_phone_nbr order by call_start_datetime desc) as rk_desc
    from phone_log
)
select 
    source_phone_nbr,
    case when min(destination_phone_nbr)=max(destination_phone_nbr) then 'Y'
    else 'N' end as is_match
from cte 
where rk=1 or rk_desc=1
group by source_phone_nbr