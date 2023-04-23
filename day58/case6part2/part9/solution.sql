SELECT 
    product_id,
    sum(case when a.event_type=3 then 1 else 0 end ) as ct
FROM clique_bait.events a
join clique_bait.page_hierarchy b
on a.page_id=b.page_id
where b.product_id is not NULL
group by 1
order by 2 desc
limit 3
;