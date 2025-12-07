## This is the annotated code for Bat data on the North and South slopes
## in Lochranza on the North of Arran

## In this analysis, bats were recorded only by Presence/Absence, and therefore
## only Species Richness per slope will be considered in this assessment, 
## as well as a pie chart displaying the different species found on each slope

## Data was subsetted and cleaned prior in Excel. Data was subsetted to only 
## include species found on each slope, and not how much they were present/absent
## on each slope.

## Imported data:

library(readxl)
BatAnalysis <- read_excel("C:/LochranzaData/BatAnalysis.xlsx", 
                          sheet = "Associated Occurrences EDIT")
View(BatAnalysis)

##Loading packages
library(ggplot2)
library(dplyr)

##Species Richness for Bats on North and South Slopes

## As shown by the 'BatAnalysis' table, the North Slope has 2 bat species,
## while the South Slope has 5 species

## For simplicity I will create a new data frame with these totals as well as
## their respective location

## Location Vector
Slope <- c("North", "South")

## Species Vector
TotalSpecies <- c(2, 5)

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
  ggtitle("Species Richness of Bats on North And South Slope")

## The goal of this pie chart is just to visually demonstrate the difference
## in bat diversity on each slope, therefore I will subset to each slope
## with each species appearing once as this is not meant to be proportional to
## the presence absence data

## Subset to South Slope
SouthID<- 'South'
batsSouth<- BatAnalysis %>%
  filter(Slope %in% SouthID)

## Pie Chart
ggplot(batsSouth, aes(x = "", y = Slope, fill = scientificName)) +
  geom_col() +
  labs( title = "Species Richness South Slope") +
  coord_polar(theta = "y")+
  theme_linedraw()

## Subset to North Slope
NorthID<- 'North'
batsNorth<- BatAnalysis %>%
  filter(Slope %in% NorthID)

## Pie Chart
ggplot(batsNorth, aes(x = "", y = Slope, fill = scientificName)) +
  geom_col() +
  labs( title = "Species Richness North Slope") +
  coord_polar(theta = "y")+
  theme_linedraw()

## End of Bat Analysis.