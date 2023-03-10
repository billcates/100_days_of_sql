with cte as(
select *,row_number() over(partition by company order by salary) as rk,
row_number() over(partition by company order by salary desc) as desc_rk 
from employee 
)
select id,company,salary 
from cte 
where rk between desc_rk-1 and desc_rk+1
order by company,salary