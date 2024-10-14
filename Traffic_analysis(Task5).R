
#PRODIGY InfoTech Task 05
data1<-read.csv("C:/Users/priya/Downloads/RTA Dataset.csv")
library(ggplot2)
library(dplyr)
library(lubridate)
#Analyse pattern
#Accident by Weather Condition
weather_analysis<-data1%>%group_by(Weather_conditions)%>%summarize(Count=n())
print(weather_analysis)
#Accident by Road Condition
road_analysis<-data1%>%group_by(Road_surface_conditions)%>%summarize(Count=n())
print(road_analysis)
#Visualize Data
#Accident by Weather Condition
ggplot(weather_analysis,aes(x=Weather_conditions,y=Count))+geom_bar(stat="identity",fill="skyblue")+labs(title="Accident by Weather Condition",x="Weather condition",y="Number of Accidents")+theme_minimal()
#Accident by Road condition
ggplot(road_analysis,aes(x=Road_surface_conditions,y=Count))+geom_bar(stat="identity",fill="skyblue")+labs(title="Accident by Road Condition",x="Weather condition",y="Number of Accidents")+theme_minimal()
#Accident by Weather and road condition
ggplot(data1,aes(x=Weather_conditions,fill=Road_surface_conditions))+geom_bar(position="dodge")+labs(title="Accidents by Weather and Road condition",x="Wearher Condition",y="No of Accidents")+theme_minimal()
#Convert the time coulnm to POSIXct format(time only)
data1$Time<-as.POSIXct(data1$Time,format="%H:%M:%S")
#Extract the hour
data1$hour<-format(data1$Time,"%H")
data1$min<-format(data1$Time,"%M")
#Create a bar plot for the no. of accident by hour
ggplot(data1,aes(x=hour))+geom_bar(fill="steelblue")+labs(title="Accident by Hour of the day",x="Hour of the day",y="Number of Accident")+theme_minimal()
#create a heatmap of accidents by hour and minute
ggplot(data1,aes(x=hour,y=min))+geom_bin2d()+
  scale_fill_gradient(low="lightblue",high="red")+labs(title="Accident by Hour and Minute",x="Hour",y="Minute")+theme_minimal()
