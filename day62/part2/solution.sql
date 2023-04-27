with cte as(
    select distinct
    concat(price,room_type,host_since,zipcode,number_of_reviews) as host_id,
    price,
    number_of_reviews,
    case when number_of_reviews=0 then 'New'
    when number_of_reviews between 1 and 5 then 'Rising'
    when number_of_reviews between 6 and 15 then 'Trending Up'
    when number_of_reviews between 16 and 40 then 'Popular'
    when number_of_reviews>40 then 'Hot'
    end as popularity
    from airbnb_host_searches
)
select 
    popularity,
    min(price),
    avg(price),
    max(price) 
from cte
group by 1