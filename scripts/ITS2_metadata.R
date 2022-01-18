## ITS2 Metadata file 
## notebook post to pipeline: https://github.com/emmastrand/EmmaStrand_Notebook/blob/master/_posts/2022-01-14-KBay-Bleaching-Pairs-ITS2-Analysis-Pipeline.md

library(plyr)
library(dplyr)
library(stringr)
library(tidyr)
library(readr)
library(ggplot2)

## creating file names for fastq path information
file_names <- read.csv("~/MyProjects/HI_Bleaching_Timeseries/data/ITS2/metadata/filenames.csv", header = FALSE) %>%
  dplyr::rename(seq.file = V1)

file_names <- file_names %>% 
  mutate(direction = case_when(grepl("R1", seq.file) ~ "forward",
                               grepl("R2", seq.file) ~ "reverse")) # creating a new column to state whether forward or reverse based on the R value in the sequence title name

file_names$Sample.ID <- substr(file_names$seq.file, 1, 6) # creating a new column based on the sample id value

## creating metadata file from field information
collection.summary <- read.csv("~/MyProjects/HI_Bleaching_Timeseries/data/CollectionSummary.csv", header = TRUE) %>%
  select(-Biopsy., -Fragment.) %>% # removing 2 columns that are not needed for this metadata sheet
  dplyr::rename(Timepoint = Date)
collection.summary$Timepoint <- as.Date(collection.summary$Timepoint, format="%m/%d/%y")

sequencing.id <- read.csv("~/MyProjects/HI_Bleaching_Timeseries/data/16S/metadata/16S_sequencingID.csv", header = TRUE) %>%
  subset(Project == "ES_BP" & Type == "ITS2") %>% # selecting for just this 16S project's data and excluding Ariana and Kevin's 
  dplyr::rename(ColonyID = Coral.ID) %>%
  select(Sample.ID, ColonyID, Timepoint) %>%
  mutate(Timepoint = case_when(
    Timepoint == "2019-07-20" ~ "2019-07-19",
    Timepoint == "2019-12-04" ~ "2019-12-04"))

sequencing.id$ColonyID <- sub(".","", sequencing.id$ColonyID)
sequencing.id$ColonyID <- sub(".","", sequencing.id$ColonyID) # do this twice to get rid of both the M and "-" symbol

collection.summary <- collection.summary %>% unite(Group, ColonyID, Timepoint, sep = " ")
sequencing.id <- sequencing.id %>% unite(Group, ColonyID, Timepoint, sep = " ")

metadata <- full_join(collection.summary, sequencing.id, by = "Group") %>% na.omit() %>%
  separate(Group, c("ColonyID", "Year", "Month", "Day")) %>%
  unite(Timepoint, Year, Month, sep = "-") %>% unite(Timepoint, Timepoint, Day, sep = "-") 

## expanding metadata to include fastq path information 

metadata <- full_join(metadata, file_names, by = "Sample.ID")
metadata <- metadata %>% spread(direction, seq.file)

metadata %>% write_csv(file = "~/MyProjects/HI_Bleaching_Timeseries/data/ITS2/metadata/metadata.csv")

