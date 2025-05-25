

--4) From Query 2 add percentage change in sessions from last quarter.
-- Return first date of quarter,session_count,session_count_prev,session_percent_change

with cte as (

select DATEPART(quarter,login_timestamp) as quarter_number,DATETRUNC(quarter,MIN(login_timestamp)) as quarter_first_date,count(session_id) as session_count
from  logins
group by DATEPART(quarter,login_timestamp)
),

cte_lag as (

select *, LAG(session_count,1) OVER(order by quarter_first_date) as session_count_prev
from cte
)

select *,
(session_count -  session_count_prev) *100.0 /(session_count_prev) as session_percent_change
from cte_lag