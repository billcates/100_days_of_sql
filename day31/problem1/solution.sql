select a.name,coalesce(sum(b.distance),0) as travelled_distance
from users a
left join rides b on a.id=b.user_id
group by 1
order by 2 desc,1