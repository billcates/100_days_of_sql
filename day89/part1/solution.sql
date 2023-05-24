with cte as(
select 
    *,
    rank() over(partition by deptno order by salary) as rk,
    rank() over(partition by deptno order by salary desc) as rk_h
from employee_2
)
select 
    empname,
    deptname,
    deptno,
    salary
from  cte 
where rk=1 or rk_h=1
order by deptno,salary