#Jeff_sandbox01
#testing


## Load packages
library(plyr)
library(tidyr)
library(dplyr)
library(base)
library(ggplot2)
library(gridExtra)
library(mlbench)
library(caret)

d1 = read.csv("Source/CaseStudy2-data.csv", header = TRUE)

d1 %>% head()
d1 %>% summary()

d1 %>% dim()

## bringing over Ganesh's code


## Read the attrition data provided by DDSAnalytics into dataframe
df_ddanalytics = read.csv("Source/CaseStudy2-data.csv", header = TRUE)

## Dimension of the dataframe which provides number of rows and columns
dim(df_ddanalytics)

## Change column names of the dataframe within 12 characters
names(df_ddanalytics) <-c("Age","Attrition","BusinsTravl","DailyRate","Department","DistancHome","Education","EducField","EmployCount","EmployeeNum","EnvSatisfct","Gender","HourlyRate","JobInvolve","JobLevel","JobRole", "JobSatisfct","MaritlStats","MonthIncom","MonthRate", "NumCompWorkd","Over18", "OverTime","SalaryHike","PerfRating","RelSatisfct","StandHours","StockOption","WorkingYear","LastYrTrain","WorkLifeBal","YrsAtCompny","CurRoleYrs","YrslastProm","YrsCurMangr")
## Convert the parameters to descrption shared in definitions and create new dataset
df_ddanalytics_updated <- df_ddanalytics %>%
  mutate(Education = as.factor(if_else(Education == 1,"Below College", if_else(Education == 2, "College", if_else(Education == 3, "Bachelor", if_else(Education == 4, "Master","Doctor")))))
         ,EnvSatisfct = as.factor(if_else(EnvSatisfct == 1,"Low",if_else(EnvSatisfct == 2, "Medium", if_else(EnvSatisfct == 3, "High", "Very High"))))
         ,JobInvolve = as.factor(if_else(JobInvolve == 1,"Low",if_else(JobInvolve == 2, "Medium",if_else(JobInvolve == 3, "High", "Very High"))))
         ,JobSatisfct = as.factor(if_else(JobSatisfct == 1, "Low",if_else(JobSatisfct == 2, "Medium",if_else(JobSatisfct == 3, "High","Very High"))))
         ,PerfRating = as.factor(if_else(PerfRating == 1, "Low",if_else(PerfRating == 2, "Good", if_else(PerfRating == 3, "Excellent", "Outstanding"))))
         ,RelSatisfct = as.factor(if_else(RelSatisfct == 1, "Low",if_else(RelSatisfct == 2, "Medium", if_else(RelSatisfct == 3, "High", "Very High"))))
         ,Attrition = as.integer(if_else(Attrition == "Yes", 1, 0))
         ,BusinessTravel = as.factor(if_else(BusinessTravel == "Travel_Frequently",2,if_else(BusinessTravel == "Travel_Rarely", 1, 0)))
         ,WorkLifeBal = as.factor(if_else(WorkLifeBal == 1, "Bad",if_else(WorkLifeBal == 2, "Good", if_else(WorkLifeBal == 3, "Better", "Best"))))
  )%>% select(-EmployCount, -EmployeeNum, -Over18, -JobLevel)
summary(df_ddanalytics_updated)
str(df_ddanalytics_updated)
#Test data Fram with only numeric
d3=df_ddanalytics_updated
str(d3)
d5<- d3[,c(2,4,6,11,16:18,20,23:26,29:31)]
head(d5)
str(d5)

# calculate correlation matrix
cm <- cor(d5$Attrition[,1:14])
# summarize the correlation matrix
summary(cm)
# find attributes that are highly corrected (ideally >0.75)
highlyCorrelated <- findCorrelation(correlationMatrix, cutoff=0.5)
# print indexes of highly correlated attributes
print(highlyCorrelated)