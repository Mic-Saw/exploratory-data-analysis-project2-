## Data from files is already loaded:
# NEI <- readRDS("./Downloads/exdata_data_NEI_data/summarySCC_PM25.rds")
# SCC <- readRDS("./Downloads/exdata_data_NEI_data/Source_Classification_Code.rds")

plot3 <- function() {
  # Create subset of data for Baltimore City
  baltimore <- subset(NEI, fips == "24510")
  
  ggplot(baltimore) + geom_col(aes(x=as.character(year), y=Emissions), fill="steelblue")+ facet_wrap(~type) + theme_minimal()
  dev.copy(png, file="plot3.png")
  dev.off()
  
  cat("CONCLUSION: The 'non-road', 'non-point' and 'on-road' types of pollution have steadily decreased. The exception is the 'point' type, which grew rapidly between 1999 and 2005 before declining in 2008.")
}