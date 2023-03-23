with recursive cte as  
( 
select id,
max(month) as month,
1 as month_temp 
from employee 
group by id 

union all 

select id,
   month,
   month_temp+1 
   from cte 
   where month_temp<month 
)
select * from (
    select a.id,
    b.month,
        coalesce(b.salary,0)+ 
        coalesce(lag(salary,1,0) over (partition by a.id order by a.month_temp),0) + 
        coalesce(lag(salary,2,0) over (partition by a.id order by a.month_temp),0)  as Salary 
    from cte a 
    left join employee b 
    on a.id=b.id 
    and a.month_temp=b.month 
    where a.month<>a.month_temp ) a 
where a.month is not null  
order by id asc,month desc;