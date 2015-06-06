# Assumes the data was downloaded and unzipped

household_df <- read.csv('household_power_consumption.txt',
                         sep=';',
                         header=TRUE,
                         na.strings='?')
household_df$Date <- as.Date(household_df$Date,
                             format='%d/%m/%Y')  # converting from string to Date

# Subset (we only need these two days)
df <- subset(household_df, 
             subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# We'll plot to a png
png(filename='plot1.png',
    width=480,
    height=480,
    units='px',
    pointsize=12,
    bg='white')

hist(df$Global_active_power, 
     main='Global Active Power', 
     xlab='Global Active Power (kilowatts)', 
     ylab='Frequency',
     col='Red')

dev.off()