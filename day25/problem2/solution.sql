SELECT '[0-5>' AS "bin", 
    (SELECT count(*) 
    FROM Sessions 
    WHERE (duration/60) between 0 and 5) AS total 

UNION 

SELECT '[5-10>',
    (SELECT count(*) 
    FROM Sessions
    WHERE (duration/60) between 5 and 10)  

UNION 

SELECT '[10-15>', 
    (SELECT count(*) 
    FROM Sessions
    WHERE (duration/60) between 10 and 15)  

UNION 

SELECT '15 or more', 
    (SELECT count(*) 
    FROM Sessions 
    WHERE (duration/60) >=15)   