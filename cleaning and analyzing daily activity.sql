---calculating number of users and daily average

--1) Tracking their physical activity

select count(distinct id) nm_users,
       avg(totalsteps) as avg_steps,
	   round(avg(totaldistance), 3) as avg_distance,
	   round(AVG(calories),3) as avg_calories
from dailyActivity

--2) Tracking their heartrate

select   COUNT(distinct id) as nm_users,
          avg(cast(value as int)) as avg_heartrate,
		  max(cast(value as int ))as max_heartrate,
		  min(cast(value as int) ) as min_heartrate

from heartrate_seconds

--3) Tracking their sleep
    select count(distinct id) as nm_users,
	       round(avg(cast(totalminutesasleep as float) )/60.0 ,3 ) as avg_hour_asleep,
		   round(min(cast(totalminutesasleep as float) )/60.0 ,3 ) as min_hour_asleep,
		   round(max(cast(totalminutesasleep as float) )/60.0 ,3) as max_hour_asleep,
		   round(avg(cast(totaltimeinbed as float) )/60.0, 3) as avg_hour_inbed

from sleepDay

--4) Tracking their weight
      select count(distinct id) as nm_users,
	         round(AVG(weightkg), 3) as avg_weight,
			 round(max(weightkg), 3) as max_weight,
			 round(min(weightkg), 3) as min_weight,
			 avg(cast(fat as float )) as avg_fat

from weightloginfo
	         

