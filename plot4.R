plot4 <- function(){
  # Subset coal combustion related NEI data
  combustionRelated <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
  coalRelated <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
  coalCombustion <- (combustionRelated & coalRelated)
  combustionSCC <- SCC[coalCombustion,]$SCC
  combustionNEI <- NEI[NEI$SCC %in% combustionSCC,]
  
  

  ggplot(combustionNEI) + 
  geom_col(aes(factor(year),Emissions / 1000000),fill="steelblue") +
  theme_minimal() +  
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Mt)")) + 
  labs(title=expression("PM"[2.5]*" Coal Combustion Source Emissions Across US from 1999-2008"))
  
  dev.copy(png, file="plot4.png")
  dev.off()
}