select distinct a.host_id,b.guest_id 
from airbnb_hosts a
join airbnb_guests b
on a.gender=b.gender
and a.nationality=b.nationality;