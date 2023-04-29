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
order by value desc;


--Postrgres Solution
with cte as(
select unnest(string_to_array(contents,' ')) as words
from google_file_store
)
select words,count(*) as ct
from cte
where words='bull' or words='bear'
group by 1
order by 1 desc