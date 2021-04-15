library(ggplot2)

frag3 <- read.csv("m3.csv", stringsAsFactors=FALSE, fileEncoding="latin1")
ggplot(frag3, aes(x = Delta.T..min., y = Oxygen)) +
  geom_point()
p <- subset(frag3, Delta.T..min. > 10 & Delta.T..min. < 20)
r <- subset(frag3, Delta.T..min. > 35 & Delta.T..min. < 45)
lm(p$Oxygen ~ p$Delta.T..min.) # 1.201
lm(r$Oxygen ~ r$Delta.T..min.) # -0.4519

frag4 <- read.csv("m4.csv", stringsAsFactors=FALSE, fileEncoding="latin1")
ggplot(frag4, aes(x = Delta.T..min., y = Oxygen)) +
  geom_point()
p <- subset(frag4, Delta.T..min. > 10 & Delta.T..min. < 20)
r <- subset(frag4, Delta.T..min. > 35 & Delta.T..min. < 45)
lm(p$Oxygen ~ p$Delta.T..min.) # 0.9848
lm(r$Oxygen ~ r$Delta.T..min.) # -0.4043

frag11 <- read.csv("m11.csv", stringsAsFactors=FALSE, fileEncoding="latin1")
ggplot(frag11, aes(x = Delta.T..min., y = Oxygen)) +
  geom_point()
p <- subset(frag11, Delta.T..min. > 10 & Delta.T..min. < 20)
r <- subset(frag11, Delta.T..min. > 35 & Delta.T..min. < 45)
lm(p$Oxygen ~ p$Delta.T..min.) # 1.036
lm(r$Oxygen ~ r$Delta.T..min.) # -0.5038

frag12 <- read.csv("m12.csv", stringsAsFactors=FALSE, fileEncoding="latin1")
ggplot(frag12, aes(x = Delta.T..min., y = Oxygen)) +
  geom_point()
p <- subset(frag12, Delta.T..min. > 10 & Delta.T..min. < 20)
r <- subset(frag12, Delta.T..min. > 35 & Delta.T..min. < 45)
lm(p$Oxygen ~ p$Delta.T..min.) # 1.37
lm(r$Oxygen ~ r$Delta.T..min.) # -0.6365

frag19 <- read.csv("m19.csv", stringsAsFactors=FALSE, fileEncoding="latin1")
ggplot(frag19, aes(x = Delta.T..min., y = Oxygen)) +
  geom_point()
p <- subset(frag19, Delta.T..min. > 10 & Delta.T..min. < 20)
r <- subset(frag19, Delta.T..min. > 35 & Delta.T..min. < 45)
lm(p$Oxygen ~ p$Delta.T..min.) # 1.47
lm(r$Oxygen ~ r$Delta.T..min.) # -0.6418

frag20 <- read.csv("m20.csv", stringsAsFactors=FALSE, fileEncoding="latin1")
ggplot(frag20, aes(x = Delta.T..min., y = Oxygen)) +
  geom_point()
p <- subset(frag20, Delta.T..min. > 10 & Delta.T..min. < 20)
r <- subset(frag20, Delta.T..min. > 35 & Delta.T..min. < 45)
lm(p$Oxygen ~ p$Delta.T..min.) # 1.62
lm(r$Oxygen ~ r$Delta.T..min.) # -0.598

frag26 <- read.csv("p26.csv", stringsAsFactors=FALSE, fileEncoding="latin1")
ggplot(frag26, aes(x = Delta.T..min., y = Oxygen)) +
  geom_point()
p <- subset(frag26, Delta.T..min. > 10 & Delta.T..min. < 20)
r <- subset(frag26, Delta.T..min. > 30 & Delta.T..min. < 40)
lm(p$Oxygen ~ p$Delta.T..min.) # 0.5616
lm(r$Oxygen ~ r$Delta.T..min.) # -0.4245

