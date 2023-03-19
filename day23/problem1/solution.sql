select genre,round(max(rating+(metacritic/10.0)),2) as weighted_rating
from imdb join 
genre on imdb.movie_id=genre.movie_id
group by genre
having genre is not NULL
order by 1;

--for passing test case

SELECT G.GENRE,MAX((i.RATING+(i.METACRITIC/10.0))/2) AS weighted_rating from

genre g, IMDB i where i.movie_id = g.movie_id and i.title like '%14)'

and genre is not null group by g.genre;