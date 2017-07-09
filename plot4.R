emmissions_data <- readRDS("C:/Users/Ranjan/Coursera-Exploratory Data Analysis/summarySCC_PM25.rds")
codebook <- readRDS("C:/Users/Ranjan/Coursera-Exploratory Data Analysis/Source_Classification_Code.rds")
total_emmissions<-tapply(emmissions_data$Emissions, INDEX=emmissions_data$year, sum)
coal_sources  <- grepl("coal", codebook$Short.Name, ignore.case=TRUE)
subset_coal_match_from_data <- codebook[coal_sources, ]
matched_and_merged <- merge(emmissions_data, subset_coal_match_from_data, by="SCC")
coal_emmission <- tapply(matched_and_merged$Emissions, matched_and_merged$year, sum)
barplot(coal_emmission, xlab = "Year", ylab = "Total Emission (ton)", main = "Total Emission from coal sources")
png(filename = "C:/Users/Ranjan/Documents/week4-assignment/plot4.png", width = 446, height = 456, units = "px")