frag27 <- read.csv("p27.csv", stringsAsFactors=FALSE, fileEncoding="latin1")
ggplot(frag27, aes(x = Delta.T..min., y = Oxygen)) +
  geom_point()
p <- subset(frag27, Delta.T..min. > 10 & Delta.T..min. < 20)
r <- subset(frag27, Delta.T..min. > 30 & Delta.T..min. < 40)
lm(p$Oxygen ~ p$Delta.T..min.) # 1.292
lm(r$Oxygen ~ r$Delta.T..min.) # -0,491

frag41 <- read.csv("p41.csv", stringsAsFactors=FALSE, fileEncoding="latin1")
ggplot(frag41, aes(x = Delta.T..min., y = Oxygen)) +
  geom_point()
p <- subset(frag41, Delta.T..min. > 10 & Delta.T..min. < 20)
r <- subset(frag41, Delta.T..min. > 35 & Delta.T..min. < 45)
lm(p$Oxygen ~ p$Delta.T..min.) # 0.7959
lm(r$Oxygen ~ r$Delta.T..min.) # -0.581

frag42 <- read.csv("p42.csv", stringsAsFactors=FALSE, fileEncoding="latin1")
ggplot(frag42, aes(x = Delta.T..min., y = Oxygen)) +
  geom_point()
p <- subset(frag42, Delta.T..min. > 10 & Delta.T..min. < 20)
r <- subset(frag42, Delta.T..min. > 35 & Delta.T..min. < 45)
lm(p$Oxygen ~ p$Delta.T..min.) # 0.04159
lm(r$Oxygen ~ r$Delta.T..min.) # 0.0456 hmm...

frag43 <- read.csv("p43.csv", stringsAsFactors=FALSE, fileEncoding="latin1")
ggplot(frag43, aes(x = Delta.T..min., y = Oxygen)) +
  geom_point()
p <- subset(frag43, Delta.T..min. > 60 & Delta.T..min. < 70) #???
r <- subset(frag43, Delta.T..min. > 85 & Delta.T..min. < 95) #???
lm(p$Oxygen ~ p$Delta.T..min.) # 0.5077
lm(r$Oxygen ~ r$Delta.T..min.) # -0.2742

frag44 <- read.csv("p44.csv", stringsAsFactors=FALSE, fileEncoding="latin1")
ggplot(frag44, aes(x = Delta.T..min., y = Oxygen)) +
  geom_point()
p <- subset(frag44, Delta.T..min. > 60 & Delta.T..min. < 70)
r <- subset(frag44, Delta.T..min. > 85 & Delta.T..min. < 95)
lm(p$Oxygen ~ p$Delta.T..min.) # 0.7196
lm(r$Oxygen ~ r$Delta.T..min.) # -0.4813

frag45 <- read.csv("p45.csv", stringsAsFactors=FALSE, fileEncoding="latin1")
ggplot(frag45, aes(x = Delta.T..min., y = Oxygen)) + # what is going on here..?
  geom_point()
p <- subset(frag45, Delta.T..min. > 10 & Delta.T..min. < 20)
r <- subset(frag45, Delta.T..min. > 30 & Delta.T..min. < 40)
lm(p$Oxygen ~ p$Delta.T..min.) # 0.7988
lm(r$Oxygen ~ r$Delta.T..min.) # -0.3276

frag46 <- read.csv("p46.csv", stringsAsFactors=FALSE, fileEncoding="latin1")
ggplot(frag46, aes(x = Delta.T..min., y = Oxygen)) +
  geom_point()
p <- subset(frag46, Delta.T..min. > 10 & Delta.T..min. < 20)
r <- subset(frag46, Delta.T..min. > 35 & Delta.T..min. < 45)
lm(p$Oxygen ~ p$Delta.T..min.) # 0.01874
lm(r$Oxygen ~ r$Delta.T..min.) # -4.27e-04 

