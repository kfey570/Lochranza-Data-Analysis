## This is the annotated code for Mammal data on the North and South slopes
## in Lochranza on the North of Arran.

## In this analysis, presence of feces and visual sight of a species were both counted as a singular
## observed species which may affect the data actual presence/absence of a species
## Camera observations and Visual sight of species were also counted as single observations

## Imported data:
library(readxl)
MammalsEdit <- read_excel("C:/LochranzaData/MammalsEdit.xlsx")
View(MammalsEdit)


##Loading packages
library(ggplot2)
library(dplyr)

##Subsetting South to EventID
SouthID<- c('S1MR','S2MR','S3MR')
mammalsSouth<- MammalsEdit %>%
  filter(eventID %in% SouthID)

##Subsetting mammalsSouth without NAs
mammalsSouth <- subset(mammalsSouth, !is.na(organismQuantityType))

## Plotting Species Abundance on South Slope by Species Scientific Name
ggplot(mammalsSouth, aes(x = scientificName, y = individualCount, fill = scientificName)) +
  geom_col(position = "dodge", colour = "white") +
  labs(x = "Scientific Name", y = "Count of Species") +
  scale_x_discrete(labels = c("S. vulgaris", "C. elaphus", "Ovis sp.")) +
  theme_linedraw()+
  ggtitle("Species Abundance of Mammals on South Slope")

####
####

## For North ID Was having difficulty getting total counts of species due to design of spreadsheet
## For example, numbers of species were sometimes counted within a single cell, or given another
## separate cell if observed, because of this, I have edited the original excel and 
## uploaded it here for simplicity 
MammalsNorthSlope <- read_excel("C:/LochranzaData/MammalsNorthSlope.xlsx")
View(MammalsNorthSlope)

## Plotting Species Abundance on North Slope by Species Scientific Name
ggplot(MammalsNorthSlope, aes(x = scientificName, y = totalQuantity, fill = scientificName)) +
  geom_col(position = "dodge", colour = "white") +
  labs(x = "Scientific Name", y = "Count of Species") +
  scale_x_discrete(labels = c("C. elaphus","M. meles", "Ovis sp.","S. vulgaris")) +
  theme_linedraw()+
  ggtitle("Species Abundance of Mammals on North Slope")

####
####

## Due to similar issues in counting actual total number of species, data was subsetted in excel before 
## being imported into rStudio
## This subsetting consisted of deleting all columns except those pertaining to species, and what slopes 
## they were found on

## uploading Species X Slope dataset
MammalsRichness <- read_excel("C:/LochranzaData/MammalsRichness.xlsx")
View(MammalsRichness)

## Combined Species Abundance per slope graph ** not in report**
ggplot(MammalsRichness, aes(x = scientificName, y = totalCount, fill = eventID)) +
  geom_col(position = "dodge", colour = "white") +
  labs(x = "Scientific Name", y = "Count of Species") +
  scale_x_discrete(labels = c("C. elaphus","M. meles", "Ovis sp.","S. vulgaris")) +
  theme_linedraw()+
  ggtitle("Species Abundance of Mammals on North And South Slope")


####
####

##Species Richness for Mammals on North and South Slopes

## As shown by the 'mRichness' table, the North Slope has 4 mammal species
## (C.elaphus, M. Meles, Ovis sp., S.vulgaris), while the south slope
## has 3 species (C.elaphus, Ovis sp., S.vulgaris)

## For simplicity I will create a new data frame with these totals as well as
## their respective location

## Location Vector
Slope <- c("North", "South")

## Species Vector
TotalSpecies <- c(4, 3)

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
  ggtitle("Species Richness of Mammals on North And South Slope")


## End of mammal analysis


