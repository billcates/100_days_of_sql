select 
    a.employee_id,
    365-sum((end_dates-start_dates)+1) as days_on_bech 
from staffing a 
join consulting_engagements b on a.job_id=b.job_id
and a.is_consultant!='0'
group by 1