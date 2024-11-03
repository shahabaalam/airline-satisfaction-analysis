# Airline Customer Satisfaction Analysis by Class and Customer Type

This repository contains an R script and supporting files for analyzing airline customer satisfaction based on travel class and customer type. This project employs statistical programming techniques, including logistic regression, to identify key satisfaction drivers among airline passengers.

## Project Overview

The analysis focuses on identifying and understanding the factors that influence customer satisfaction across different travel classes (Business, Economy, and Eco Plus) and customer types (Loyal and Disloyal). This approach allows us to pinpoint actionable insights that can enhance customer experience across various segments.

## Objectives

1. **Determine Influential Attributes Based on Travel Class**: Identify factors that significantly impact satisfaction levels for Business, Economy, and Eco Plus travelers.
2. **Analyze Satisfaction by Customer Type**: Understand how satisfaction levels vary between Loyal and Disloyal customers.
3. **Provide Targeted Recommendations**: Generate insights that can help airlines improve customer satisfaction for each travel class and customer type.

## Dataset

The dataset used in this analysis comprises 129,880 entries with 22 features, including:

- **Demographic Information**: Age, Gender
- **Flight Details**: Travel Class, Flight Distance
- **Service Ratings**: Seat Comfort, Inflight WiFi, Food and Drink, etc.
- **Satisfaction Status**: Overall satisfaction as a binary variable (Satisfied / Dissatisfied)

## Exploratory Data Analysis (EDA)

The EDA process includes:

- **Data Cleaning**: Handling missing values, recoding satisfaction values, and removing duplicates.
- **Descriptive Analysis**: Visualizing key variables (Age, Flight Distance, Delay Times) to understand distributions and variability.
- **Correlation Analysis**: Using Pearson correlation to explore relationships among numerical variables, such as Age, Flight Distance, and Delay Times.

## Methodology

### Logistic Regression

We employed logistic regression due to the binary nature of the satisfaction variable. Key insights from the regression model include:

- **Customer Type**: Loyal customers are significantly more likely to be satisfied than disloyal customers.
- **Travel Class**: Passengers in Business class report higher satisfaction compared to those in Economy and Eco Plus classes.
- **Service Factors**: Attributes like seat comfort, inflight entertainment, and online support positively influence satisfaction, while delays negatively impact it.

### Model Justification

Logistic regression was chosen for its interpretability, suitability for binary outcomes, and effectiveness in handling categorical variables. Assumptions related to linearity and multicollinearity were validated in the EDA process to ensure robust performance.

## Key Findings

- **Business Class Satisfaction**: Higher satisfaction levels are prevalent among Business class passengers.
- **Loyalty Impact**: Loyal customers show higher satisfaction rates compared to disloyal customers, underlining the importance of customer retention.
- **Service Improvement Opportunities**: Identified areas, such as inflight comfort and punctuality, where improvements could significantly enhance customer satisfaction.

## Getting Started

### Prerequisites

Install the following R packages:

```r
install.packages("ggplot2")
install.packages("dplyr")
install.packages("tidyr")
install.packages("readr")
```
## Running the Script

1. Clone this repository:

    ```bash
    git clone https://github.com/shahabaalam/airline-satisfaction-analysis.git
    cd airline-satisfaction-analysis
    ```

2. Open and run `airline_satisfaction_analysis.R` in RStudio or another R environment.

## License

This project is open source and licensed under the MIT License.
