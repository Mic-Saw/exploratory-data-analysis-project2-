## Data from files is already loaded:
# NEI <- readRDS("./Downloads/exdata_data_NEI_data/summarySCC_PM25.rds")
# SCC <- readRDS("./Downloads/exdata_data_NEI_data/Source_Classification_Code.rds")

plot1 <- function() {
cat("The first look at data:\n")
cat("\n")  
print(head(NEI, n=10))  
# Create the array with total number of emissions in per year 
total_emission <- tapply(NEI$Emissions, NEI$year, sum)

# Change of units from tonnes to mega tonnes (Mt) and round the results to two decimal places
total_emission <- round(total_emission / 10^6, 2)

cat("\nTotal emission per year (in megatonnes)\n")
cat("\n")
print(total_emission)

#Create plot
barplot(total_emission, col="steelblue", main="Total Emissions per Year", xlab="Year", ylab="Emissions (Mt)")
dev.copy(png, file="plot1.png")
dev.off()

cat("\n")
cat("\nCONCLUSION: Total emissions from PM2.5 have decreased in the United States from 1999 to 2008.")
}
