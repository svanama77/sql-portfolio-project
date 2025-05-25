

--3) Display user_id who loged in on Jan-2024 and didnot login on Nov-2023

select distinct user_id from logins
where FORMAT(login_timestamp,'MM-yyyy')='01-2024'
and user_id not in 
(select distinct user_id from logins
where FORMAT(login_timestamp,'MM-yyyy')='11-2023')