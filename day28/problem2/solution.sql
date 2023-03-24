--Accepted Solution
select d.name as "Department",
 e.name as "Employee",
  e.salary 
  from department d 
  right join  
  (select name,salary,departmentId 
  from( select *, dense_rank() over(partition by departmentId order by salary desc) as dk 
        from employee) tmp
    where dk=1) e on d.id=e.departmentId


--my solution
with cte as(
select departmentid,max(salary) as salary
from employee
group by 1
)
select a.name as "Department",b.name as "Employee",b.salary as "Salary"
from department a
join employee b on a.id=b.departmentid
where b.salary in (select salary from cte where departmentid=a.id)