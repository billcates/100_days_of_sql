
select a.* from reverse_duplicates a
left join reverse_duplicates b 
on a.a=b.b and a.b =b.a
where a.a<b.a
or b.a isnull
