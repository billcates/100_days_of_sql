select 
    b.worker_title,
    a.salary 
from worker a
join title b on a.worker_id=b.worker_ref_id
and a.salary=(select max(salary) from worker)
order by 2 desc,1;