select 
    unnest(string_to_array(categories,';')) as category,
    sum(review_count) as r
from yelp_business
group by 1
order by 2 desc;