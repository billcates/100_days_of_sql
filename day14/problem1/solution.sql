select session_id 
from playback
where session_id not in(
select a.session_id
from playback a 
join ads b on a.customer_id=b.customer_id 
and b.timestamp between a.start_time and a.end_time)