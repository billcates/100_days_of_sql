select 
value as room_type,count(1) 
from airbnb_searches
cross apply string_split(filter_room_types,',')
group by VALUE 
order by count(1) desc