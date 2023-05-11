select 
    b.location,
    avg(a.popularity) 
from facebook_hack_survey a
join facebook_employees b
on a.employee_id=b.id
group by 1
;