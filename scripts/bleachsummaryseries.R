# load packages
library(ggplot2)
library(patchwork)
library(dplyr)
library(rnoaa)

rm(list = ls())

# get NOAA temp
start_dates <- seq(as.Date("2015-01-01"), as.Date("2021-03-01"), by = "month") 
end_dates <- seq(as.Date("2015-01-31"), as.Date("2021-03-31"), by = "month") 
gettemp <- function(begin, end) {
  coops_search(station_name = 1612480, begin_date = gsub("-", "", begin),
               end_date = gsub("-", "", end), product = "water_temperature")
}
temps <- Map(gettemp, start_dates, end_dates)
#unlist(temps[[1]][1]) # extract sensor metadata
finaltemps <- bind_rows(lapply(temps, "[[", "data"))[,1:2]
finaltemps$Date <- as.Date(finaltemps$t) 
finaltemps$Time <- format(as.POSIXct(finaltemps$t), format = "%H:%M") 

# max temp ~ date
alltempmax <- aggregate(finaltemps$v, by = list(finaltemps$Date), FUN = max, na.rm = T)
names(alltempmax) <- c("Date", "MaxTemp")
alltempmaxfinal <- subset(alltempmax, MaxTemp != "-Inf")

# heatmap
temp <- ggplot(alltempmaxfinal) +
  geom_tile(aes(x = Date, y = 1, fill = MaxTemp)) +
  scale_fill_gradient2(low= "dodgerblue3", mid = "white", high="red", midpoint = 27.5) +
  scale_x_date(date_labels = "%Y", date_breaks = "1 year", limits = as.Date(c("2015-05-01", "2021-03-31")), expand = c(0, 0)) +
  labs(x = "Date", y = "", fill = "Temp (°C)") +
  theme(aspect.ratio = 0.1,
        panel.background = element_blank(),
        axis.title.y = element_blank(), axis.text.y = element_blank(), axis.ticks.y = element_blank())
temp

# import bleaching scores
bleach <- read.csv("allyearsBleachScores.csv")

# format bleaching scores
bleach$ColonyID <- as.character(bleach$ColonyID)
bleach$Date <- as.Date(bleach$Date, format = "%m/%d/%y")
bleach$Bleach <- ifelse(bleach$Bleach == "Bleach", "Susceptible", "Resistant")
bleach$group <- ifelse(bleach$Date <= "2017-12-31", "1", "2")
bleachfinal <- subset(bleach, Score != "N/A")
bleachfinal$Score <- as.numeric(bleachfinal$Score)

# time series
scores <- ggplot(bleachfinal, aes(x = Date, y = Score, color = Bleach)) +
  stat_summary(aes(group = Bleach), fun = mean, geom = "point", size = 1) +
  stat_summary(aes(group = interaction(Bleach, group)), fun = mean, geom = "line", size = 0.6) +
  stat_summary(aes(group = Bleach), fun.data = mean_se, geom = "errorbar", size = 0.6, width = 20) +
  scale_x_date(date_labels = "%Y", date_breaks = "1 year", limits = as.Date(c("2015-05-01", "2021-03-31")), expand = c(0, 0)) +
  scale_color_manual(values = c("Susceptible" = "gray", "Resistant" = "black")) +
  labs(y = "Bleaching Score", color = "Bleaching Susceptibility") +
  theme(aspect.ratio = 0.4,
        panel.background = element_blank(), panel.border = element_rect(fill = NA),
        strip.background = element_blank(), strip.text = element_text(face = "italic"),
        legend.key = element_blank(),
        axis.text.x = element_blank(), axis.title.x = element_blank(), axis.ticks.x = element_blank()) +
  guides(colour = guide_legend(override.aes = list(shape = NA))) +
  facet_grid(Species ~ .)
scores

# organize panels
png("bleachseriessummary.png", height = 150, width = 200, units = "mm", res = 500)
scores/temp 
dev.off()

# calculate n for each date ~ species 
bleach %>% 
  filter(!is.na(Score)) %>%
  count(Date, Species, Bleach)

