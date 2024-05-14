---calculate the nimbes of days for each users tracked by physical activity

select distinct id,
       COUNT(activitydate) over (partition by id )  as nm_activity_date

from dailyActivity
order by nm_activity_date desc

--- calculate average minute for each activity

select round(AVG(veryactiveminutes) ,2)   as  avg_veryactive_minute,
       round(AVG(FairlyActiveMinutes) ,2)  as  avg_failrlyactive_minute,
	   round(AVG(LightlyActiveMinutes) / 60.0 ,2)  as  avg_lightlyactive_hour,
	   round(AVG(SedentaryMinutes) / 60.0 ,2)     as avg_sedentaryactive_hour

from dailyactivity