frag201 <- read.csv("m201.csv", stringsAsFactors=FALSE, fileEncoding="latin1")
ggplot(frag201, aes(x = Delta.T..min., y = Oxygen)) +
  geom_point()
p <- subset(frag201, Delta.T..min. > 10 & Delta.T..min. < 20)
r <- subset(frag201, Delta.T..min. > 30 & Delta.T..min. < 40)
lm(p$Oxygen ~ p$Delta.T..min.) # 2.615
lm(r$Oxygen ~ r$Delta.T..min.) # -1.169

frag202 <- read.csv("m202.csv", stringsAsFactors=FALSE, fileEncoding="latin1")
ggplot(frag202, aes(x = Delta.T..min., y = Oxygen)) +
  geom_point()
p <- subset(frag202, Delta.T..min. > 10 & Delta.T..min. < 20)
r <- subset(frag202, Delta.T..min. > 35 & Delta.T..min. < 45)
lm(p$Oxygen ~ p$Delta.T..min.) # 1.49
lm(r$Oxygen ~ r$Delta.T..min.) # -0.5734

frag203 <- read.csv("m203.csv", stringsAsFactors=FALSE, fileEncoding="latin1")
ggplot(frag203, aes(x = Delta.T..min., y = Oxygen)) +
  geom_point()
p <- subset(frag203, Delta.T..min. > 10 & Delta.T..min. < 20)
r <- subset(frag203, Delta.T..min. > 35 & Delta.T..min. < 45)
lm(p$Oxygen ~ p$Delta.T..min.) # 1.559
lm(r$Oxygen ~ r$Delta.T..min.) # -0.5813

frag204 <- read.csv("m204.csv", stringsAsFactors=FALSE, fileEncoding="latin1")
ggplot(frag204, aes(x = Delta.T..min., y = Oxygen)) +
  geom_point()
p <- subset(frag204, Delta.T..min. > 10 & Delta.T..min. < 20)
r <- subset(frag204, Delta.T..min. > 35 & Delta.T..min. < 45)
lm(p$Oxygen ~ p$Delta.T..min.) # 1.268
lm(r$Oxygen ~ r$Delta.T..min.) # -0.5747

frag209 <- read.csv("m209.csv", stringsAsFactors=FALSE, fileEncoding="latin1")
ggplot(frag209, aes(x = Delta.T..min., y = Oxygen)) +
  geom_point()
p <- subset(frag209, Delta.T..min. > 10 & Delta.T..min. < 20)
r <- subset(frag209, Delta.T..min. > 35 & Delta.T..min. < 45)
lm(p$Oxygen ~ p$Delta.T..min.) # 0.7826
lm(r$Oxygen ~ r$Delta.T..min.) # -0.297

frag210 <- read.csv("m210.csv", stringsAsFactors=FALSE, fileEncoding="latin1")
ggplot(frag210, aes(x = Delta.T..min., y = Oxygen)) +
  geom_point()
p <- subset(frag210, Delta.T..min. > 10 & Delta.T..min. < 20)
r <- subset(frag210, Delta.T..min. > 35 & Delta.T..min. < 45)
lm(p$Oxygen ~ p$Delta.T..min.) # 1.328
lm(r$Oxygen ~ r$Delta.T..min.) # -0.5306

frag211 <- read.csv("m211.csv", stringsAsFactors=FALSE, fileEncoding="latin1")
ggplot(frag211, aes(x = Delta.T..min., y = Oxygen)) +
  geom_point()
p <- subset(frag211, Delta.T..min. > 10 & Delta.T..min. < 20)
r <- subset(frag211, Delta.T..min. > 35 & Delta.T..min. < 45)
lm(p$Oxygen ~ p$Delta.T..min.) # 0.6895
lm(r$Oxygen ~ r$Delta.T..min.) # -0.2503

frag212 <- read.csv("m212.csv", stringsAsFactors=FALSE, fileEncoding="latin1")
ggplot(frag212, aes(x = Delta.T..min., y = Oxygen)) +
  geom_point()
