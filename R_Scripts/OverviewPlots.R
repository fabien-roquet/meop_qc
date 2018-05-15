rm(list=ls())

###################
## Load libraries and custom function(s)
library(oce); library(gsw); library(mapdata); library(ggplot2); library(plotrix); library(ncdf4);

color_palette_function <- colorRampPalette(
  colors = c('blue', 'green', 'yellow', 'orange', 'red'),
  space = "Lab" # Option used when colors do not represent a quantitative scale
)

###################
## Read all NetCDF files in folder to determine all variable ranges
nc_files <- dir('/Users/xhoenner/Google Drive/MEOP-CTD/final_dataset_prof/AUSTRALIA/ct111', pattern = '*.nc', recursive = T, full.names = T)
ranges <- matrix(ncol = 17, nrow = length(nc_files))
for (ii in 1:length(nc_files)){
	test <- read.argo(nc_files[ii]);
	lon <- test@data$longitude; lat <- test@data$latitude; temp <- test@data$temperatureAdjusted; psal <- test@data$salinityAdjusted; pres <- test@data$pressureAdjusted;
	SA <- gsw_SA_from_SP(psal, pres, lon, lat); PT <- gsw_pt_from_t(SA, temp, pres, 0); sigma0 <- gsw_sigma0(SA, PT);
	
	if(length(which(is.na(temp))) == length(temp) | length(which(is.na(psal))) == length(psal)) {ranges[ii,1:16] <- NA; next;}
	last <- apply(data.frame(temp, psal),2, function(x) max(which(!is.na(x)))) ## Find pressure at which last non NA value 
	ranges[ii,1] <- range(temp, na.rm = T)[1];
	ranges[ii,2] <- range(temp, na.rm = T)[2];
	ranges[ii,3] <- range(PT, na.rm = T)[1];
	ranges[ii,4] <- range(PT, na.rm = T)[2];
	ranges[ii,5] <- range(psal, na.rm = T)[1];
	ranges[ii,6] <- range(psal, na.rm = T)[2];
	ranges[ii,7] <- range(SA, na.rm = T)[1];	
	ranges[ii,8] <- range(SA, na.rm = T)[2];
	ranges[ii,9] <- min(pres, na.rm = T);
	ranges[ii,10] <- max(pres[max(last),], na.rm = T);
	ranges[ii,11] <- range(sigma0, na.rm = T)[1];
	ranges[ii,12] <- range(sigma0, na.rm = T)[2];
	ranges[ii,13] <- range(lon, na.rm = T)[1];
	ranges[ii,14] <- range(lon, na.rm = T)[2];
	ranges[ii,15] <- range(lat, na.rm = T)[1];
	ranges[ii,16] <- range(lat, na.rm = T)[2];
	ranges[ii,17] <- length(grep('hr', gsub(".*/", "", nc_files[ii])) == 1) ## HR file? 1 if HR, 0 if LR
}

tr <- c(round(min(ranges[,1], na.rm = T),1), round(max(ranges[,2], na.rm = T),1)) + c(-.1, .1);
PTr <- c(round(min(ranges[,3], na.rm = T),1), round(max(ranges[,4], na.rm = T),1)) + c(-.1, .1);
sr <- c(round(min(ranges[,5], na.rm = T),1), round(max(ranges[,6], na.rm = T),1)) + c(-.1, .1);
SAr <- c(round(min(ranges[,7], na.rm = T),1), round(max(ranges[,8], na.rm = T),1)) + c(-.1, .1);
pr <- c(round(min(ranges[,9], na.rm = T),1), round(max(ranges[,10], na.rm = T),1));
sigr <- c(round(min(ranges[,11], na.rm = T),1), round(max(ranges[,12], na.rm = T),1)) + c(-.1, .1);
xr <- c(round(min(ranges[,13], na.rm = T),1), round(max(ranges[,14], na.rm = T),1)) + c(-.2, .2);
yr <- c(round(min(ranges[,15], na.rm = T),1), round(max(ranges[,16], na.rm = T),1)) + c(-.2, .2);

