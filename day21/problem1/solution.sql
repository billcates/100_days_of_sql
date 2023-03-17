SELECT I.Title, I.Rating 
FROM IMDB I
INNER JOIN earning E
ON I.Movie_id = E.Movie_id
WHERE I.MetaCritic > 60 AND E.Domestic > 100000000 AND I.Title LIKE '%(2012)%';