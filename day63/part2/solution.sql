select 
    type,
    count(case when processed= 'TRUE' then 1 end)*(1.0)/(count(*)) as pct
from facebook_complaints
group by 1;