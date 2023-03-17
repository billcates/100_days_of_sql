select title,rating 
from imdb 
join genre on imdb.movie_id=genre.movie_id
where genre like 'C%'
and imdb.budget>40000000
and title like '%(2014)'
