SELECT 
    product_category,
    sum(case when event_type='1' then 1 else 0 end ) as page_views,
    sum(case when event_type='2' then 1 else 0 end) as cart_adds
FROM clique_bait.events a
join clique_bait.page_hierarchy b
on a.page_id=b.page_id
where b.product_category is not NULL
group by 1
order by 1 
;