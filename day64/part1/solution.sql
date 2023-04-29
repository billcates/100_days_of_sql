select 
    e1.first_name,
    e1.salary 
from employee e1
join employee e2 on e1.manager_id=e2.id
and e1.salary>e2.salary;