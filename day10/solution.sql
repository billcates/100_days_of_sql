select 
trim(lower(product_name)) as product_name,
to_char(sale_date,'YYYY-MM') as sale_date,
count(sale_id) as total
from sales
group by trim(lower(product_name)),to_char(sale_date,'YYYY-MM')
order by trim(lower(product_name)),to_char(sale_date,'YYYY-MM')