p <- subset(frag212, Delta.T..min. > 10 & Delta.T..min. < 20)
r <- subset(frag212, Delta.T..min. > 35 & Delta.T..min. < 45)
lm(p$Oxygen ~ p$Delta.T..min.) # 1.009
lm(r$Oxygen ~ r$Delta.T..min.) # -0.6652

frag217 <- read.csv("m217.csv", stringsAsFactors=FALSE, fileEncoding="latin1")
ggplot(frag217, aes(x = Delta.T..min., y = Oxygen)) +
  geom_point()
p <- subset(frag217, Delta.T..min. > 10 & Delta.T..min. < 20)
r <- subset(frag217, Delta.T..min. > 35 & Delta.T..min. < 45)
lm(p$Oxygen ~ p$Delta.T..min.) # 1.302
lm(r$Oxygen ~ r$Delta.T..min.) # -0.8753

frag218 <- read.csv("m218.csv", stringsAsFactors=FALSE, fileEncoding="latin1")
ggplot(frag218, aes(x = Delta.T..min., y = Oxygen)) +
  geom_point()
p <- subset(frag218, Delta.T..min. > 10 & Delta.T..min. < 20)
r <- subset(frag218, Delta.T..min. > 35 & Delta.T..min. < 45)
lm(p$Oxygen ~ p$Delta.T..min.) # 1.296
lm(r$Oxygen ~ r$Delta.T..min.) # -0.861

frag219 <- read.csv("m219.csv", stringsAsFactors=FALSE, fileEncoding="latin1")
ggplot(frag219, aes(x = Delta.T..min., y = Oxygen)) +
  geom_point()
p <- subset(frag219, Delta.T..min. > 10 & Delta.T..min. < 20)
r <- subset(frag219, Delta.T..min. > 35 & Delta.T..min. < 45)
lm(p$Oxygen ~ p$Delta.T..min.) # 1.175
lm(r$Oxygen ~ r$Delta.T..min.) # -0.7462

frag220 <- read.csv("m220.csv", stringsAsFactors=FALSE, fileEncoding="latin1")
ggplot(frag220, aes(x = Delta.T..min., y = Oxygen)) +
  geom_point()
p <- subset(frag220, Delta.T..min. > 10 & Delta.T..min. < 20)
r <- subset(frag220, Delta.T..min. > 35 & Delta.T..min. < 45)
lm(p$Oxygen ~ p$Delta.T..min.) # 1.68
lm(r$Oxygen ~ r$Delta.T..min.) # -1.163

frag221 <- read.csv("m221.csv", stringsAsFactors=FALSE, fileEncoding="latin1")
ggplot(frag221, aes(x = Delta.T..min., y = Oxygen)) +
  geom_point()
p <- subset(frag221, Delta.T..min. > 10 & Delta.T..min. < 20)
r <- subset(frag221, Delta.T..min. > 35 & Delta.T..min. < 45)
lm(p$Oxygen ~ p$Delta.T..min.) # 0.8578
lm(r$Oxygen ~ r$Delta.T..min.) # -0.5565

frag222 <- read.csv("m222.csv", stringsAsFactors=FALSE, fileEncoding="latin1")
ggplot(frag222, aes(x = Delta.T..min., y = Oxygen)) +
  geom_point()
p <- subset(frag222, Delta.T..min. > 10 & Delta.T..min. < 20)
r <- subset(frag222, Delta.T..min. > 35 & Delta.T..min. < 45)
lm(p$Oxygen ~ p$Delta.T..min.) # 0.7419
lm(r$Oxygen ~ r$Delta.T..min.) # -0.6111

frag229 <- read.csv("m229.csv", stringsAsFactors=FALSE, fileEncoding="latin1")
ggplot(frag229, aes(x = Delta.T..min., y = Oxygen)) +
  geom_point()
