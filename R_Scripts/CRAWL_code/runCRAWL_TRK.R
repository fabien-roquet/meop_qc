#Last updated Theresa Keates 8-Oct-2019. Based on code by Luis Huckstadt.
#needs crawlFilter.R in directory.

#input file requires ID, time (yyyy-mm-dd HH:mm:ss), lat, long
#set working directory

#the following packages need to be installed. First install, then load as below every time you start an R session
library(momentuHMM)
require(argosfilter)
require(crawl)
require(maps)
require(mapdata)
library(sp)
library(trip)
library(rgdal)


argosClasses = as.numeric(c("3", "2", "1", "0", "-1", "-2"))

shiftlon = function(x){
  
  ## shift all longitudes from -180,180 to cylinder starting at 0 deg and ending at some multiple of 360
  ##  deals with date-line straddlers and circumnavigators
  
  lon = x #$decimal_longitude
  cnt = c(0,which(diff(lon %% 360) < - 340),length(lon)) #should catch circumnavigators
  if(length(cnt)>2){
    cat('adjusting for global circumnavigation...')
    lon1 = (lon %% 360)-360
    newlon = c()
    for(i in 2:length(cnt)){
      newlon = c(newlon, lon1[(cnt[i-1]+1):cnt[i]]+360*(i-1))
    }
    newlon   
  } else {
    lon %% 360
  }
}

#Second part: Input the tracking data and run a simple speed filter

#Import the tracking data to first run crawl using crawlWrap


inputfiles = list.files(pattern="*_precrawl.csv")
#pattern=glob2rx("201800*precrawl.csv") if for example only want one year
#inputfiles = list.files(pattern=pattern)

for (i in 1:length(inputfiles)){
  indat<-read.csv(inputfiles[i])
  
  indat$time <- as.integer(as.POSIXct(strptime(as.character(indat$date), "%m-%d-%Y %H:%M:%S"),tz="GMT"))
  indat$GMT <- as.POSIXct(strptime(as.character(indat$date), "%m-%d-%Y %H:%M:%S"),tz="GMT")
  indat$ID <- factor(indat$id)
  
  indat <- indat[order(indat$ID,indat$time),]
  indat <- indat[c("id","GMT","date","lat","lon","lc", "ID","time")]
  #indat <- na.omit(indat)
  lt <- table(indat$ID)
  lt2 <- data.frame(lt[lt>30])
  

  #Speed filter using a conservative speed of 7 ms
  indiv <- unique(indat$ID)
  d.loc<- indat[indat$ID %in% names(lt),]
  d.loc <- d.loc[!duplicated(d.loc$GMT),] #Get rid of duplicates for each individual
  d.loc <- na.omit(d.loc)
  coordinates(d.loc)<-c("lon","lat")
  tr <- trip(d.loc, c("GMT", "ID"))
  proj4string(tr)<-CRS("+proj=longlat") # +datum=WGS84"
  
  
  tr$ok <- speedfilter(tr, max.speed = 7) #Using a conservative speed of 7/s
  tr1 <- subset(tr, tr$ok == "TRUE")
  
  print(paste(signif(nrow(tr1)/nrow(tr)*100, digits = 4),'% locations retained', sep = ""))
  
  # Re-write the speed -filtered dataset
  tr2 <- data.frame(tr1)
  
  
  # Add the error according to locations
  MultFactors = data.frame(lc=argosClasses, errX=log(c(1, 1.5, 4, 14, 5.21, 20.78)), 
                           errY=log(c(1, 1.5, 4, 14, 11.08, 31.03)))
  
  tr2 <- merge(tr2, MultFactors)
 
  #Third part: Make sure that the individual tracks are organized by individual and time, and then apply shiftlon
  #```{r}
  
  #Order by ID and time
  tr2 <- tr2[order(tr2$ID,tr2$time),]
  tr2$time <- as.numeric((tr2$GMT)) #Time as numeric
  
  #Split time by individual 
  IDs <- unique(tr2$ID)
  
  for (i in 1:length(IDs)){
    t_raw <- tr2[which(tr2$ID == IDs[i]),]
    
    #Order by time
    t_raw <- t_raw[order(t_raw$GMT),]
    
    # Modify the time vector
    t_raw$time <- (t_raw$time-min(t_raw$time))/86400
    
    #Replace the time in tr2
    tr2[which(tr2$ID == IDs[i]),] <- t_raw
    rm(t_raw)
  }
  
  #Shift the longitudes to 0 - 360
  tr2$lon <- shiftlon(tr2$lon)
  #```
  
  #Fourth part: Run Crawl for the tracking data
  init <- fixpar <- list()
  for (i in unique(tr2$ID)){
    init[[i]] <- list(a=c(subset(tr2,ID ==i)$lon[1],0,subset(tr2,ID ==i)$lat[1],0), P=diag(c(0.001,0.001,0.001,0.001)))
    fixpar[[i]] <-as.numeric(c(NA, NA, NA, NA, NA, NA))
  }
  
  #ncores is number of cores your computer has if you want to parallel process:
  
  crwFit<-crawlWrap(tr2, ncores = 6, err.model=list(x=~errX, y=~errY), 
                    coord=c("lon","lat"), Time.name="GMT", initial.state=init, 
                    fixPar=fixpar, retryFits = 30, timeStep = "1 hour", attempts = 100)
  
  

  #Save the crawl output
  csv2save <- paste(as.character(indat$id[1]),'_argos_crawl.csv',sep='')
  write.csv(crwFit$crwPredict,file=csv2save)
}

