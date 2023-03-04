with cte as
(
select case when from_id<to_id then from_id 
        when to_id<from_id then to_id 
        end as person1,
        case when from_id>to_id then from_id 
        when to_id>from_id then to_id 
        end as person2,duration
from calls
)
select person1,person2,count(*) as call_count,sum(duration) as total_duration
from cte
group by person1,person2;