with cte as(
    select 
        b.department,
        max(a.salary) as salary 
    from db_employee a
    join db_dept b on a.department_id=b.id
    group by 1
)
select (select salary from cte where department='marketing')-salary as dif
from cte
where department='engineering';