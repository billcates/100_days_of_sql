select 
    a.first_name,
    a.target 
from salesforce_employees a
where target=(
    select max(target) 
    from salesforce_employees
    where manager_id=13
)
and manager_id=13;