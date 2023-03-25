select name as"Name"
from employee 
where id in 
(select managerid
from employee
group by 1
having count(1)>=5)