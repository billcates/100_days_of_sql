select empname,salary 
from (
    select *,dense_rank() over(order by salary desc) as rk 
    from Employee) a 
where rk=3