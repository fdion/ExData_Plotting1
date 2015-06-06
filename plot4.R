household_df <- read.csv('household_power_consumption.txt',
                         sep=';',
                         header=TRUE,
                         na.strings='?')
household_df$Date <- as.Date(household_df$Date,
                             format='%d/%m/%Y')  # converting to YYYY-MM-DD
df <- subset(household_df, 
             subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
df$Datetime <- as.POSIXct(paste(df$Date, df$Time))

# We'll plot to a png
png(filename='plot4.png',
    width=480,
    height=480,
    units='px',
    pointsize=12,
    bg='white')

# Layout the plots 2 x 2
par(mfrow=c(2,2))

# First
plot(df$Global_active_power~df$Datetime, 
     type='l',
     xlab='', 
     ylab='Global Active Power',
     col='Black')

# Second
plot(df$Voltage~df$Datetime,
     type='l',
     xlab='datetime', 
     ylab='Voltage',
     col='Black')

# Third
plot(df$Sub_metering_1~df$Datetime,
     type='l',
     xlab='', 
     ylab='Energy sub metering',
     col='Black')
lines(df$Sub_metering_2~df$Datetime,
      col='red')
lines(df$Sub_metering_3~df$Datetime,
      col='blue')
legend(x='topright',
       border='black',
       bty='n',
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), 
       lty=c(1,1,1), # gives the legend appropriate symbols (lines)
       lwd=c(1,1,1),
       col=c('black', 'red', 'blue')) # gives the legend lines the correct color and width

# Fourth
plot(df$Global_reactive_power~df$Datetime,
     type='l',
     xlab='datetime', 
     ylab='Global_reactive_power',
     col='Black')

dev.off()