p <- subset(frag229, Delta.T..min. > 10 & Delta.T..min. < 20)
r <- subset(frag229, Delta.T..min. > 35 & Delta.T..min. < 45)
lm(p$Oxygen ~ p$Delta.T..min.) # 0.7468
lm(r$Oxygen ~ r$Delta.T..min.) # -0.4044

frag230 <- read.csv("m230.csv", stringsAsFactors=FALSE, fileEncoding="latin1")
ggplot(frag230, aes(x = Delta.T..min., y = Oxygen)) +
  geom_point()
p <- subset(frag230, Delta.T..min. > 10 & Delta.T..min. < 20)
r <- subset(frag230, Delta.T..min. > 35 & Delta.T..min. < 45)
lm(p$Oxygen ~ p$Delta.T..min.) # 1.526
lm(r$Oxygen ~ r$Delta.T..min.) # -0.7193

frag237 <- read.csv("m237.csv", stringsAsFactors=FALSE, fileEncoding="latin1")
ggplot(frag237, aes(x = Delta.T..min., y = Oxygen)) +
  geom_point()
p <- subset(frag237, Delta.T..min. > 10 & Delta.T..min. < 20)
r <- subset(frag237, Delta.T..min. > 35 & Delta.T..min. < 45)
lm(p$Oxygen ~ p$Delta.T..min.) # 1.607
lm(r$Oxygen ~ r$Delta.T..min.) # -0.9465

frag238 <- read.csv("m238.csv", stringsAsFactors=FALSE, fileEncoding="latin1")
ggplot(frag238, aes(x = Delta.T..min., y = Oxygen)) +
  geom_point()
p <- subset(frag238, Delta.T..min. > 10 & Delta.T..min. < 20)
r <- subset(frag238, Delta.T..min. > 35 & Delta.T..min. < 45)
lm(p$Oxygen ~ p$Delta.T..min.) # 0.8433
lm(r$Oxygen ~ r$Delta.T..min.) # -0.5654

frag239 <- read.csv("p239.csv", stringsAsFactors=FALSE, fileEncoding="latin1")
ggplot(frag239, aes(x = Delta.T..min., y = Oxygen)) +
  geom_point()
p <- subset(frag239, Delta.T..min. > 10 & Delta.T..min. < 20)
r <- subset(frag239, Delta.T..min. > 35 & Delta.T..min. < 45)
lm(p$Oxygen ~ p$Delta.T..min.) # 1.009
lm(r$Oxygen ~ r$Delta.T..min.) # -0.5749

frag240 <- read.csv("p240.csv", stringsAsFactors=FALSE, fileEncoding="latin1")
ggplot(frag240, aes(x = Delta.T..min., y = Oxygen)) +
  geom_point()
p <- subset(frag240, Delta.T..min. > 10 & Delta.T..min. < 20)
r <- subset(frag240, Delta.T..min. > 35 & Delta.T..min. < 45)
lm(p$Oxygen ~ p$Delta.T..min.) # 0.4197
lm(r$Oxygen ~ r$Delta.T..min.) # -0.246

frag243 <- read.csv("p243.csv", stringsAsFactors=FALSE, fileEncoding="latin1")
ggplot(frag243, aes(x = Delta.T..min., y = Oxygen)) +
  geom_point()
p <- subset(frag243, Delta.T..min. > 10 & Delta.T..min. < 20)
r <- subset(frag243, Delta.T..min. > 35 & Delta.T..min. < 45)
lm(p$Oxygen ~ p$Delta.T..min.) # 0.9355
lm(r$Oxygen ~ r$Delta.T..min.) # -0.6756

frag244 <- read.csv("p244.csv", stringsAsFactors=FALSE, fileEncoding="latin1")
ggplot(frag244, aes(x = Delta.T..min., y = Oxygen)) +
  geom_point()
