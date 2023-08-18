plot6 <- function() {
  # Gather the subset of the NEI data which corresponds to vehicles
  vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
  vehiclesSCC <- SCC[vehicles,]$SCC
  vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]
  
  # Subset the vehicles NEI data by each city's fip and add city name.
  vehiclesBaltimoreNEI <- vehiclesNEI[vehiclesNEI$fips=="24510",]
  vehiclesBaltimoreNEI$city <- "Baltimore"
  
  vehiclesLANEI <- vehiclesNEI[vehiclesNEI$fips=="06037",]
  vehiclesLANEI$city <- "Los Angeles"
  
  # Combine the two subsets with city name into one data frame
  bothNEI <- rbind(vehiclesBaltimoreNEI,vehiclesLANEI)
  
  ggplot(bothNEI, aes(x=factor(year), y=Emissions, fill=city)) +
  geom_bar(aes(fill=year),stat="identity") +
  facet_grid(scales="free", space="free", .~city) +
  theme_minimal() +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008"))
  
  dev.copy(png, file="plot6.png")
  dev.off()
  
}