# install packages

install.packages("tidyverse")
install.packages("lubridate")
install.packages("dplyr")
install.packages("ggplot2")
install.packages("tidyr")
install.packages("skimr")
install.packages("janitor")
install.packages("here")
library(tidyverse)
library(lubridate)
library(dplyr)
library(ggplot2)
library(tidyr)
library(skimr)
library(janitor)
library(here)
dailyActivity_merged <- read_csv("D:/praivate/كورس/data analyze/project/wellness/fitbit/Fitabase Data 4.12.16-5.12.16/data used/dailyActivity_merged.csv")
View(dailyActivity_merged)
heartrate_seconds_merged <- read_csv("D:/praivate/كورس/data analyze/project/wellness/fitbit/Fitabase Data 4.12.16-5.12.16/data used/heartrate_seconds_merged.csv")
View(heartrate_seconds_merged)
hourly_activity <- read.csv("D:/praivate/كورس/data analyze/project/wellness/fitbit/Fitabase Data 4.12.16-5.12.16/data used/hourly_activity.csv", sep=";")
View(hourly_activity)
minuteMETsNarrow_merged <- read_csv("D:/praivate/كورس/data analyze/project/wellness/fitbit/Fitabase Data 4.12.16-5.12.16/data used/minuteMETsNarrow_merged.csv")
View(minuteMETsNarrow_merged)
minuteSleep_merged <- read_csv("D:/praivate/كورس/data analyze/project/wellness/fitbit/Fitabase Data 4.12.16-5.12.16/data used/minuteSleep_merged.csv")
View(minuteSleep_merged)
sleepDay_merged <- read_csv("D:/praivate/كورس/data analyze/project/wellness/fitbit/Fitabase Data 4.12.16-5.12.16/data used/sleepDay_merged.csv")
View(sleepDay_merged)
weightLogInfo_merged <- read_csv("D:/praivate/كورس/data analyze/project/wellness/fitbit/Fitabase Data 4.12.16-5.12.16/data used/weightLogInfo_merged.csv")
View(weightLogInfo_merged)


n_distinct(dailyActivity_merged$Id)

#Tracking their physical activity
dailyActivity_merged %>% 
  select(TotalSteps,TotalDistance,Calories)  %>% 
  summary()  


#Tracking their heartrate
heartrate_seconds_merged %>% 
  select(Value) %>% 
  summary()

#Tracking their sleep
sleepDay_merged %>% 
  select(TotalMinutesAsleep,TotalTimeInBed) %>% 
  summary()

#Tracking their weight
weightLogInfo_merged %>% 
  select(WeightKg,Fat) %>% 
  summary()

#Determine time when users were mostly active
minuteMETsNarrow_merged %>% 
  select(METs) %>% 
  summary()
hourly_activity %>% 
  select(TotalIntensity) %>% 
  summary()

#calculate average minute for each activity
dailyActivity_merged %>% 
  select(VeryActiveMinutes,FairlyActiveMinutes,LightlyActiveMinutes,SedentaryMinutes) %>% 
  summary()

#What's the relationship between steps taken in a day and sedentary minutes?    
ggplot(data=dailyActivity_merged, aes(x=TotalSteps, y=SedentaryMinutes)) + geom_point()

#What's the relationship between minutes asleep and time in bed?
ggplot(data=sleepDay_merged, aes(x=TotalMinutesAsleep, y=TotalTimeInBed) ) + geom_point()




