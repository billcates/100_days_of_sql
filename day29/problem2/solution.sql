with cte as(
    select *,lead(people,1,0) over(order by id) as next_1,
    lead(people,2,0) over(order by id) as next_2,
    lag(people,1,0) over(order by id) as prev_1,
    lag(people,2,0) over(order by id) as prev_2
    from stadium
)
select id,visit_date,people
from cte 
where (people>100 and next_1>100 and next_2>100)
or(people>100 and next_1>100 and prev_1>100)
or(people>100 and prev_1>100 and prev_2>100)