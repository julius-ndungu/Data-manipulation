date <- Sys.Date()
date
Sys.time()
"2023-10-14"
"2023-14-10"
"10-14-2023"
"10/14/2023"
#manimulating above using as.Date function
date1 <- as.Date("2023-10-14")#yy-mm-dd
class(date1)
date2 <-as.Date("2023-14-10",format= "%Y-%d-%m")#yy-dd-mm
date3 <- as.Date("10-14-2023", format= "%m-%d-%Y")
date4 <- as.Date("10/14/2023", format= "%m/%d/%Y")
date5 <- as.Date("1-10-2023", format= "%d-%m-%Y")
date6<- as.Date("10 Tue 14 2023", format= "%m %a %d %Y")
library(tidyverse)
#using lubridate package
now()
a <- ymd("2017-03-30")
class(a)
b<- mdy("March 30th,2017")
class(b)
c <- dmy("30-Mar-2017")
class(c)
today()
#install.packages("nycflights13")
library(nycflights13)
glimpse(flights)
flights %>% select(origin,year,month,day,hour)
flights %>% 
  mutate(flight_date = ymd_hm(paste(year,month,day,hour,minute))) %>% 
  select(origin,dest,flight_date)
flights %>% 
  mutate(flight_date = make_datetime(year,month,
                                     day,hour,minute)) %>% 
  select(origin, dest,flight_date)
#extracting date-time-data
flights %>% 
  mutate(flight_date = make_date(year,month,day)) %>% 
  mutate(weekday = wday(flight_date, label = T), month_name = 
           month(flight_date, label = T)) %>% 
  select(origin,flight_date, weekday, month_name)
#filtering months
flights %>% 
  filter(time_hour >= ymd("2013-09-01") & 
           time_hour < ymd("2013-10-01")) %>% 
  select(origin,month)
#time spans(duration, periods, intervals)
#duration
dseconds(15)
dminutes(4)
# intervals
start<- ymd_hms("2023-01-01 12:00:00")
end <- ymd_hms("2023-01-15 12:00:00")
iv <- interval(start,end)
print(iv)
ymd_hms("2023-01-10 12:00:00") %within% iv
as.duration(iv)

#working with ggplot2
flights %>% filter(carrier %in% c("9E","US","AA","MQ")) %>% 
  mutate(week_day = wday(time_hour, label = T)) %>% 
  ggplot(aes(week_day))+geom_bar(fill = "steelblue") +
  facet_wrap(~carrier)+
  theme_bw()+
  labs(title = "Number of flights by carrier",
       x = "weekdays",
       y = "")+theme(plot.title = element_text(hjust = 0))

a <- c(1,2,3,4,5)
b <- c(6,7,8,9,10)
paste(a,b)
