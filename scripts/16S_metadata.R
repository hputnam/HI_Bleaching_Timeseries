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

sample_manifest <- sample_manifest %>% spread(direction, `absolute-filepath`) %>%
  dplyr::rename(`forward-absolute-filepath` = forward) %>%
  dplyr::rename(`reverse-absolute-filepath` = reverse)

write.table(sample_manifest, "~/MyProjects/HI_Bleaching_Timeseries/data/16S/metadata/sample_manifest.txt", sep = "\t", row.names = FALSE, quote = FALSE)

## return to terminal to secure copy paste the sample manifest file to bluewaves/andromeda folders 

## 2. Sample metadata file 
## sequencing ID and colonyID info downloaded from this google sheet: https://docs.google.com/spreadsheets/d/1lLvCp-RoRiBSGZ4NBPwi6cmZuozmfS20OJ7hBIueldU/edit#gid=0
collection.summary <- read.csv("~/MyProjects/HI_Bleaching_Timeseries/data/CollectionSummary.csv", header = TRUE) %>%
  select(-Biopsy., -Fragment.) %>% # removing 2 columns that are not needed for this metadata sheet
  dplyr::rename(Timepoint = Date)
collection.summary$Timepoint <- as.Date(collection.summary$Timepoint, format="%m/%d/%y")

sequencing.id <- read.csv("~/MyProjects/HI_Bleaching_Timeseries/data/16S/metadata/16S_sequencingID.csv", header = TRUE) %>%
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

categories <- c("#q2:types", "categorical", "categorical", "categorical", "categorical", 
                "categorical", "categorical") # QIIME2 needs each column to be specified 

metadata <- rbind(metadata, categories)
metadata <- metadata[c(41,1:40),]

write.table(metadata, "~/MyProjects/HI_Bleaching_Timeseries/data/16S/metadata/metadata.txt", sep = "\t", row.names = FALSE, quote = FALSE)

# Denoising statistics 
## comparing 3 options for denoising parameters 

denoise_260230 <- read.table("~/MyProjects/HI_Bleaching_Timeseries/data/16S/processed_data/denoising-stats_260230.tsv", sep="\t", header = TRUE)
denoise_270240 <- read.table("~/MyProjects/HI_Bleaching_Timeseries/data/16S/processed_data/denoising-stats_270240.tsv", sep="\t", header = TRUE)
denoise_280240 <- read.table("~/MyProjects/HI_Bleaching_Timeseries/data/16S/processed_data/denoising-stats_280240.tsv", sep="\t", header = TRUE)

denoise_260230$parameter <- "260forward_230reverse"
denoise_270240$parameter <- "270forward_240reverse"
denoise_280240$parameter <- "280forward_240reverse"

denoising.stats <- union(denoise_260230, denoise_270240) %>% union(denoise_280240)

denoise.reads <- denoising.stats[, c(1,2,3,5,6,8,10)] # reordering columns to make it easier to plot
denoise.percent <- denoising.stats[, c(1,4,7,9,10)] # reordering columns to make it easier to plot

denoise.reads <- denoise.reads %>% gather(statistic, value, 2:6) # aggregates the three variables we are interested in to make it easier to plot 
denoise.percent <- denoise.percent %>% gather(statistic, value, 2:4) # aggregates the three variables we are interested in to make it easier to plot 

denoise.reads$statistic <- factor(denoise.reads$statistic, levels=c("input","filtered","denoised","merged","non.chimeric"))
denoise.percent$statistic <- factor(denoise.percent$statistic, levels=c("percentage.of.input.passed.filter", "percentage.of.input.merged",
                                                                        "percentage.of.input.non.chimeric"))

percent <- ggplot(data = denoise.percent, aes(x = parameter, y = value, group = parameter, color = parameter)) +
  theme_classic() + geom_boxplot() +
  facet_grid(~statistic, scales = "free") +
  theme(legend.position = "none") +
  ylab("# reads") + 
  theme(axis.text.x = element_text(angle = 60, vjust = 1.2, hjust = 1.3)); denoise.plot #Set the text angle

reads <- ggplot(data = denoise.reads, aes(x = parameter, y = value, group = parameter, color = parameter)) +
  theme_classic() + geom_boxplot() +
  facet_grid(~statistic, scales = "free") +
  theme(legend.position = "none") +
  ylab("# reads") + 
  theme(axis.text.x = element_text(angle = 60, vjust = 1.2, hjust = 1.3)); denoise.plot #Set the text angle

percent
reads

ggsave(file="~/MyProjects/HI_Bleaching_Timeseries/data/16S/processed_data/denoising-percent.png", percent, width = 11, height = 6, units = c("in"))
ggsave(file="~/MyProjects/HI_Bleaching_Timeseries/data/16S/processed_data/denoising-reads.png", reads, width = 11, height = 6, units = c("in"))

  