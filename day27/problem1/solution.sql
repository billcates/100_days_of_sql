select a.genre,max(b.domestic+b.worldwide-c.budget) as net_profit
from genre a
join earning b on a.movie_id=b.movie_id
join imdb c on c.movie_id=a.movie_id
where genre is not NULL
and c.title like '%2012%'
group by 1
order by 1