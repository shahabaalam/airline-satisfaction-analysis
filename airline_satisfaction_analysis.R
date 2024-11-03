library(ggplot2)
library(corrplot)
library(leaps)
library(dplyr)
library(readr)
library(tidyverse)

#### Data Preparation
# Read the dataset
data <- read_csv('Airline_customer_satisfaction.csv')
dim(data)

# Display the first few rows
head(data)

# Check the structure of the data
str(data)

# Summary of the dataset
summary(data)

# Check for missing values
missing_values <- sapply(data, function(x) sum(is.na(x)))
print(missing_values)

# Remove rows with NA values
data.na <- na.omit(data)
any(is.na(data.na))
dim(data.na)

# Check for missing values after cleaning
missing_values <- sapply(data.na, function(x) sum(is.na(x)))
print(missing_values)

# Print column names to check the exact names
colnames(data.na)

# Ensure 'Departure Delay in Minutes' is numeric
data.na$`Departure Delay in Minutes` <- as.numeric(data.na$`Departure Delay in Minutes`)

#### Exploratory Data Analysis (EDA)
# Boxplots for strictly numerical variables
par(mfrow = c(2, 2))

# Age boxplot and summary statistics
boxplot(data.na$Age, xlab = "Age", col = "turquoise")
summary(data.na$Age)
print(paste("Standard Deviation of Age:", sd(data.na$Age, na.rm = TRUE)))

# Flight Distance boxplot and summary statistics
boxplot(data.na$`Flight Distance`, xlab = "Flight Distance", col = "turquoise")
summary(data.na$`Flight Distance`)
print(paste("Standard Deviation of Flight Distance:", sd(data.na$`Flight Distance`, na.rm = TRUE)))

# Departure Delay in Minutes boxplot and summary statistics
boxplot(data.na$`Departure Delay in Minutes`, xlab = "Departure Delay in Minutes", col = "turquoise")
summary(data.na$`Departure Delay in Minutes`)
print(paste("Standard Deviation of Departure Delay in Minutes:", sd(data.na$`Departure Delay in Minutes`, na.rm = TRUE)))

# Arrival Delay in Minutes boxplot and summary statistics
boxplot(data.na$`Arrival Delay in Minutes`, xlab = "Arrival Delay in Minutes", col = "turquoise")
summary(data.na$`Arrival Delay in Minutes`)
print(paste("Standard Deviation of Arrival Delay in Minutes:", sd(data.na$`Arrival Delay in Minutes`, na.rm = TRUE)))

#### Converting and Summarizing Likert Scale Variables
# Subset the dataset for numerical variables with Likert scale
var.likert <- data.na[, 7:20]

# Convert relevant columns to factors
var.likert$`Inflight wifi service` <- as.factor(var.likert$`Inflight wifi service`)
var.likert$`Departure/Arrival time convenient` <- as.factor(var.likert$`Departure/Arrival time convenient`)
var.likert$`Ease of Online booking` <- as.factor(var.likert$`Ease of Online booking`)
var.likert$`Gate location` <- as.factor(var.likert$`Gate location`)
var.likert$`Food and drink` <- as.factor(var.likert$`Food and drink`)
var.likert$`Online boarding` <- as.factor(var.likert$`Online boarding`)
var.likert$`Seat comfort` <- as.factor(var.likert$`Seat comfort`)
var.likert$`Leg room service` <- as.factor(var.likert$`Leg room service`)
var.likert$`Inflight entertainment` <- as.factor(var.likert$`Inflight entertainment`)
var.likert$`On-board service` <- as.factor(var.likert$`On-board service`)
var.likert$`Checkin service` <- as.factor(var.likert$`Checkin service`)
var.likert$`Cleanliness` <- as.factor(var.likert$`Cleanliness`)
var.likert$`Baggage handling` <- as.factor(var.likert$`Baggage handling`)
var.likert$`Online support` <- as.factor(var.likert$`Online support`)

# Add level "0" to 'Baggage handling' and set levels
levels(var.likert$`Baggage handling`) <- c(levels(var.likert$`Baggage handling`), "0")
var.likert$`Baggage handling` <- factor(var.likert$`Baggage handling`, levels = c("0", "1", "2", "3", "4", "5"))

# Check the structure of the updated data
str(var.likert)

#### Descriptive analysis of the numerical variables with Likert scale
# Summary, standard deviation, proportion table, and bar plot for each variable

