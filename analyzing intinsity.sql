--Determine time when users were mostly active

select distinct( CAST(ActivityHour as time ) ) as activity_hour ,
       avg(cast(TotalIntensity as int )) over (partition by datepart(hour,ActivityHour ) ) average_intensity ,
	   avg(cast(mets as int) /10.0 ) over (partition by datepart(hour,ActivityHour )  )  average_mets
from hourly_activity as h
join minuteMETsNarrow as m
on h.id = m.id
and h.ActivityHour = m.ActivityMinute
order by average_intensity desc