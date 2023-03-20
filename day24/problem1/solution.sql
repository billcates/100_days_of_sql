--working solution

SELECT query_name, 
ROUND(AVG(rating/POSITION),2) quality
FROM Queries GROUP BY query_name

--actual solution

select query_name,
round((sum(rating*(1.0)/position))/count(*),2) as quality
from queries
group by query_name
order by (sum(rating*(1.0)/position))/count(*) desc
