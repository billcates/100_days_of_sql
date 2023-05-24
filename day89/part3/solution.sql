select 
    case when id=(select max(id) from seatarrangement) then id
    when id %2 =0 then id-1
    when id %2 <>0 then id+1
    end as id
    ,studentname 
from seatarrangement
order by id