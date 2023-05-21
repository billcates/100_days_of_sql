with cte as(
    select *,
    rank() over(partition by department order by salary desc) as rk 
    from emp_detail
)
select 
    empname,
    age,
    salary,
    department 
from cte \
where rk<=2