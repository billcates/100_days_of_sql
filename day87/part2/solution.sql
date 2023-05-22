with recursive cte as(
    select min(start_range) as num
    from sampletable
    
    UNION ALL
    
    select num+1 as NUM
    from cte where num<(select max(end_range) from sampletable)
)
select a.num as id 
from cte a
join sampletable b
on a. num between b.start_range and b.end_range
