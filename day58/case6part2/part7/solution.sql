with cte as(
SELECT 
  page_id,
  count(*) as ct
FROM clique_bait.events
where event_type=1
group by 1
order by 2 desc 
limit 3
)
select * from cte
