select 
    event_name,
    count(*) 
from playbook_events
where device like '%macbook pro%'
group by 1
order by 2 desc;