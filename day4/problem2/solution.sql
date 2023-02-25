select e1.* 
from emp_salary e1 
join emp_salary e2 on e1.salary=e2.salary 
and e1.dept_id =e2.dept_id
and e1.emp_id<>e2.emp_id