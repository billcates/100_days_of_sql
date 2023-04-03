with cte as(
    select 
        *,
        substr(phone_number,1,3) as country_code
    from person
)
,
cte2 as(
    select 
        a.caller_id as id,
        a.duration,
        c.name
    from calls a 
    join cte b on a.caller_id=b.id
    join country c on b.country_code=c.country_code

    union 

    select 
        a.callee_id as id,
        a.duration,
        c.name
    from calls a 
    join cte b on a.callee_id=b.id
    join country c on b.country_code=c.country_code
)
,final as(
    select 
        name as country,
        sum(duration) as t_d 
    from cte2
    group by name
)
select country from final
where t_d>(select avg(t_d) from final)