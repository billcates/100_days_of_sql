select 
    distinct extract(dow from week_date) 
from data_mart.clean_weekly_sales