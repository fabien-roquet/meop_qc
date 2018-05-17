rm(list=ls())
Sys.setenv(TZ = "UTC") ## Required as otherwise R loads the file below in the computer's local time zone
load('~/Downloads/MEOP_Workshop_StockholmMay2018/recent_CTD_Casts_DF.Rda')

dat <- recent_CTD_Casts_DF
dat <- dat[which(is.na(dat$N_TEMP) == F),]

print(paste('Processing ', nrow(dat), ' real-time profiles from ', length(unique(dat$PTT)), ' tags', sep = ''))

## Transform linear data format to have one measurement per row

for (i in 1:nrow(dat)){
	sel <- dat[i,]
	data <- data.frame(matrix(ncol = 8, nrow = sel$N_TEMP));
	data[,1] <- rep(sel$PTT, sel$N_TEMP)
	data[,2] <- rep(sel$END_DATE, sel$N_TEMP)
	data[,3] <- rep(sel$LON, sel$N_TEMP)
	data[,4] <- rep(sel$LAT, sel$N_TEMP)
	data[,5] <- as.numeric(strsplit(sel$TEMP_DBAR, ',')[[1]])
	data[,6] <- as.numeric(strsplit(sel$TEMP_VALS, ',')[[1]])
	data[,7] <- as.numeric(strsplit(sel$SAL_DBAR, ',')[[1]])
	data[,8] <- as.numeric(strsplit(sel$SAL_VALS, ',')[[1]])
	
	if(i == 1) dat.all <- data else dat.all <- rbind(dat.all, data)
}
colnames(dat.all) <- c('PTT', 'END_DATE','LON','LAT','TEMP_DBAR','TEMP_VALS','SAL_DBAR','SAL_VALS'); # length(which(dat.all$TEMP_DBAR != dat.all$SAL_DBAR)) == 0 in this case, not sure though whether TEMP_DBAR is always equal to SAL_DBAR?
print(paste(length(which(is.na(dat.all$SAL_DBAR))), ' observations with temperature but no salinity data', sep = ''))
dat.all <- dat.all[order(dat.all$PTT,dat.all$END_DATE, dat.all$TEMP_DBAR),]
dat.all <- dat.all[which(duplicated(data.frame(dat.all$PTT, dat.all$END_DATE, dat.all$TEMP_DBAR)) == F),] ## Remove duplicates, if any

## Map profile locations
xr <- range(dat.all$LON) + c(-1, 1); yr <- range(dat.all$LAT) + c(-1, 1)
library(mapdata)
map('world',xlim = c(-180, 180), ylim = c(-80, 80), fill = T, col = 'dark grey')
points(dat.all$LON, dat.all$LAT, pch = 3, col = 'red')


## Process PTTs 
ptts <- unique(dat.all$PTT)
for (i in 1:length(unique(ptts))){
	
	sel <- dat.all[which(dat.all$PTT == ptts[i]),]
	profile_dates <- unique(sel$END_DATE)
	for (j in 1:length(unique(profile_dates))){
		
		sel_p <- sel[which(as.character(sel$END_DATE) == as.character(profile_dates[j])),]
		
	}
	
}