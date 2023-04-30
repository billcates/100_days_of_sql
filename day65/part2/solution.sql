with cte as (
    select 
        department,
        first_name,
        salary,
        rank()over(partition by department order by salary desc) rk 
        from employee
)
select 
    department,
    first_name,
    salary
from cte 
where rk=1
order by salary desc