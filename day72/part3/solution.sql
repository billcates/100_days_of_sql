select 
    bike_number,
    max(end_time) as et
from dc_bikeshare_q1_2012
group by 1
order by 2 desc;