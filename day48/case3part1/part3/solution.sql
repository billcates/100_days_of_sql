SELECT 
    substring(to_char(start_date,'YYYY-MM-DD'),1,7)
    ,plan_id,
    count(1) as no_of_subscriptions
FROM foodie_fi.subscriptions
where extract(year from start_date)>2020
group by 1,2
order by 1,2