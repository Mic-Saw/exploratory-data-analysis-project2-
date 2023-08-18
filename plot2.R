## Data from files is already loaded:
# NEI <- readRDS("./Downloads/exdata_data_NEI_data/summarySCC_PM25.rds")
# SCC <- readRDS("./Downloads/exdata_data_NEI_data/Source_Classification_Code.rds")

plot2 <- function() {
  # Create subset of data for Baltimore City
  baltimore <- subset(NEI, fips == "24510")
  # Create the array with total number of emissions in per year (in Baltiomore) 
  baltimore_total_emission <- tapply(baltimore$Emissions, baltimore$year, sum)
  
  cat("\nBaltimore City - Total emission per year (in tonnes)\n")
  cat("\n")
  print(baltimore_total_emission)
  
  #Create plot
  barplot(baltimore_total_emission, col="steelblue", main="Baltimore City - Total Emissions per Year", xlab="Year", ylab="Emissions (tons)")
  dev.copy(png, file="plot2.png")
  dev.off()
  
  cat("\n")
  cat("\nCONCLUSION: pm2.5 emissions are lower in Baltimore City in 2008 than in 1999.  It did not decline systematically - it fluctuated.")
}