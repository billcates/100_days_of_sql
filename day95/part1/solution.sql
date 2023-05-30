with cte as(
    select spend_date,user_id,min(platform) as platform,sum(amount) as amount
    from spending
    group by 1,2 
    having count(*)=1

    union all 

    select spend_date,user_id,'Both' as platform,sum(amount) as amount
    from spending
    group by 1,2 
    having count(*)=2

    Union ALL

    select distinct spend_date,0 as user_id,'Both' as platform,0 as amount
    from spending
)
select spend_date,platform,sum(amount) as amount ,sum(case when user_id=0 then 0 else 1 end) as total_user_id
from cte
group by 1,2
order by 1,2 desc