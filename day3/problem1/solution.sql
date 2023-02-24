with cte as 
(
select 
    ticket_id,
    create_date,
    resolved_date,
    count(1) as public_holidays 
from tickets
left join holidays
on holiday_date between create_date and resolved_date
group by ticket_id,create_date,resolved_date
)
select *,
datediff(day,create_date,resolved_date) as total_days,
datediff(day,create_date,resolved_date)
-datediff(week,create_date,resolved_date)-public_holidays as business_days
from cte