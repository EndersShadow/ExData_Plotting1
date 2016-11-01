#Added a boxplot to the graphic as it adds an understanding of center, variability of the data, and a better 
#look at the outliers.
hpc<-read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subhbc<-hpc[hpc$Date %in% c("1/2/2007","2/2/2007") ,]
gap <- as.numeric(subhbc$Global_active_power)
datetime<-strptime(paste(subhbc$Date, subhbc$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("plot1.png", width=480, height=480)
nf <- layout(mat = matrix(c(1,2),2,1, byrow=TRUE),  height = c(1,3))
par(mar=c(5.1, 5.1, 1.1, 2.1))
boxplot(gap,horizontal = TRUE, outline = TRUE, ylim=c(0,8), frame = F, col = "green", width = 10 )
hist(gap, col="blue", main="Global Active Power", xlim = c(0,8), xlab="Global Active Power (kilowatts)")
dev.off()