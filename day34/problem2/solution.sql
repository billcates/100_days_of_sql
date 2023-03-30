with cte as(
    select company_id,
    case when max(salary)<1000 then 0
    when max(salary) between 1000 and 10000 then 24
    when max(salary) >10000 then 49
    end as tax_pct
    from salaries
    group by 1
)
select a.company_id,a.employee_id,a.employee_name,
a.salary-(b.tax_pct*a.salary/(100)) as salary
from salaries a
join cte b on a.company_id=b.company_id