dt<-read.table("household_power_consumption.txt",header = TRUE,na.strings = "?",stringsAsFactors = FALSE,sep=";")
dt$Date<-as.Date(dt$Date,"%d/%m/%Y")
dt1<-subset(dt,Date=="2007-02-01" | Date=="2007-02-02")
dt1$DateTime<-strptime(paste(dt1$Date, dt1$Time), format="%Y-%m-%d %H:%M:%S")

png(filename="plot4.png", width=480, height=480, units="px")
par(mfcol=c(2, 2))
with(dt1,{ plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
points(DateTime, Sub_metering_2, type="l", col="red")
points(DateTime, Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), bty="n")

plot(DateTime, Voltage, type="l", xlab="datetime")
plot(DateTime, Global_reactive_power, type="l", xlab="datetime")})
dev.off()