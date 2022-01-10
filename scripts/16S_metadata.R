## Creating metadata files for 16S pipeline 
## Emma Strand created 1/7/2022 

library(plyr)
library(dplyr)
library(stringr)
library(tidyr)
library(readr)
library(ggplot2)

## 1. Sample manifest file 
## filelist.csv created during pipeline in andromeda and scp to desktop to work with in R

file_names <- read.csv("~/MyProjects/HI_Bleaching_Timeseries/data/16S/metadata/filelist.csv", header = FALSE) %>% 
  select(V2) %>% ## reading in filelist as dataframe and only the second column
  dplyr::rename(`absolute-filepath` = V2) # renaming to match the verbiage of qiime2 

sample_manifest <- file_names # creating a new df based on the original file_names df 
sample_manifest$path <- "/data/putnamlab/estrand/BleachingPairs_16S/raw_data/" #adding the absolute file path

sample_manifest <- sample_manifest %>% unite(`absolute-filepath`, path, `absolute-filepath`, sep = "") %>% # merging the two columns to complete the file path 
  mutate(direction = case_when(grepl("R1", `absolute-filepath`) ~ "forward",
                               grepl("R2", `absolute-filepath`) ~ "reverse")) # creating a new column to state whether forward or reverse based on the R value in the sequence title name 

sample_manifest$`sample-id` <- substr(sample_manifest$`absolute-filepath`, 53, 58) # creating a new column based on the sample id value

sample_manifest <- sample_manifest[, c(3, 1, 2)] # reordering the columns 

sample_manifest %>% write_csv(file = "~/MyProjects/HI_Bleaching_Timeseries/data/16S/metadata/sample_manifest.csv")

## return to terminal to secure copy paste the sample manifest file to bluewaves/andromeda folders 

## 2. Sample metadata file 
## sequencing ID and colonyID info downloaded from this google sheet: https://docs.google.com/spreadsheets/d/1lLvCp-RoRiBSGZ4NBPwi6cmZuozmfS20OJ7hBIueldU/edit#gid=0
collection.summary <- read.csv("~/MyProjects/HI_Bleaching_Timeseries/data/CollectionSummary.csv", header = TRUE) %>%
  select(-Biopsy., -Fragment.) %>% # removing 2 columns that are not needed for this metadata sheet
  dplyr::rename(Timepoint = Date)
collection.summary$Timepoint <- as.Date(collection.summary$Timepoint, format="%m/%d/%y")

sequencing.id <- read.csv("~/MyProjects/HI_Bleaching_Timeseries/data/16S/metadata//16S_sequencingID.csv", header = TRUE) %>%
  subset(Project == "ES_BP" & Type == "16S") %>% # selecting for just this 16S project's data and excluding Ariana and Kevin's 
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

metadata <- metadata %>% rename(`#SampleID` = Sample.ID)

metadata <- metadata[, c(7,1,2,3,4,5,6)] # reordering the columns 
metadata[1,1] <- "#q2:types"
metadata[1,2:7] <- "categorical" #adding types of variables for QIIME2 pipeline 

write.table(metadata, "~/MyProjects/HI_Bleaching_Timeseries/data/16S/metadata/metadata.txt", sep = "\t", row.names = FALSE, quote = FALSE)



  