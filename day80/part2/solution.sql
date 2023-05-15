/*
Enter your query here.
*/
with cte as(
    select (months * salary) as earnings
    from employee
),
final as(
    select max(earnings) as e
    from cte
)
select 
    earnings,
    count(1)
from cte where earnings=(select e from final)
group by earnings