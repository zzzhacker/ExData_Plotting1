dt<-read.table("household_power_consumption.txt",header = TRUE,na.strings = "?",stringsAsFactors = FALSE,sep=";")
dt$Date<-as.Date(dt$Date,"%d/%m/%Y")
dt1<-subset(dt,Date=="2007-02-01" | Date=="2007-02-02")
dt1$DateTime<-strptime(paste(dt1$Date, dt1$Time), format="%Y-%m-%d %H:%M:%S")

png(filename="plot1.png", width=480, height=480, units="px")
with(dt1,hist(Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency",col="red"))
dev.off()