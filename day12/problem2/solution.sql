select candidate.Name as "Name" from
(
    select candidateid
    from Vote
    group by candidateid
    order by count(*) desc
    limit 1
) a
join candidate on candidate.id=a.candidateid