with cte as(
    select 
        distinct extract(month from a.event_date)+1 as month,
        a.users_id
    from user_actions A
    join user_actions b 
    on a.users_id=b.users_id
    and (extract(month from a.event_date)+1)=extract(month from b.event_date)
    and extract(month from a.event_date)=6
)
select month,count(users_id)
from cte
group by 1