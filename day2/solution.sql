select gold,count(1) 
from events
where gold not in (select silver from events)
and gold not in (select bronze from events)
group by gold