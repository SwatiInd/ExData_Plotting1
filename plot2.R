library(lubridate)
library(dplyr)

setwd <- "C:/Users/Swati Gupta/Documents/Online_Courses/Data Analysis R Foundations/Exploratory data analysis/Project 1/Project-1"
a <- read.delim("./../household_power_consumption.txt", header = TRUE, sep = ";", dec = ",")

a <- a %>%  mutate(Date = dmy(Date)) %>% 
            filter(Date %in% as.Date(c("2007-02-01", "2007-02-02"))) %>%
            mutate(datetime = as.POSIXct(paste(Date, Time)))

a[,3:9] <- apply(a[,3:9], 2, as.numeric)

png(file = "plot2.png",width = 480, height = 480)

with(a, plot(datetime, Global_active_power, xlab = " ",
     ylab = "Global Active Power (killowatts)", type = "l"))

dev.off()

