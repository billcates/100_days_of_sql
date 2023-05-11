select 
    id,
    first_name,
    last_name,
    department_id,
    salary 
from ms_employee_salary a
where salary=(select max(salary) from ms_employee_salary b where a.id=b.id);