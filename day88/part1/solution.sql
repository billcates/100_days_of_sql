with cte as(
select *,max(z) over(partition by x,y)  as m 
from sample_1
)
select x,y,z 
from cte 
where m>1
order by x,y,z