p <- subset(frag244, Delta.T..min. > 10 & Delta.T..min. < 20)
r <- subset(frag244, Delta.T..min. > 35 & Delta.T..min. < 45)
lm(p$Oxygen ~ p$Delta.T..min.) # 1.341
lm(r$Oxygen ~ r$Delta.T..min.) # -0.6472

frag247 <- read.csv("p247.csv", stringsAsFactors=FALSE, fileEncoding="latin1")
ggplot(frag247, aes(x = Delta.T..min., y = Oxygen)) +
  geom_point()
p <- subset(frag247, Delta.T..min. > 10 & Delta.T..min. < 20)
r <- subset(frag247, Delta.T..min. > 35 & Delta.T..min. < 45)
lm(p$Oxygen ~ p$Delta.T..min.) # 1.195
lm(r$Oxygen ~ r$Delta.T..min.) # -0.5203

frag248 <- read.csv("p248.csv", stringsAsFactors=FALSE, fileEncoding="latin1")
ggplot(frag248, aes(x = Delta.T..min., y = Oxygen)) +
  geom_point()
p <- subset(frag248, Delta.T..min. > 10 & Delta.T..min. < 20)
r <- subset(frag248, Delta.T..min. > 35 & Delta.T..min. < 45)
lm(p$Oxygen ~ p$Delta.T..min.) # 0.9526
lm(r$Oxygen ~ r$Delta.T..min.) # -0.5803

###################
# alternative adaptation of ross's script but needs takes some dataframe formatting - results are nearly identical as above
# Load libraries
library(changepoint)
library(stringr)
library(car)
library(pastecs)
library(plyr)
library(dplyr)
options(stringsAsFactors = F)

