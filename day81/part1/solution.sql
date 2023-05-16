select 
    deptid,
    string_agg(emailid, ';' order by emailid) as email 
from emp_details
group by 1
order by 1