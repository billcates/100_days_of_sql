with cte as(
    select 
        team_1 as team,
        case when result=team_1 then 1  else 0 end as won,
        case when result is NULL then 1  else 0 end as tie 
    from match_result
    union all
    select 
        team_2 as team,
        case when result=team_2 then 1  else 0 end as won,
        case when result is NULL then 1  else 0 end as tie 
    from match_result
)
select
    team,
    count(*),
    sum(won) as won,
    count(*)-sum(won)-sum(tie) as loss,
    sum(tie) as tie 
from cte
group by team