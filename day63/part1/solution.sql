select 
    extract(year from inspection_date) as yr,
    count(*) as ct
from sf_restaurant_health_violations
where business_name like '%Roxanne Cafe%'
and violation_id is not NULL
group by 1
order by 1;