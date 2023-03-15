with cte as(
    select 
        home_team_id as team_id
        ,count(1) as matches_played,
        sum(case when home_team_goals>away_team_goals then 3
        when home_team_goals=away_team_goals then 1 else 0 end) as points
        ,
        sum(home_team_goals) as goal_for
        ,sum(away_team_goals) as goal_against
        ,sum(home_team_goals)-sum(away_team_goals) as goal_diff
    from matches
    group by home_team_id
union all
    select 
        away_team_id as team_id
        ,count(1) as matches_played,
        sum(case when home_team_goals<away_team_goals then 3
        when home_team_goals=away_team_goals then 1 else 0 end) as points
        ,
        sum(away_team_goals) as goal_for
        ,sum(home_team_goals) as goal_against
        ,sum(away_team_goals)-sum(home_team_goals) as goal_diff
    from matches
    group by away_team_id
)
select 
    team_name ,
    sum(matches_played) as matches_played,
    sum(points) as points,
    sum(goal_for) as goal_for,
    sum(goal_against) as goal_against,
    sum(goal_diff) as goal_diff
from cte 
join teams on teams.team_id=cte.team_id
group by team_name
order by sum(points) desc,sum(goal_diff) desc,team_name