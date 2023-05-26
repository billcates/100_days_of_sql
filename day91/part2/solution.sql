with cte as(
    select 
        club_id,
        member_id,
        unnest(string_to_array(edu,':')) as c 
    from club
),
final as(
    select 
        club_id,
        sum(case when c='MM' then 0.5 
                    when c='CI' then 0.5
                    when c='CO' then 0.5
                    when c='CD' then 1 
                    when c='CL' then 1
                    when c='CM' then 1 
                    when c is NULL then 0 
        end )as points
    from cte
    group by 1
),
l as(
select distinct club_id as club_id 
from club
)
select 
    a.club_id,
    b.points
from l a 
left join final B
on a.club_id=b.club_id
order by club_id