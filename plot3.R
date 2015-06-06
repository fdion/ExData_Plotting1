household_df <- read.csv('household_power_consumption.txt',
                         sep=';',
                         header=TRUE,
                         na.strings='?')
household_df$Date <- as.Date(household_df$Date,
                             format='%d/%m/%Y')

# Subset (we only need these two days)
df <- subset(household_df, 
             subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
df$Datetime <- as.POSIXct(paste(df$Date, df$Time))

# We'll plot to a png
png(filename='plot3.png',
    width=480,
    height=480,
    units='px',
    pointsize=12,
    bg='white')

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
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), 
       lty=c(1,1,1), # gives the legend appropriate symbols (lines)
       lwd=c(1,1,1),
       col=c('black', 'red', 'blue')) # gives the legend lines the correct color and width
dev.off()