with cte as(
    select activity,count(id) as ct
    from friends
    group by activity
    order by 2
)
select activity 
from cte 
where ct!=(select min(ct) from cte) 
and ct!=(select max(ct) from cte)