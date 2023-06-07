select * 
from country
order by case when countryname='India' then 0 else 1 end,countryname