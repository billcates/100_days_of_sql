select 
    contest_id,
    round((100.0)*count(distinct user_id)/(select count(user_id) from users),2) as percentage
from register
group by contest_id
order by 2 desc,1