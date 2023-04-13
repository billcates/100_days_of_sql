SELECT substring(to_char(start_date,'YYYY-MM-DD'),1,7),count(1) as no_of_users
FROM foodie_fi.subscriptions
where plan_id=0
group by 1
order by 1