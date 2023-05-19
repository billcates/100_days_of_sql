with recursive cte as(
    select 2 as num

    union ALL
    
    select num+1 as num 
    from cte 
    where num<10
)
select * 
from cte b
where not exists(
    select 1 
    from cte d 
    where b.num!=d.num 
    and b.num% d.num = 0)