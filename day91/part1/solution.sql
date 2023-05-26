with cte as(
    select a.serialno,a.name,b.month_id,b.month from emp_table A
    cross join month_table b
)
select 
    distinct c.serialno,
    c.name,
    c.month_id,
    c.month,
    d.amount 
from cte c
left join emp_table d
on c.serialno=d.serialno
and c.month_id=d.month_id
order by c.serialno,c.month_id