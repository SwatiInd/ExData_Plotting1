library(lubridate)
library(dplyr)

setwd <- "C:/Users/Swati Gupta/Documents/Online_Courses/Data Analysis R Foundations/Exploratory data analysis/Project 1/Project-1"
a <- read.delim("./../household_power_consumption.txt", header = TRUE, sep = ";", dec = ",")


a <- a %>%  mutate(Date = dmy(Date)) %>% 
  filter(Date %in% as.Date(c("2007-02-01", "2007-02-02"))) %>%
  mutate(datetime = as.POSIXct(paste(Date, Time)))

a[,3:9] <- apply(a[,3:9], 2, as.numeric)

png(file = "plot4.png",width = 480, height = 480)

par(mfcol = c(2,2))

with(a, plot(datetime, Global_active_power, xlab = " ",
             ylab = "Global Active Power", type = "l"))

with(a, plot(datetime, Sub_metering_1, xlab = " ", ylab = "Energy sub metering", type = "l"))
with(a, lines(datetime, Sub_metering_2, col = "red"))
with(a, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", legend = c("sub_metering_1","sub_metering_2", "sub_metering_3"), 
       col = c("black","red", "blue"), lty = c(1,1,1), lwd = c(2,2,2))

with(a, plot(datetime, Voltage, type = "l"))

with(a, plot(datetime, Global_reactive_power, type = "l"))

dev.off()

