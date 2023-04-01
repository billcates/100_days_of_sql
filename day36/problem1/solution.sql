with cte as(
select paid_by as user_id,sum(amount) as sub
from transactions
group by 1
)
,
cte2 as(
    select paid_to as user_id,sum(amount) as added
    from transactions
    group by 1
)
select u.user_id,u.user_name,u.credit+coalesce(b.added,0)-coalesce(a.sub,0) as credit,
case when b.added+u.credit-a.sub<0 then 'Yes'
else 'No' end as credit_limit_breached
from users u
left join cte a on u.user_id=a.user_id
left join cte2 b on a.user_id=b.user_id

