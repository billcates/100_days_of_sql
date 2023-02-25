with cte as 
(
select * 
,row_number() over(partition by emp_id order by time desc)  as rn 
from hospital
)
select * \
from cte 
where rn=1 and action='in'