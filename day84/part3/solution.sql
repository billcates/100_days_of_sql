select studentname,subject,marks from (
    select studentname,english,maths,science
    from studentinfo
) a
unpivot(
  marks for subject in (english,maths,science)
) as pivot_tbl