

--7) On what dates there were no Logins at all
-- Return Login_dates


--Recursive CTE

with cte as (
select min(cast(login_timestamp as date)) as first_login_date,max(cast(login_timestamp as date)) as last_login_date from logins

union all

select DATEADD(DAY,1,first_login_date),last_login_date from cte
where first_login_date<last_login_date

)

select first_login_date as missing_login_date from cte 
where first_login_date not in 
(select distinct cast(login_timestamp as date) from logins)

option(maxrecursion 1000)