

--2) For business units quarterly analysis, calculate how many users and how many sessions were at each quarter order by quarter from newest to oldest
-- return first date of quarter ,user_count, session_count

select DATEPART(quarter,login_timestamp) as quarter_number,count(user_id) as user_count,count(session_id) as session_count,min(login_timestamp) as quarter_first_login,DATETRUNC(quarter,min(login_timestamp)) as quarter_first_date
from logins
group by DATEPART(quarter,login_timestamp)