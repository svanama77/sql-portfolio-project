

--6) Return users who had a session on every single day since their first login
-- Return User_id

with cte as (
select user_id,MIN(CAST(login_timestamp as date)) as first_login,DATEDIFF(DAY,MIN(CAST(login_timestamp as date)),GETDATE())+1 as no_of_login_days,
count(distinct CAST(login_timestamp as date)) as total_login_days
from logins
group by user_id
having DATEDIFF(DAY,MIN(CAST(login_timestamp as date)),GETDATE())+1=count(distinct CAST(login_timestamp as date)) 
)
select user_id from cte




