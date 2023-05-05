with cte as(
    select 
        worker_ref_id as emp_id,
        sum(bonus) as bonus
    from sf_bonus
    group by 1
)
select 
    a.employee_title,
    a.sex,
    avg(a.salary+coalesce(b.bonus,0)) as avg_comp
from sf_employee a
join cte b
on a.id=b.emp_id
group by 1,2;