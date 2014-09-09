# Read CSV into a data frame
data <- read.csv("hw1_data.csv")

# Q11 - column names of the data set
names(data)

# Q12
print(head(data, 2))

#Q13 - # of observations in the data frame
nrow(data)

# Q14
print(tail(data, 2))

# Q15 - value of Ozone in the 47th row
data$Ozone[47]

# Q16 - How many missing values are in the Ozone column of this data frame?
missing <- sapply(data, function (x) sum(is.na(x)))
missing_ozone <- missing["Ozone"]

# Q17 - Mean of the Ozone column in the data set (exclude missing values)
mean(data$Ozone, na.rm = TRUE)

# Q18 - Extract the subset of rows of the data frame where Ozone
# values are above 31 and Temp values are above 90.
# What is the mean of Solar.R in this subset?
good <- complete.cases(data)
sub <- data[good, ]
mean(sub[sub$Ozone > 31 & sub$Temp > 90, 1:ncol(sub)]$Solar.R)

# Q19 - What is the mean of "Temp" when "Month" is equal to 6?
mean(sub[sub$Month == 6, 1:ncol(sub)]$Temp)

# Q20 - What was the maximum ozone value in the month of May (i.e. Month = 5)?
max(sub[sub$Month == 5, 1:ncol(sub)]$Ozone)
