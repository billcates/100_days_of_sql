select viewer_id as id 
from(
    select viewer_id,view_date
    from views
    group by viewer_id,view_date
    having count(distinct article_id)>1
) a
order by viewer_id