###################
## Extract data for all variables of interest and produce overview plots and sections
for (ii in 1:length(nc_files)){

	test <- read.argo(nc_files[ii]); 
	print(paste('Processing file: ', gsub(".*/", "", nc_files[ii]), sep = ''));
	ncdf <- nc_open(nc_files[ii]); 
	sl_int <- ncvar_get(ncdf, 'SCIENTIFIC_CALIB_COEFFICIENT')[,,1][2:3];
	t0 <- as.numeric(gsub('b0= ', '', gsub(".*, ", "", sl_int[1]))); t1 <- as.numeric(gsub('b1= ', '', gsub(", .*", "", sl_int[1]))); 
	s0 <- as.numeric(gsub('c0= ', '', gsub(".*, ", "", sl_int[2]))); s1 <- as.numeric(gsub('c1= ', '', gsub(", .*", "", sl_int[2])));
	
	sigS <- unique(c(ncvar_get(ncdf, 'PSAL_ADJUSTED_ERROR')))[which(is.na(unique(c(ncvar_get(ncdf, 'PSAL_ADJUSTED_ERROR')))) == F)]; 
	sigT <- unique(c(ncvar_get(ncdf, 'TEMP_ADJUSTED_ERROR')))[which(is.na(unique(c(ncvar_get(ncdf, 'TEMP_ADJUSTED_ERROR')))) == F)];
	nc_close(ncdf)
		
	## Extract values for all variables and compute sigma0
	lon <- test@data$longitude; lat <- test@data$latitude; time <- test@data$time;
	temp <- test@data$temperatureAdjusted; psal <- test@data$salinityAdjusted; pres <- test@data$pressureAdjusted;
	SA <- gsw_SA_from_SP(psal, pres, lon, lat);	PT <- gsw_pt_from_t(SA, temp, pres, 0); sigma0 <- gsw_sigma0(SA, PT);
	
	if(length(which(is.na(temp))) == length(temp) | length(which(is.na(psal))) == length(psal)) {ranges[ii,1:16] <- NA; next;}
	
	## Divide time into equal fractions
	depl_duration <- round(as.numeric(difftime(time[length(time)],time[1], units = 'days')), 0)
	cutoffs <- cut(time, breaks = c(time[1] - 60 * 60 * 24, time[1] + round(depl_duration/10 * 1:10, 0) * 60 * 60 * 24, time[length(time)] + 60 * 60 * 24))
	num_colors <- nlevels(cutoffs)
	colors <- color_palette_function(num_colors)
	
	
	###################
	## PLOTTING - Start
	
	## T-S Diagrams
	png(file = paste("/Users/xhoenner/Downloads/OverviewPlots/",gsub('_prof.nc','', gsub(".*/", "", nc_files[ii])),'_diags_TS_',ifelse(length(grep('hr1', gsub(".*/", "", nc_files[ii]))) == 1 | length(grep('lr1', gsub(".*/", "", nc_files[ii]))) == 1, 'adj', 'raw'),'.png',sep=""), width = 1200, height = 1000, units = "px", res=92, bg = "white");
	par(mar=c(4,2,1,1))
	par(fig=c(0,3,6,12)/12)
	plot(c(0, 1), c(0, 1), ann = F, bty = 'n', type = 'n', xaxt = 'n', yaxt = 'n')
	text(x = 0.5, y = 0.5, paste(gsub('_.*','', gsub(".*/", "", nc_files[ii])),'\n',
							ifelse(length(grep('hr1', gsub(".*/", "", nc_files[ii]))) == 1 | length(grep('lr1', gsub(".*/", "", nc_files[ii]))) == 1, 'adj', 'raw'), ' data\n',
							ncol(temp), ' TEMP profiles\n',
							depl_duration, ' days\n',
							'\n',
							'T1 = ', t1, ' degC/km\n',
							'T0 = ', t0, ' degC\n',
							'SigmaT= ', round(sigT,2), '\n',
							ncol(psal), ' SALT profiles\n',
							'S1 = ', s1, ' psu/km\n',
							'S0 = ', s0, ' psu\n',
							'SigmaS= ', round(sigS,2), '\n',
							sep = ''), 
	     cex = 1, col = "black")
	par(fig=c(3,6,6,12)/12)
	par(new=T)
	matplot(temp, pres, type = c('l'), lty = 'solid', col = colors[cutoffs], xlim = tr, ylim = rev(pr), ylab = '', xlab = 'IN-SITU TEMP. PROFILES', cex.axis = .8, cex.lab = .8); grid();
	par(fig=c(6,9,6,12)/12)
	par(new=T)
	matplot(psal, pres, type = c('l'), lty = 'solid', col = colors[cutoffs], xlim = sr, ylim = rev(pr), ylab = '', xlab = 'SALI. PROFILES', cex.axis = .8, cex.lab = .8); grid();
	par(fig=c(9,12,6,12)/12)
	par(new=T)
	matplot(sigma0, pres, type = c('l'), lty = 'solid', col = colors[cutoffs], xlim = sigr, ylim = rev(pr), ylab = '', xlab = 'SIGMA0 PROFILES', cex.axis = .8, cex.lab = .8); grid();
	
	par(mar=c(4,2,1,6.5), fig=c(0,6,0,6)/12)
	par(new = T)
	plot(xr, yr, ann = F, bty = 'n', type = 'n', xaxt = 'n', yaxt = 'n')
	map('worldHires', xlim = xr, ylim = yr, fill = T, col = 'dark grey', xlab = 'Longitude', ylab = 'Latitude', add = T); map.axes(cex.axis= .8);
	points(lon, lat, pch = 21, col = 'black', bg = colors[cutoffs])
	color.legend(xr[2] + .2, yr[1], xr[2] + .3, yr[2], align = 'rb', legend = as.Date(levels(cutoffs)), rect.col = colors, gradient = 'y')
	
	par(c(1,2,1,5), fig=c(6,12,0,6)/12)
	par(new=T)
	for (i in 1:ncol(temp)){
		ts <- as.ctd(psal[,i], temp[,i], pres[,i], time = time[i], longitude = lon[i], latitude = lat[i])
		if(i == 1) {
			plotTS(ts, eos = 'gsw', type = 'l', col = colors[cutoffs][i], levels = seq(sigr[1],sigr[2],.1), xlim = SAr, ylim = PTr, ylab = '', xlab = 'THETA-S PROFILES')
		} else {
			plotTS(ts, eos = 'gsw', type = 'l', col = colors[cutoffs][i], add = T)
		}
	}
	dev.off()
	
	## Section Plots
	png(file = paste("/Users/xhoenner/Downloads/OverviewPlots/",gsub('_prof.nc','', gsub(".*/", "", nc_files[ii])),'_transect_',ifelse(length(grep('hr1', gsub(".*/", "", nc_files[ii]))) == 1 | length(grep('lr1', gsub(".*/", "", nc_files[ii]))) == 1, 'adj', 'raw'),'.png',sep=""), width = 1200, height = 1000, units = "px", res=92, bg = "white");
	par(mfrow=c(2,1))
	temp_tr <- as.section(test)
	GSg <- sectionGrid(temp_tr, p=seq(0, 1000, 5))
	plot(GSg, which = 'temperature', xtype = 'time', ztype = 'image', ylim = c(rev(pr)[1], 0), xlab = '', ytype = 'pressure', showBottom = T)
	if(ranges[ii,17] == 1) {
		contour(time, GSg@data$station[[1]]@data$pressure[1:which.min(abs(GSg@data$station[[1]]@data$pressure-ranges[ii,10]))], t(temp[1:89,]), col='black', add=TRUE, levels = seq(tr[1],tr[2], .1), labcex = 1)
	} else {
		contour(time, GSg@data$station[[1]]@data$pressure[1:which.min(abs(GSg@data$station[[1]]@data$pressure-ranges[ii,10]))], t(tempadj[1:which.min(abs(GSg@data$station[[1]]@data$pressure-ranges[ii,10])),]), col='black', levels = seq(tr[1],tr[2], .1), labcex = 1, add = T)
	}
	
	plot(GSg, which = 'salinity', xtype = 'time', ztype = 'image', ylim = c(rev(pr)[1], 0), xlab = '', ytype = 'depth', showBottom = T)
	contour(time, pres[1:max(pr),1], t(psal[1:max(pr),]), col='black', add=TRUE, levels = seq(sr[1],sr[2], .1), labcex = 1)
	
	dev.off()
	## PLOTTING - End
	###################

}

tempadj <- matrix(ncol = length(time), nrow = length(GSg@data$station[[1]]@data$temperatureAdjusted))
for (j in 1:length(time)){
	tempadj[,j] <- GSg@data$station[[1]]@data$temperatureAdjusted
}