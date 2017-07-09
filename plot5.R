emmissions_data <- readRDS("C:/Users/Ranjan/Coursera-Exploratory Data Analysis/summarySCC_PM25.rds")
codebook <- readRDS("C:/Users/Ranjan/Coursera-Exploratory Data Analysis/Source_Classification_Code.rds")
filter_vehicle_codes  <- grepl("vehicle", codebook$SCC.Level.Two, ignore.case=TRUE)
codebook_vehicle <- codebook[filter_vehicle_codes, ]
baltimore_emmissions <- subset(emmissions_data, fips == "24510")
merged_matched_vehicle <- merge(baltimore_emmissions, codebook_vehicle, by="SCC")
balti_vehicle_emmission <- tapply(merged_matched_vehicle$Emissions, merged_matched_vehicle$year, sum)
barplot(balti_vehicle_emmission, xlab = "Year", ylab = "Total Emission in ton", main = "Motor Emissions in Baltimore")
png(filename = "C:/Users/Ranjan/Documents/week4-assignment/plot5.png", width = 446, height = 456, units = "px")