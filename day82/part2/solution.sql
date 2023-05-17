select 
    b.teamname || ' Vs ' ||d.teamname as matches 
from team b
join team d
on b.id<d.id