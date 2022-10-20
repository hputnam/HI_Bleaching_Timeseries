Chlorophyll Analysis
================
Author: Emma Strand; <emma_strand@uri.edu>

Load packages.

``` r
rm(list=ls())

library(plyr)
library(dplyr)
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:plyr':
    ## 
    ##     arrange, count, desc, failwith, id, mutate, rename, summarise,
    ##     summarize

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
library(readxl)
library(tidyr)
library(tidyverse)
```

    ## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.1 ──

    ## ✔ ggplot2 3.3.6     ✔ purrr   0.3.4
    ## ✔ tibble  3.1.8     ✔ stringr 1.4.0
    ## ✔ readr   2.1.2     ✔ forcats 0.5.1

    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::arrange()   masks plyr::arrange()
    ## ✖ purrr::compact()   masks plyr::compact()
    ## ✖ dplyr::count()     masks plyr::count()
    ## ✖ dplyr::failwith()  masks plyr::failwith()
    ## ✖ dplyr::filter()    masks stats::filter()
    ## ✖ dplyr::id()        masks plyr::id()
    ## ✖ dplyr::lag()       masks stats::lag()
    ## ✖ dplyr::mutate()    masks plyr::mutate()
    ## ✖ dplyr::rename()    masks plyr::rename()
    ## ✖ dplyr::summarise() masks plyr::summarise()
    ## ✖ dplyr::summarize() masks plyr::summarize()

``` r
library(ggpubr)
```

    ## 
    ## Attaching package: 'ggpubr'

    ## The following object is masked from 'package:plyr':
    ## 
    ##     mutate

``` r
library(purrr)
library(Rmisc)
```

    ## Loading required package: lattice

``` r
library(lme4)
```

    ## Loading required package: Matrix

    ## 
    ## Attaching package: 'Matrix'

    ## The following objects are masked from 'package:tidyr':
    ## 
    ##     expand, pack, unpack

``` r
library(car)
```

    ## Loading required package: carData

    ## 
    ## Attaching package: 'car'

    ## The following object is masked from 'package:purrr':
    ## 
    ##     some

    ## The following object is masked from 'package:dplyr':
    ## 
    ##     recode

``` r
library(sjPlot)
library(ggstatsplot)
```

    ## You can cite this package as:
    ##      Patil, I. (2021). Visualizations with statistical details: The 'ggstatsplot' approach.
    ##      Journal of Open Source Software, 6(61), 3167, doi:10.21105/joss.03167

``` r
library(emmeans)
library(Rmisc)
```

## Load in data and calculate cholorophyll concentrations

``` r
meta <- read_excel("Dec-July-2019-analysis/data/Physiology-URI-labwork.xlsx", sheet = "Master-ID-List")
meta$ColonyID <- as.character(meta$ColonyID)

cells <- read_csv("Dec-July-2019-analysis/data/cell_counts.csv") %>%
  select(ColonyID, Date, cells, haemo.cells.cm2, SA)
```

    ## Rows: 37 Columns: 9
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## chr  (1): Bleach
    ## dbl  (7): ColonyID, volume (mL), count_mean, cells.mL, cells, haemo.cells.cm...
    ## date (1): Date
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

``` r
cells$ColonyID <- as.character(cells$ColonyID)

meta <- full_join(meta, cells, by = c("ColonyID", "Date")) 

platemap <- read_excel("Dec-July-2019-analysis/data/Physiology-URI-labwork.xlsx", 
                   sheet = "Chlorophyll", col_types = c("text", "text", "date"))
```

    ## Warning: Expecting date in C2 / R2C3: got 'NA'

    ## Warning: Expecting date in C9 / R9C3: got 'NA'

    ## Warning: Expecting date in C10 / R10C3: got 'NA'

    ## Warning: Expecting date in C17 / R17C3: got 'NA'

    ## Warning: Expecting date in C25 / R25C3: got 'NA'

    ## Warning: Expecting date in C33 / R33C3: got 'NA'

    ## Warning: Expecting date in C40 / R40C3: got 'NA'

    ## Warning: Expecting date in C41 / R41C3: got 'NA'

    ## Warning: Expecting date in C48 / R48C3: got 'NA'

    ## Warning: Expecting date in C49 / R49C3: got 'NA'

    ## Warning: Expecting date in C56 / R56C3: got 'NA'

    ## Warning: Expecting date in C57 / R57C3: got 'NA'

    ## Warning: Expecting date in C64 / R64C3: got 'NA'

    ## Warning: Expecting date in C65 / R65C3: got 'NA'

    ## Warning: Expecting date in C72 / R72C3: got 'NA'

    ## Warning: Expecting date in C73 / R73C3: got 'NA'

    ## Warning: Expecting date in C80 / R80C3: got 'NA'

    ## Warning: Expecting date in C81 / R81C3: got 'NA'

    ## Warning: Expecting date in C88 / R88C3: got 'NA'

    ## Warning: Expecting date in C89 / R89C3: got 'NA'

    ## Warning: Expecting date in C96 / R96C3: got 'NA'

    ## Warning: Expecting date in C97 / R97C3: got 'NA'

