emmissions_data <- readRDS("C:/Users/Ranjan/Coursera-Exploratory Data Analysis/summarySCC_PM25.rds")
codebook <- readRDS("C:/Users/Ranjan/Coursera-Exploratory Data Analysis/Source_Classification_Code.rds")
total_emmissions<-tapply(emmissions_data$Emissions, INDEX=emmissions_data$year, sum)
baltimore_emmissions <- subset(emmissions_data, fips == "24510")
balitimore_yearwise <- tapply(baltimore_emmissions$Emissions, baltimore_emmissions$year, sum)
library(ggplot2)
balti_split_year_type <- aggregate(Emissions ~ year + type, baltimore_emmissions, sum)
base_gg <- ggplot(balti_split_year_type, aes(year, Emissions, color = type))
base_gg + geom_line() +
  xlab("Year") +
  ylab(expression("Total PM"[2.5]*" Emissions")) +
  ggtitle("Total Emissions per type in Baltimore")
png(filename = "C:/Users/Ranjan/Documents/week4-assignment/plot3.png", width = 446, height = 456, units = "px")
