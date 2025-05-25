

-- 5) Display user that had highest session score for each day 
-- Return date,username,score


with cte as (
select u.user_name,CAST(l.login_timestamp as date) as Each_Day,sum(l.session_score) as session_score
from users u inner join logins l on u.user_id=l.user_id
group by u.user_name,CAST(l.login_timestamp as date)
),

ranked as (
select * ,ROW_NUMBER() OVER(partition by Each_Day order by session_score desc) as rnk from cte 
)
select * from ranked where rnk=1