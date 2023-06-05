with cte as(
    select 
        first_player as player_id,
        first_score as score
    from matches

    union ALL
    
    select 
        second_player as player_id,
        second_score as score
    from matches
),
final as(
    select 
        a.player_id,
        group_id,
        sum(score) as s,
        rank() over(partition by group_id order by sum(score)desc,a.player_id) as rk
    from cte a
    join players b
    on a.player_id=b.player_id
    group by 1,2
)
select 
    group_id,
    player_id
from final where rk=1