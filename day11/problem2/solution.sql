with cte as
(
    select * ,lag(temperature,1,99999) over(order by recordDate) as prev
    from weather
)
select id as "Id"
from cte 
where temperature>prev