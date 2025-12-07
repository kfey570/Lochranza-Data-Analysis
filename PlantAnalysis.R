## This is the annotated code for Plant data on the North and South slopes
## in Lochranza on the North of Arran

## The following data set was subsetted prior in Excel to calculate the %
## presence of plants per total transects on each slope. This is because
## plant data was recorded as presence/abscence with the percent cover
## of the plant per transect also being recorded. 

## Imported data:
library(readxl)
Lochranza_Data_Plants_ <- read_excel("C:/LochranzaData/Lochranza Data Plants .xlsx", 
                                     sheet = "PercentPresent")
View(Lochranza_Data_Plants_)

##Loading packages
library(ggplot2)
library(dplyr)

##Subsetting South to Slope
SouthID<- 'South'
plantsSouth<- Lochranza_Data_Plants_ %>%
  filter(Slope %in% SouthID)

##Subsetting North to Slope
NorthID<- 'North'
plantsNorth<- Lochranza_Data_Plants_ %>%
  filter(Slope %in% NorthID)

## Plotting Total Presence of Species on South Slope by Species Scientific Name
ggplot(plantsSouth, aes(x = Species, y = PercentPresent, fill = Species)) +
  geom_col(position = "dodge", colour = "white") +
  labs(x = "Scientific Name", y = "Percent Present in Total South Transects") +
  theme_linedraw()+
  ggtitle("Percent Presence of Plants on South Slope")+
  coord_flip()

## Plotting Total Presence of Species on North Slope by Species Scientific Name
ggplot(plantsNorth, aes(x = Species, y = PercentPresent, fill = Species)) +
  geom_col(position = "dodge", colour = "white") +
  labs(x = "Scientific Name", y = "Percent Present in Total North Transects") +
  theme_linedraw()+
  ggtitle("Percent Presence of Plants on North Slope")+
  coord_flip()

####
####

## Species Richness for Plants on North and South Slopes

## As shown by the 'Lochranza_Data_Plants' table, the North Slope has 24 plant species,
## while the South Slope has 18 species

## For simplicity I will create a new data frame with these totals as well as
## their respective location

## Location Vector
Slope <- c("North", "South")

## Species Vector
TotalSpecies <- c(24, 18)

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
  ggtitle("Species Richness of Plants on North And South Slope")


## End of Plant Analysis