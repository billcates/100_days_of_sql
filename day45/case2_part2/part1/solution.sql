select date_part('week',registration_date)
,count(*)
from pizza_runner.runners
group by 1