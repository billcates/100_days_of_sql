with cte as (
select user_id,
round((sum(case when action_value='confirmed' then 1 else 0 end)*(1.0))/
count(action_value),2) as confirmation_rate
from confirmations
group by user_id
)
select a.user_id,coalesce(b.confirmation_rate,0.00) as confirmation_rate
from signups a 
left join cte b
on b.user_id=a.user_id
order by a.user_id