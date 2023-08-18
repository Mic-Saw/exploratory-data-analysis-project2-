plot5 <- function() {
  # Gather the subset of the NEI data which corresponds to vehicles
  vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
  vehiclesSCC <- SCC[vehicles,]$SCC
  vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]
  
  # Subset the vehicles in Baltimore City
  baltimoreVehiclesNEI <- vehiclesNEI[vehiclesNEI$fips=="24510",]
  
  
  ggplot(baltimoreVehiclesNEI) +
  geom_col(aes(factor(year),Emissions / 1000000),fill="steelblue") +
  theme_minimal() + 
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Mt)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore 1999-2008"))
  
  
  dev.copy(png, file="plot5.png")
  dev.off()
}