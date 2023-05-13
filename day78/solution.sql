with cte as(
    select 
        customer_id,
        customer_name,
        coalesce(
            sum(
                case when extract (year from billing_creation_date)='2019' then billed_amount end
        ),0) as b,
        coalesce(
            sum(
                case when extract (year from billing_creation_date)='2020' then billed_amount end
        ),0) as d,
        coalesce(
            sum(
                case when extract (year from billing_creation_date)='2021' then billed_amount end
        ),0) as e,
        COALESCE(
            sum(
                case when extract(year from billing_creation_date)='2019' then 1 end),1) as b_ct,
        COALESCE(
            sum(
                case when extract(year from billing_creation_date)='2020' then 1 end),1) as d_ct,
        COALESCE(
            sum(
                case when extract(year from billing_creation_date)='2021' then 1 end),1) as e_ct
    from billing
    group by 1,2
)
select 
    customer_id,
    customer_name,
    round((b+d+e)*(1.0)/(b_ct+d_ct+e_ct),2)
from cte
