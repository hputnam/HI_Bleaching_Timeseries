### ITS2 NCBI Upload

library(readr)
library(plyr)
library(tidyr)
library(dplyr)
library(lubridate)

raw.reads <- read.csv("Dec-July-2019-analysis/NCBI_upload/ITS2/ITS2_filelist.csv", sep = ",", header=FALSE) %>%
  dplyr::rename(seq.title = V2) %>% select(-V1)
raw.reads$host_subject_id <- gsub("_.*","", raw.reads$seq.title)

# filename1 = R1 = forward 
# filename2 = R2 = reverse
raw.reads <- raw.reads %>% 
  mutate(direction = case_when(grepl("R1", seq.title) ~ "filename1",
                               grepl("R2", seq.title) ~ "filename2")) %>%
  spread(direction, seq.title)

