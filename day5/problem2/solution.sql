with cte as(
select *,
row_number()over(partition by user_id order by date) rn 
from user_activity
)
select 
    date,sum(case when rn=1 then 1 else 0 end ) as COUNT
from cte 
group by date
order by date