# import phys data
phys <- read.csv("PhysData.csv")
phys$Bleach <- ifelse(phys$Bleach == "Bleach", "Susceptible", "Resistant")
phys$Date <- as.Date(phys$Date, format = "%m/%d/%y")

# pam
baseline <- data.frame(Species = c("Montipora capitata", "Porites compressa"), value = c(0.638, 0.604))

png("PAMseries.png", height = 150, width = 150, units = "mm", res = 500)
pam <- ggplot(phys, aes(x = Date, y = Yield, color = Bleach)) +
  stat_summary(aes(group = Bleach), fun = mean, geom = "point", size = 1) +
  stat_summary(aes(group = Bleach), fun = mean, geom = "line", size = 0.6) +
  stat_summary(aes(group = Bleach), fun.data = mean_se, geom = "errorbar", size = 0.6, width = 10) +
  scale_x_date(date_labels = "%b %y", date_breaks = "3 months") +
  scale_color_manual(values = c("Susceptible" = "gray", "Resistant" = "black")) +
  geom_hline(data = baseline, aes(yintercept = value), linetype = "dashed") +
  labs(y = expression(F["v"]/F["m"]), color = "Bleaching Susceptibility") +
  theme(aspect.ratio = 0.7,
        panel.background = element_blank(), panel.border = element_rect(fill = NA),
        strip.background = element_blank(), strip.text = element_text(face = "italic"),
        legend.key = element_blank()) +
  guides(colour = guide_legend(override.aes = list(shape = NA))) +
  facet_grid(Species ~ .)
pam
dev.off()

# resp
png("GPseries.png", height = 150, width = 150, units = "mm", res = 500)
gp <- ggplot(phys, aes(x = Date, y = GPumolmin, color = Bleach)) +
  stat_summary(aes(group = Bleach), fun = mean, geom = "point", size = 1) +
  stat_summary(aes(group = Bleach), fun = mean, geom = "line", size = 0.6) +
  stat_summary(aes(group = Bleach), fun.data = mean_se, geom = "errorbar", size = 0.6, width = 10) +
  scale_x_date(date_labels = "%b %y", date_breaks = "3 months") +
  scale_color_manual(values = c("Susceptible" = "gray", "Resistant" = "black")) +
  labs(y = expression(atop("Gross Photosynthesis", paste((µmol~O["2"]~min^-1)))), color = "Bleaching Susceptibility") +
  theme(aspect.ratio = 0.7,
        panel.background = element_blank(), panel.border = element_rect(fill = NA),
        strip.background = element_blank(), strip.text = element_text(face = "italic"),
        legend.key = element_blank()) +
  guides(colour = guide_legend(override.aes = list(shape = NA))) +
  facet_grid(Species ~ .)
gp
dev.off()

png("Rseries.png", height = 150, width = 150, units = "mm", res = 500)
r <- ggplot(phys, aes(x = Date, y = abs(Rumolmin), color = Bleach)) +
  stat_summary(aes(group = Bleach), fun = mean, geom = "point", size = 1) +
  stat_summary(aes(group = Bleach), fun = mean, geom = "line", size = 0.6) +
  stat_summary(aes(group = Bleach), fun.data = mean_se, geom = "errorbar", size = 0.6, width = 10) +
  scale_x_date(date_labels = "%b %y", date_breaks = "3 months") +
  scale_color_manual(values = c("Susceptible" = "gray", "Resistant" = "black")) +
  labs(y = expression(atop("Respiration", paste((µmol~O["2"]~min^-1)))), color = "Bleaching Susceptibility") +
  theme(aspect.ratio = 0.7,
        panel.background = element_blank(), panel.border = element_rect(fill = NA),
        strip.background = element_blank(), strip.text = element_text(face = "italic"),
        legend.key = element_blank()) +
  guides(colour = guide_legend(override.aes = list(shape = NA))) +
  facet_grid(Species ~ .)
r
dev.off()
