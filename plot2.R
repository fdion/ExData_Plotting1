# Assumes the data was downloaded and unzipped
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
png(filename='plot2.png',
    width=480,
    height=480,
    units='px',
    pointsize=12,
    bg='white')

plot(df$Global_active_power~df$Datetime,
     type='l',
     xlab='', 
     ylab='Global Active Power (kilowatts)',
     col='Black')

dev.off()