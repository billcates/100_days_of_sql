with recursive cte as
        (select  submission_date, hacker_id
         from submissions
         where submission_date = (select min(submission_date) from submissions)
         union
         select  s.submission_date, s.hacker_id
         from submissions s
         join cte on cte.hacker_id = s.hacker_id
         where s.submission_date = (select min(submission_date) from submissions
                                   where submission_date > cte.submission_date) ),
    unique_hackers as
        (select submission_date, count(1) as unique_hackers
        from cte
        group by submission_date),
    count_submissions as
        (select submission_date, hacker_id, count(1) as no_of_submissions
        from submissions s
        group by submission_date, hacker_id ),
    max_submissions as
        (select submission_date, max(no_of_submissions) as max_submissions
        from count_submissions
        group by submission_date ),
    final_hackers as
        (select c.submission_date, min(c.hacker_id) as hacker_id
        from count_submissions c
        join max_submissions m on m.submission_date = c.submission_date
                                and m.max_submissions = c.no_of_submissions
        group by c.submission_date)
select u.submission_date, u.unique_hackers, f.hacker_id, h.name as hacker_name
from unique_hackers u
join final_hackers f on f.submission_date = u.submission_date
join hackers h on h.hacker_id = f.hacker_id
order by u.submission_date;
