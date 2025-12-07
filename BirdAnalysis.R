## This is the annotated code for Bird data on the North and South slopes
## in Lochranza on the North of Arran

## Importing Data
library(readxl)
BirdData <- read_excel("C:/LochranzaData/BirdData.xlsx", 
                       sheet = "Associated Occurrences EDIT")
View(BirdData)

##Loading packages
library(ggplot2)
library(dplyr)

##Subsetting South to Slope Location
SouthID<- 'South'
birdsSouth<- BirdData %>%
  filter(Slope %in% SouthID)

## Plotting Species Abundance on South Slope by Species Scientific Name
ggplot(birdsSouth, aes(x = scientificName, y = individualCount, fill = scientificName)) +
  geom_col(position = "dodge", colour = "white") +
  labs(x = "Scientific Name", y = "Count of Species") +
  theme_linedraw()+
  ggtitle("Species Abundance of Birds on South Slope")+
  theme(axis.text.x = element_text(angle = 45, hjust = 1, size = 10))+
  coord_flip()

####Subsetting North to Slope Location
NorthID<- 'North'
birdsNorth<- BirdData %>%
  filter(Slope %in% NorthID)

## Plotting Species Abundance on North Slope by Species Scientific Name
ggplot(birdsNorth, aes(x = scientificName, y = individualCount, fill = scientificName)) +
  geom_col(position = "dodge", colour = "white") +
  labs(x = "Scientific Name", y = "Count of Species") +
  theme_linedraw()+
  ggtitle("Species Abundance of Birds on North Slope")+
  theme(axis.text.x = element_text(angle = 45, hjust = 1, size = 10))+
  coord_flip()

##Species Richness for Birds on North and South Slopes

## As shown by the 'mRichness' table, the North Slope has 14 Bird species
## while the South Slope has 10 species

## For simplicity I will create a new data frame with these totals as well as
## their respective location

## Location Vector
Slope <- c("North", "South")

## Species Vector
TotalSpecies <- c(14, 10)

# Combine into a data frame
RichnessNorthSouth <- data.frame(Location = Slope, Species= TotalSpecies)

# View Table
print(RichnessNorthSouth)

## Barplot RichnessNorthSouth
ggplot(RichnessNorthSouth, aes(x = Location, y = Species, fill = Location)) +
  geom_col(position = "dodge", colour = "white") +
  labs(x = "Slope Location", y = "Total Count of Species") +
  scale_x_discrete(labels = c("North","South")) +
  theme_linedraw()+
  ggtitle("Species Richness of Birds on North And South Slope")

## End of Bird Analysis.