# Seat comfort
summary(data.na$`Seat comfort`)
sd(data.na$`Seat comfort`)
round(prop.table(table(data.na$`Seat comfort`)), 3)
barplot(table(var.likert$`Seat comfort`), main = "Seat Comfort", ylim = c(0, 40000), col = c("white", "azure", "cyan", "lightblue", "blue", "darkblue"))

# Departure/Arrival time convenient
summary(data.na$`Departure/Arrival time convenient`)
sd(data.na$`Departure/Arrival time convenient`)
round(prop.table(table(data.na$`Departure/Arrival time convenient`)), 3)
barplot(table(var.likert$`Departure/Arrival time convenient`), main = "Departure/Arrival Time Convenient", ylim = c(0, 40000), col = c("white", "azure", "cyan", "lightblue", "blue", "darkblue"))

# Food and drink
summary(data.na$`Food and drink`)
sd(data.na$`Food and drink`)
round(prop.table(table(data.na$`Food and drink`)), 3)
barplot(table(var.likert$`Food and drink`), main = "Food and Drink", ylim = c(0, 40000), col = c("white", "azure", "cyan", "lightblue", "blue", "darkblue"))

# Gate location
summary(data.na$`Gate location`)
sd(data.na$`Gate location`)
round(prop.table(table(data.na$`Gate location`)), 3)
barplot(table(var.likert$`Gate location`), main = "Gate Location", ylim = c(0, 40000), col = c("white", "azure", "cyan", "lightblue", "blue", "darkblue"))

# Inflight wifi service
summary(data.na$`Inflight wifi service`)
sd(data.na$`Inflight wifi service`)
round(prop.table(table(data.na$`Inflight wifi service`)), 3)
barplot(table(var.likert$`Inflight wifi service`), main = "Inflight Wifi Service", ylim = c(0, 40000), col = c("white", "azure", "cyan", "lightblue", "blue", "darkblue"))

# Inflight entertainment
summary(data.na$`Inflight entertainment`)
sd(data.na$`Inflight entertainment`)
round(prop.table(table(data.na$`Inflight entertainment`)), 3)
barplot(table(var.likert$`Inflight entertainment`), main = "Inflight Entertainment", ylim = c(0, 40000), col = c("white", "azure", "cyan", "lightblue", "blue", "darkblue"))

# Online support
summary(data.na$`Online support`)
sd(data.na$`Online support`)
round(prop.table(table(data.na$`Online support`)), 3)
barplot(table(var.likert$`Online support`), main = "Online Support", ylim = c(0, 40000), col = c("white", "azure", "cyan", "lightblue", "blue", "darkblue"))

# Ease of Online booking
summary(data.na$`Ease of Online booking`)
sd(data.na$`Ease of Online booking`)
round(prop.table(table(data.na$`Ease of Online booking`)), 3)
barplot(table(var.likert$`Ease of Online booking`), main = "Ease of Online Booking", ylim = c(0, 40000), col = c("white", "azure", "cyan", "lightblue", "blue", "darkblue"))

# On-board service
summary(data.na$`On-board service`)
sd(data.na$`On-board service`)
round(prop.table(table(data.na$`On-board service`)), 3)
barplot(table(var.likert$`On-board service`), main = "On-board Service", ylim = c(0, 40000), col = c("white", "azure", "cyan", "lightblue", "blue", "darkblue"))

# Leg room service
summary(data.na$`Leg room service`)
sd(data.na$`Leg room service`)
round(prop.table(table(data.na$`Leg room service`)), 3)
barplot(table(var.likert$`Leg room service`), main = "Leg Room Service", ylim = c(0, 40000), col = c("white", "azure", "cyan", "lightblue", "blue", "darkblue"))

# Baggage handling
summary(data.na$`Baggage handling`)
sd(data.na$`Baggage handling`)
round(prop.table(table(data.na$`Baggage handling`)), 3)
barplot(table(var.likert$`Baggage handling`), main = "Baggage Handling", ylim = c(0, 40000), col = c("white", "azure", "cyan", "lightblue", "blue", "darkblue"))

# Checkin service
summary(data.na$`Checkin service`)
sd(data.na$`Checkin service`)
round(prop.table(table(data.na$`Checkin service`)), 3)
barplot(table(var.likert$`Checkin service`), main = "Checkin Service", ylim = c(0, 40000), col = c("white", "azure", "cyan", "lightblue", "blue", "darkblue"))

