with cte as(
    select 
        date,
        consumption
    from fb_eu_energy 

    union all

    select 
        date,
        consumption
    from fb_asia_energy

    union all

    select 
        date,
        consumption
    from fb_na_energy 
),
final as(
    select 
        date,
        sum(consumption) as s 
    from cte
    group by 1
    order by 2 desc
)
select * 
from final
where s =(
        select max(s) 
        from final)