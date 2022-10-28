### WGBS NCBI Upload

library(readr)
library(plyr)
library(tidyr)
library(dplyr)
library(lubridate)

## in bluewaves 
## ls -l > WGBS_filelist.txt
## scp emma_strand@ssh3.hac.uri.edu:../../data/putnamlab/estrand/BleachingPairs_WGBS/WGBS_filelist.csv 
## /Users/emmastrand/MyProjects/HI_Bleaching_Timeseries/Dec-July-2019-analysis/NCBI_upload/WGBS/WGBS_filelist.csv

raw.reads <- read.csv("~/MyProjects/HI_Bleaching_Timeseries/Dec-July-2019-analysis/NCBI_upload/WGBS/WGBS_filelist.csv", 
                      sep = ",", header=FALSE) %>% dplyr::rename(seq.title = V1) 
raw.reads$seq.title <- gsub("^.*WGBS/","", raw.reads$seq.title)
raw.reads$host_subject_id <- gsub("_.*","", raw.reads$seq.title)
raw.reads$method <- "WGBS"
raw.reads=raw.reads[-1,]
raw.reads <- raw.reads %>%
  unite(sample_name, host_subject_id, method, remove=FALSE)

# filename1 = R1 = forward 
# filename2 = R2 = reverse
raw.reads <- raw.reads %>% 
  mutate(direction = case_when(grepl("R1", seq.title) ~ "filename1",
                               grepl("R2", seq.title) ~ "filename2")) %>%
  spread(direction, seq.title)

write_csv(file = "~/MyProjects/HI_Bleaching_Timeseries/Dec-July-2019-analysis/NCBI_upload/WGBS/NCBI-WGBS-sample-title.csv", raw.reads)

## ncftp -u subftp ftp-private.ncbi.nlm.nih.gov