# Build functions
remove_outliers <- function(x, na.rm = T, ...) {
  # Removes data more than 1.5 times the interquartile range above the 75th percentile
  # or below the 25th percentile
  qnt <- quantile(x, probs=c(.25, .75), na.rm = na.rm, ...)
  H <- 1.5 * IQR(x, na.rm = na.rm)
  y <- x
  y[x < (qnt[1] - H)] <- NA
  y[x > (qnt[2] + H)] <- NA
  y
}
O2analyze <- function(samples=list(), intervals=NULL, trim=F, pdf=F) {
  # Plots O2 data time series, automatically detects intervals based on changepoints in mean 
  #and variance or uses user-defined intervals, performs linear regression within each 
  # interval, and uses regression diagnostics to prune data and calculate more reliable rates. 
  # Pruning is turned on by default, and can be turned off by trim=T. Set pdf=F to save a pdf 
  # of the plot. Function returns a data frame containing slopes of regressions in each 
  # interval. Sample_id is a character name of a data frame in the global environment 
  # containing O2 data (output of O2calc)
  results <- matrix(NA, nrow=length(samples), ncol=2)
  for (i in 1:length(samples)) {
    sample.name <- names(samples)[i]
    print(sample.name)
    data <- samples[[i]]
    if (nrow(data)==0) next
    # Transform time data to runtime in hours
    #data$Time <- as.POSIXct(data$Time)
    data$RunTime <- sapply(data$Time, function(x) difftime(x, data$Time[1],  units="mins"))
    # Trim leading outliers in oxygen data
    #if (abs(diff(data$O2)[1]) > 1) data <- data[-1, ]
    #data <- data[which(data$O2 %in% 
    # c(na.trim(remove_outliers(remove_outliers(data$O2[1:round(nrow(data)/4)])), sides="left"), 
    # data$O2[round(nrow(data)/4)+1:length(data$O2)])), ]
    # Plot data
    plot(data$RunTime, data$O2, cex=0.75, main=sample.name, xaxt="n", xlab="Run time (mins)", ylab="O2 (µmol/L)")
    axis(side=1, at=seq(0, last(data$RunTime), 5), las=2)
    if (is.null(intervals)) {
      # If intervals are not provided, automatically define them by identifying changepoints 
      # in data
      # Changepoint in mean sign of difference (pos. or neg. slope)
      cpm <- cpt.mean(sign(diff(data$O2)), class=F, method="BinSeg", Q=6)
      cpm <- data[cpm, "RunTime"]
      # Changepoint in variance
      cpv <- cpt.var(diff(data$O2), Q=6, method="BinSeg", class=F)
      cpv <- data[cpv, "RunTime"]
      # Inflection point in spline
      spl <- smooth.spline(data$RunTime, data$O2, spar=min(c(1, 0.001 * nrow(data) + 0.60)))
      #lines(spl, col="black", lwd=1)
      infl <- data$RunTime[which(diff(sign(diff(spl$y)))!=0)+1]
      # Changepoints in mean and variance (BinSeg)
      cptmv <- cpt.meanvar(diff(data$O2), method="BinSeg", Q=6, class=F)
      cptmv <- data[cptmv, "RunTime"]
      # Changepoints in mean and variance (PELT)
      cptpelt <- cpt.meanvar(diff(data$O2), method="PELT", class=F, penalty="Asymptotic", pen.value=0.001)
      cptpelt <- data[cptpelt, "RunTime"]
      # Combine all changepoints
      pts <- c(cpm, cpv, cptmv, cptpelt, infl)
      # Remove changepoints that are very close to beginning or end
      pts <- pts[which(pts - first(data$RunTime) > 2.4 & pts - last(data$RunTime) < -2.4)]
      # Identify peaks in changepoints kernel density (=where most changepoints occur)
      if (length(pts) > 1) {
        den <- tryCatch({
          density(pts, bw="SJ", adjust=2-length(pts)*0.03)
        }, error=function(e) {
          density(pts, bw="nrd0")
        })
        pks <- den$x[diff(den$y < quantile(den$y, 0.95))!=0]
        peaks <- den$x[which(diff(sign(diff(den$y)))<0)]
        buffpeaks <- c(peaks-1, peaks+1)
        # Define intervals for regression based on highest two peaks
        int <- sort(c(first(data$RunTime), buffpeaks, last(data$RunTime)))
        top2 <- order(diff(int), decreasing=T)[1:2]
        ints <- t(data.frame(list(c(int[top2[1]], int[top2[1]+1]), c(int[top2[2]], int[top2[2]+1]))))
        ints <- ints[order(ints[,1]), ]
      } else {
        ints <- t(data.frame(range(data$RunTime)))
      }
    } else {
      # If intervals are provided as an argument to the function, use those instead
      ints <- t(data.frame(intervals, check.names=F))
    }
    # Draw dotted lines separating intervals
    #abline(v=unique(as.vector(intervals)), lty=2)
    # Fit regressions within each interval
    rates <- vector(length=nrow(ints))
    for (x in 1:nrow(ints)) {
      int1 <- ints[x, ]  # select interval
      data1 <- data[which(data$RunTime > int1[1] & data$RunTime <= int1[2]), ]  # select data in interval
      data1 <- data1[which(data1$O2 %in% remove_outliers(remove_outliers(data1$O2))), ] # remove any extreme points within interval
      mod1 <- lm(data1$O2 ~ data1$RunTime)  # Fit linear regression
      # Remove outliers and high cook's distance
      selected <- which(cooks.distance(mod1) < (2/nrow(mod1$model))
                        & !is.na(remove_outliers(remove_outliers(remove_outliers(mod1$resid))))
                        & ecdf(abs(residuals(mod1)))(abs(residuals(mod1))) < 0.8)    #####
      # Refit model after removing outliers
      mod1 <- lm(data1[selected, "O2"] ~ data1[selected, "RunTime"])
      # If trim=T, autotrim regression fit window
      if(trim==T){
        uresid <- T
        # test for heteroscedasticity, return true or false
        uresid <- ncvTest(mod1)$p < 0.999
        # condition in last interval (=LEDR), if u-shape means rate is decreasing, ignore. 
        # (may bias toward LEDR decreasing with time). if u-shape means rate is increasing, 
        # probably due to probe lag so exclude earlier data to remove probe lag effect.
        #if (x==nrow(ints) && identical(diff(sign(smooth.spline(mod1$resid)$y))[which(diff(sign(smooth.spline(mod1$resid, spar=min(c(1, 0.001 * nrow(data1) + 0.65)))$y))!=0)], c(-2,2))) {
        #  uresid=F
        #}
        n=0
        # remove data points from beginning until heteroscedasticity is eliminated
        while (uresid==T) {
          n=n+1
          mod1 <- lm(data1[selected[-(1:n)], "O2"] ~ data1[selected[-(1:n)], "RunTime"])
          #selected <- which(cooks.distance(mod1) < (4/nrow(mod1$model)) & !is.na(remove_outliers(mod1$resid)))    #####
          #mod1 <- lm(mod1$model[selected, 1] ~ mod1$model[selected, 2]) 
          uresid <- ncvTest(mod1)$p < 0.999
          if (nrow(mod1$model) < nrow(data1) / 2) uresid=F
        }
      }
      rate <- coef(mod1)[[2]]
      # Plot filled points to show the data points used in the regression
      points(mod1$model[,2], mod1$model[,1], pch=21, bg="black", cex=0.75)
      # Plot regression fits as red lines
      lines(mod1$model[,2], predict(mod1, mod1$model), lwd=2, col="red")
      # Add text showing regression slopes to each interval
      text(median(int1), par("usr")[3], round(rate, 3), pos=3)
      rates[x] <- rate
    }
    # Save pdf file of plot if pdf=F
    if (pdf==TRUE) dev.copy2pdf(file=file.path("output", paste0(sample.name, ".pdf")))
    # generate data frame of slopes for each regression
    results[i,] <- rates
  }
  print(results)
  return(results)
}

