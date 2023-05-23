select 
    a.employeename,
    case when b.employeename is NULL then 'BOSS'
    else b.employeename 
    end as manager_name
from employee_1 a 
left join employee_1 b on a.managerid=b.employeeid