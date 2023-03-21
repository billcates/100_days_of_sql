with cte as(
select salary,count(1) 
from employees
group by 1
having count(1)>1
)
select *,
dense_rank() over(order by salary) as team_id 
from employees
where salary in (select salary from cte)