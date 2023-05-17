with cte as(
    select 
        *,
        avg(salary) over(partition by deptid) as avg_sal 
    from employee
)
select * 
from cte
where salary>avg_sal