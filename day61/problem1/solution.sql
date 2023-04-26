select 
    trackname,
    count(*) as n_of_times
from spotify_worldwide_daily_song_ranking
where position =1
group by 1
order by 2 desc;