###################
# Import sample data
sample.data.2 <- read.csv("samples.csv")
# Convert date-timeStarted
sample.data.2 <- within(sample.data.2, {
  TimeStarted <- as.POSIXct(paste(Date, TimeStarted),
                            format="%m/%e/%y %H:%M")
})
# Separate each channel for accessing timestamps for splitting samples
channels.2 <- split(sample.data.2, f=sample.data.2$Channel)

####################
# Import O2 data
o2.files.2 <- list.files(path="raw", pattern="*.csv", full.names=TRUE)
o2.data.2 <- do.call("rbind", lapply(o2.files.2, read.csv, header = TRUE, fileEncoding="latin1"))
#o2.data <- droplevels(na.omit(o2.data))  # Omit rows with NAs and drop unused factor levels
# Convert date-time and name column with O2 values "O2"
o2.data.2 <- within(o2.data.2, {
  Time <- as.POSIXct(Date, format = "%d/%m/%y %H:%M:%S")
  Channel <- as.integer(substring(Sensor, 7, 8))
  O2 <- Oxygen
})

# Separate data into channels
o2.channel.2 <- split(o2.data.2, f=o2.data.2$Channel)

# Separate each channel into samples using TimeStarted values from sample.data
o2.samples.2 <- lapply(o2.channel.2, function(x) {
  setNames(split(x, f=cut(x$Time, breaks=c(channels.2[[unique(x$Channel)]]$TimeStarted, last(x$Time)))),
           nm=channels.2[[unique(x$Channel)]]$FragID)
})
o2.samples.2 <- unlist(o2.samples.2, recursive=FALSE)

# Rename each list element from Channel.FragID to just FragID
names(o2.samples.2) <- unlist(lapply(strsplit(names(o2.samples.2), split=".", fixed=TRUE), "[", 2))

####################
# Batch run analysis on all samples
results <- O2analyze(samples=o2.samples.2, trim=TRUE, pdf=F)

# Name results rows as FragID
rownames(results) <- do.call("rbind", channels.2)$FragID

###################
# Save results as .csv
write.csv(results, file="output/results.csv")