--way1
delete from EmpDetail
where id not in (
select min(id)
from EmpDetail
group by empname,departmemt,age,gender,salary)

--way2
with cte as(
select *,row_number()over(partition by empname,departmemt,age,gender,salary order by id) as rk 
from EmpDetail
)
delete from 
cte where rk>1