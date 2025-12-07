## This is the annotated code for Terrestrial Invertebrate data on the North and South slopes
## in Lochranza on the North of Arran

## In this data collection,sweep netting and pitfall traps were used to collect 
## terrestrial invertebrates

## These graphs will only display terrestrial invertebrates found by order, as 
## some invertebrates were not able to be processed to species

## This analysis does not include macro invertebrates/aquatic invertebrates, or moths,
## Macro invertebrate analysis an be found under the r script KickSamplingAnalysis:
## Moth analysis can be found under the r script: 'MothAnalysis.R'

## Uploading Data Frame
library(readxl)
TerrestrialInvertebrates <- read_excel("C:/LochranzaData/TerrestrialInvertebrates.xlsx", 
                                       sheet = "Associated Occurrences")
View(TerrestrialInvertebrates)

##Loading packages
library(ggplot2)
library(dplyr)

##Subsetting South to Slope Location
SouthID<- 'South'
InvertebratesSouth<- TerrestrialInvertebrates %>%
  filter(Slope %in% SouthID)

##Subsetting North to Slope Location
NorthID<- 'North'
InvertebratesNorth<- TerrestrialInvertebrates %>%
  filter(Slope %in% NorthID)

## Plotting Order Abundance on South Slope by Individual's Scientific Order
ggplot(InvertebratesSouth, aes(x = Order, fill = Order)) +
  geom_bar(position = "dodge", colour = "white") +
  labs(x = "Order", y = "Count of Orders") +
  theme_linedraw()+
  ggtitle("Species Abundance of Invertebrates on South Slope")+
  coord_flip()

## Plotting Order Abundance on North Slope by Individual's Scientific Order
ggplot(InvertebratesNorth, aes(x = Order, fill = Order)) +
  geom_bar(position = "dodge", colour = "white") +
  labs(x = "Order", y = "Count of Orders") +
  theme_linedraw()+
  ggtitle("Species Abundance of Invertebrates on North Slope")+
  coord_flip()

## As shown by the 'Terrestrial Invertebrates' table, the North Slope has 5 invertebrate
## orders, while the South Slope has 10 orders.
## For simplicity I will create a new data frame with these totals as well as
## their respective location

## Location Vector
Slope <- c("North", "South")

## Order Vector
TotalOrders <- c(5, 10)

# Combine into a data frame
RichnessNorthSouth <- data.frame(Location = Slope, Order= TotalOrders)

# View Table
print(RichnessNorthSouth)

## Barplot RichnessNorthSouth
ggplot(RichnessNorthSouth, aes(x = Location, y = Order, fill = Location)) +
  geom_col(position = "dodge", colour = "white") +
  labs(x = "Slope Location", y = "Total Count of Orders") +
  scale_x_discrete(labels = c("North","South")) +
  theme_linedraw()+
  ggtitle("Order Richness of Invertebrates on North and South Slope")


## End of Invertebrate Analysis.