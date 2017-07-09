emmissions_data <- readRDS("C:/Users/Ranjan/Coursera-Exploratory Data Analysis/summarySCC_PM25.rds")
codebook <- readRDS("C:/Users/Ranjan/Coursera-Exploratory Data Analysis/Source_Classification_Code.rds")
baltimore_emmissions <- subset(emmissions_data, fips == "24510")
los_angles <- subset(emmissions_data, fips == "06037")
filter_vehicle_codes  <- grepl("vehicle", codebook$SCC.Level.Two, ignore.case=TRUE)
codebook_vehicle <- codebook[filter_vehicle_codes, ]

balti_matched_merged <- merge(baltimore_emmissions, codebook_vehicle, by="SCC")
balti_matched_merged$city <- "Baltimore City"
losangles_matched_merged <- merge(los_angles, codebook_vehicle, by="SCC")
losangles_matched_merged$city <- "Los Angeles County"
baltimore_losangles_data_merged <- rbind(balti_matched_merged, losangles_matched_merged)
baltimore_losangles_data_merged <- aggregate(Emissions ~ year + city, baltimore_losangles_data_merged, sum)
library(ggplot2)
base_gg_q6 <- ggplot(baltimore_losangles_data_merged, aes(year, Emissions, color = city))
base_gg_q6 + geom_line() + 
  xlab("Year") + 
  ylab(expression("Total PM"[2.5]*" Emissions")) + 
  ggtitle("Baltimore - Los Angeles Motor Emission Comparison")
png(filename = "C:/Users/Ranjan/Documents/week4-assignment/plot6.png", width = 446, height = 456, units = "px")