# Cleanliness
summary(data.na$`Cleanliness`)
sd(data.na$`Cleanliness`)
round(prop.table(table(data.na$`Cleanliness`)), 3)
barplot(table(var.likert$`Cleanliness`), main = "Cleanliness", ylim = c(0, 40000), col = c("white", "azure", "cyan", "lightblue", "blue", "darkblue"))

# Online boarding
summary(data.na$`Online boarding`)
sd(data.na$`Online boarding`)
round(prop.table(table(data.na$`Online boarding`)), 3)
barplot(table(var.likert$`Online boarding`), main = "Online Boarding", ylim = c(0, 40000), col = c("white", "azure", "cyan", "lightblue", "blue", "darkblue"))

#### Correlation Analysis
# Load necessary library
library(corrplot)

# Subset the strictly numerical variables
var.numeriche <- data.na[, c("Age", "Flight Distance", "Departure Delay in Minutes", "Arrival Delay in Minutes")]

# Ensure that the numerical columns are properly formatted as numeric types
var.numeriche$`Departure Delay in Minutes` <- as.numeric(var.numeriche$`Departure Delay in Minutes`)
var.numeriche$`Arrival Delay in Minutes` <- as.numeric(var.numeriche$`Arrival Delay in Minutes`)

# Calculate the correlation matrix
corr_matrix <- cor(var.numeriche, use = "complete.obs")

# Ensure a clean plot window
plot.new()
dev.off()

# Plot the correlation matrix with adjusted text size
corrplot.mixed(corr_matrix, upper = "ellipse", tl.pos = "lt", tl.cex = 0.8)

# Display the correlation matrix
print(corr_matrix)

#### Satisfaction according to their Class i.e. Business, Eco or Eco Plus
options(repr.plot.width = 14, repr.plot.height = 8)
ggplot(data.na, aes(x = `Class`, fill = `satisfaction`)) +
  geom_bar(alpha = 0.6) +
  scale_fill_discrete(name = "Satisfaction Status", labels = c("Dissatisfied", "Satisfied")) +
  labs(x = "Class", y = "Count", title = "Satisfaction depending on the type of Class") +
  theme(legend.position = "right", text = element_text(size = 16))
table(data.na$Class, data.na$satisfaction)
prop.table(table(data.na$Class, data.na$satisfaction))

#### Satisfaction plot according to The Customer Type i.e. Loyal or Disloyal Customer
satisfaction <- ggplot(data.na, aes(satisfaction))
satisfaction + 
  geom_bar(aes(fill = `Customer Type`), width = 0.5) + 
  theme(axis.text.x = element_text(angle = 65, vjust = 0.6)) + 
  labs(title = "Satisfaction Distribution per Customer Type")

# Add margins to the table for Customer Type and satisfaction
addmargins(table(data.na$satisfaction, data.na$`Customer Type`))

#### Logistic Regression Preparation
# Prepare the dataset by ensuring all relevant columns are factors or numeric
data.na <- data.na %>%
  mutate(
    satisfaction = as.factor(satisfaction),
    `Customer Type` = as.factor(`Customer Type`),
    `Type of Travel` = as.factor(`Type of Travel`),
    Class = as.factor(Class),
    Age = as.numeric(Age),
    `Flight Distance` = as.numeric(`Flight Distance`),
    `Departure Delay in Minutes` = as.numeric(`Departure Delay in Minutes`),
    `Arrival Delay in Minutes` = as.numeric(`Arrival Delay in Minutes`)
  )

# Prepare the dataset for logistic regression
regression_data <- data.na %>%
  select(satisfaction, `Customer Type`, Age, `Type of Travel`, Class, `Flight Distance`,
         `Departure Delay in Minutes`, `Arrival Delay in Minutes`, `Seat comfort`,
         `Departure/Arrival time convenient`, `Food and drink`, `Gate location`,
         `Inflight wifi service`, `Inflight entertainment`, `Online support`,
         `Ease of Online booking`, `On-board service`, `Leg room service`,
         `Baggage handling`, `Checkin service`, Cleanliness, `Online boarding`)

# Fit the logistic regression model
logistic_model <- glm(satisfaction ~ ., data = regression_data, family = binomial())

# Summarize the model
summary(logistic_model)

# Check the influence of 'Class' specifically
logistic_model_class <- glm(satisfaction ~ Class, data = regression_data, family = binomial())
summary(logistic_model_class)


# Check the influence of 'Customer Type' specifically
logistic_model_customer_type <- glm(satisfaction ~ `Customer Type`, data = regression_data, family = binomial())
summary(logistic_model_customer_type)
