## This is the annotated code for Aquatic Invertebrate data on the North and South slopes
## in Lochranza on the North of Arran

## The following dataset was edited in excel to add a generalized 'Slope'
## location (North/South) column. Additionally, only some invertebrates were
## fully identified to species, therefore, 'Species Richness' will only
## consider the Order to which invertebrates were processed to.

## Imported data:
library(readxl)
AquaticInvertebrates <- read_excel("C:/LochranzaData/AquaticInvertebrates.xlsx", 
                                   sheet = "Associated Occurrences EDIT")
View(AquaticInvertebrates)

##Loading packages
library(ggplot2)
library(dplyr)

##Subsetting Slope to South Slope only
SouthID<- 'South'
AquaInvertSouth<- AquaticInvertebrates %>%
  filter(Slope %in% SouthID)

##Subsetting Slope to North Slope only
NorthID<- 'North'
AquaInvertNorth<- AquaticInvertebrates %>%
  filter(Slope %in% NorthID)

## Plotting Species Abundance on South Slope by Species Scientific Order
ggplot(AquaInvertSouth, aes(x = Order, y = individualCount, fill = Order)) +
  geom_col(position = "dodge", colour = "white") +
  labs(x = "Scientific Order", y = "Count of Species") +
  theme_linedraw()+
  ggtitle("Species Abundance of Aquatic Invertebrates on South Slope")+
  coord_flip()

## Plotting Species Abundance on North Slope by Species Scientific Order
ggplot(AquaInvertNorth, aes(x = Order, y = individualCount, fill = Order)) +
  geom_col(position = "dodge", colour = "white") +
  labs(x = "Scientific Order", y = "Count of Species") +
  theme_linedraw()+
  ggtitle("Species Abundance of Aquatic Invertebrates on North Slope")+
  coord_flip()

## Order Richness for Aquatic Invertebrates on North and South Slopes

## As shown by the 'mRichness' table, the North Slope has 6 Aquatic Invertebrates
## species orders, while the South Slope has 9 species orders

## For simplicity I will create a new data frame with these totals as well as
## their respective location

## Location Vector
Slope <- c("North", "South")

## Species Vector
TotalOrders <- c(6, 9)

# Combine into a data frame
RichnessNorthSouth <- data.frame(Location = Slope, Orders= TotalOrders)

# View Table
print(RichnessNorthSouth)

## Barplot RichnessNorthSouth
ggplot(RichnessNorthSouth, aes(x = Location, y = Orders, fill = Location)) +
  geom_col(position = "dodge", colour = "white") +
  labs(x = "Slope Location", y = "Total Count of Orders") +
  scale_x_discrete(labels = c("North","South")) +
  theme_linedraw()+
  ggtitle("Order Richness of Aquatic Invertebrates on North And South Slope")


## End of Kick sampling Analysis