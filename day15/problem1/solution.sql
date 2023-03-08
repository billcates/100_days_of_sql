with cte as(
select a.*,b.name as department,dense_rank()over(partition by b.name order by salary desc) as rk
from employee a 
join department b on a.departmentId=b.id
)
select department as "Department",
name as "Employee",
salary as "Salary"
from cte where rk<=3