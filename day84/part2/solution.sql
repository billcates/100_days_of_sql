with cte as(
    select 0 as num,1 as num1,1 as step
    union ALL
    select  num1 as num, num+num1 as num1,step+1
    from cte 
    where step<10
)
select string_agg(num,',' )within group (order by num) 
from cte