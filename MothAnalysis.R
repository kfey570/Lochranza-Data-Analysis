## This is the annotated code for Moth data on the North and South slopes
## in Lochranza on the North of Arran

## In this analysis some Moth's were only processed to order or super family, while
## most others were processed to Species. These will still be counted as 'species'
## in species richness graphs, as they are a unique occurrence of an organism,
## but it must be considered that these were not actually able to be identified to
## a species level

## Additionally, the following imported data was subsetted/cleaned prior in r
## from it's original dataset. A column was added to generalize the eventID's
## into their respective slopes

## Imported Data:
library(readxl)
MothData <- read_excel("C:/LochranzaData/MothData.xlsx", 
                       sheet = "Associated Occurrences EDIT")
View(MothData)

##Loading packages
library(ggplot2)
library(dplyr)

##Subsetting South to Slope
SouthID<- 'South'
mothsSouth<- MothData %>%
  filter(Slope %in% SouthID)

##Subsetting North to Slope
NorthID<- 'North'
mothsNorth<- MothData %>%
  filter(Slope %in% NorthID)

## Plotting Species Abundance on South Slope by Species Scientific Name
ggplot(mothsSouth, aes(x = scientificName, fill = scientificName)) +
  geom_bar(position = "dodge", colour = "white") +
  labs(x = "Moths", y = "Count of Species") +
  theme_linedraw()+
  theme(axis.text.x = element_text(angle = 45, hjust = 1, size = 10))+
  ggtitle("Species Abundance of Moths on South Slope")+
  coord_flip()

## Plotting Species Abundance on North Slope by Species Scientific Name
ggplot(mothsNorth, aes(x = scientificName, fill = scientificName)) +
  geom_bar(position = "dodge", colour = "white") +
  labs(x = "Moths", y = "Count of Species") +
  theme_linedraw()+
  theme(axis.text.x = element_text(angle = 45, hjust = 1, size = 10))+
  ggtitle("Species Abundance of Moths on North Slope")+
  coord_flip()

##Species Richness for Moths on North and South Slopes

## As shown by the 'mRichness' table, the North Slope has 25 Moths species
## while the South Slope has 21 species

## For simplicity I will create a new data frame with these totals as well as
## their respective location

## Location Vector
Slope <- c("North", "South")

## Species Vector
TotalSpecies <- c(25, 21)

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
  ggtitle("Species Richness of Moths on North And South Slope")


## End of Moth Analysis