library(lubridate)
library(dplyr)

setwd <- "C:/Users/Swati Gupta/Documents/Online_Courses/Data Analysis R Foundations/Exploratory data analysis/Project 1/Project-1"
a <- read.delim("./../household_power_consumption.txt", header = TRUE, sep = ";", dec = ",")

## converting Date data into Date format and extracting data of two days
a <- a %>% mutate(Date = dmy(Date)) %>%
          filter(Date %in% as.Date(c("2007-02-01", "2007-02-02"))) 
a[,3:9] <- apply(a[,3:9], 2, as.numeric)

# plotting global active power histogram in png file
png(file = "plot1.png",width = 480, height = 480)

hist(a$Global_active_power, col = "red",
     main = "Global Active Power", xlab = "Global Active Power (killowatts)")

dev.off()