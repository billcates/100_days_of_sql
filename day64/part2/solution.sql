with cte as(
    select 
        value
    from google_file_store
    cross apply string_split(contents,' ')
)
,final as(
    select 
        value,
        count(*) as ct
    from cte
    where value='bull'
    or value='bear'
    group by value
)
select * 
from final
order by value desc