``` r
platemap$ColonyID[platemap$ColonyID == "NA"] <- NA

raw_data <-
  list.files(path = 'Dec-July-2019-analysis/data/chlorophyll',pattern = ".csv", full.names = TRUE) %>% 
  # list files in directory following a particular pattern
  set_names(.) %>% # get the column names
  map_dfr(read.csv, .id = "file.ID") %>% # join all files together in one data frame by file ID
  select(Well, Chl.663, Chl.750, Chl.630) %>%
  gather(absorbance, value, 2:4) %>%
  filter(!is.na(value)) %>%
  spread(absorbance, value)

df <- full_join(raw_data, platemap, by = "Well") %>%
  filter(!is.na(ColonyID)) %>%
  group_by(ColonyID, Date) %>%
  mutate(mean630 = mean(Chl.630),
         mean663 = mean(Chl.663),
         mean750 = mean(Chl.750)) %>%
  ungroup(ColonyID, Date) %>%
  select(ColonyID, Date, mean630, mean663, mean750) %>%
  distinct() %>%
# adjust sample values by subtracting the blank value 
# calculate chla and chlc2 values based on equations from Jeffrey and Humphrey 1975
  mutate(blank750 = `mean750`[ColonyID == "Blank"],
         adj630 = mean630 - blank750,
         adj663 = mean663 - blank750,
         chla.ug.ml = (11.43 * adj663) - (0.64 * adj630),
         chlc2.ug.ml = (27.09 * adj630) - (3.63 * adj663)) %>%
  select(ColonyID, Date, chla.ug.ml, chlc2.ug.ml) %>%
  filter(!is.na(Date)) 

df <- full_join(df, meta, by = c("ColonyID", "Date")) %>%
  mutate(chla.ug.cm2 = (chla.ug.ml * `volume (mL)`) / SA,
         chlc2.ug.cm2 = (chlc2.ug.ml * `volume (mL)`) / SA,
         chla.ug.cells = (chla.ug.ml * `volume (mL)`) / cells,
         chlc2.ug.cells = (chlc2.ug.ml * `volume (mL)`) / cells) %>%
  gather(measurement, value, 13:18) %>%
  filter(!is.na(value)) %>%
  subset(measurement == "chla.ug.cells" | measurement == "chla.ug.cm2" | measurement == "haemo.cells.cm2")

df$Date <- as.character(df$Date)

df2 <- summarySE(df, measurevar = c("value"), groupvars = c("Date", "Bleach", "measurement"))
```

## Figures

``` r
df %>%
  ggplot(., aes(x=Date, y=value, color=Bleach)) + 
  theme_classic() + xlab("") +
  geom_boxplot() + geom_point() +
  facet_grid(measurement~Bleach, scales = "free")
```

![](chlorophyll_files/figure-gfm/unnamed-chunk-3-1.png)<!-- -->

``` r
df2 %>%
  ggplot(., aes(x=Date, y=value, color=Bleach)) + 
  geom_errorbar(aes(ymin=value-se, ymax=value+se), size=0.8, width=.1) +
  theme_classic() + xlab("") + geom_point(size=4) +
  geom_line(aes(group = Bleach), size=0.8) +
  facet_wrap(~measurement, scales = "free")
```

![](chlorophyll_files/figure-gfm/unnamed-chunk-3-2.png)<!-- -->

``` r
df %>%
  subset(!Pair == "2" & !Pair == "3" & !Pair == "9") %>%
  subset(!measurement == "chla.ug.cm2") %>%
  ggplot(., aes(x=Date, y=value, color=Bleach)) +
  theme_classic() + xlab("") +
  geom_point() + geom_line(aes(group = ColonyID), size=0.8) +
  facet_grid(measurement~Pair, scales = "free")
```

![](chlorophyll_files/figure-gfm/unnamed-chunk-3-3.png)<!-- -->
