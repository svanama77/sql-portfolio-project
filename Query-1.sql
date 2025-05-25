

--1) Find users who have not loged in the past 5 months

select user_id, MAX(login_timestamp) from logins
group by user_id
having MAX(login_timestamp) < DATEADD(MONTH,-5,GETDATE())


-- OR
select distinct user_id from logins where user_id not in
(select user_id from logins 
where login_timestamp>DATEADD(MONTH,-5,GETDATE()))