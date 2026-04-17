# Predictive Analytics in Transportation & Survival Data (SAS Regression Project)

## Overview

This project applies statistical modeling and regression techniques in SAS to solve real-world prediction problems across transportation demand and survival analysis.

It demonstrates end-to-end data analysis skills including:

* Data exploration and preparation
* Multiple linear regression modeling
* Logistic regression modeling
* Stepwise feature selection
* Model evaluation and interpretation
* Business-oriented insight generation
---

## Business Objective

The goal of this project is to build and evaluate predictive models that can:

* Forecast bike-sharing demand based on environmental conditions
* Estimate survival probability of Titanic passengers using demographic and socio-economic factors
* Interpret how feature encoding affects logistic regression results

These models support decision-making in:

* Urban transportation planning
* Risk prediction and classification
* Data-driven policy analysis

---
## Dataset

The project is based on two datasets:

### 1. Bike Sharing Dataset (Washington D.C.)
Hourly rental data from Capital Bikeshare system.

Target Variable:

* count (total number of bike rentals)

Predictors:

* Weather conditions: temp, atemp, humidity, windspeed, weather
* Calendar effects: season, holiday, workingday
* User behavior: casual, registered
  
### 2. Titanic Survival Dataset
Passenger-level dataset used for classification modeling.

Target Variable:

* Survived (0 = No, 1 = Yes)

Predictors:

* Demographics: Age, Sex
* Socio-economic class: Class
* Family structure: SiblingSpouse, ParentChild
* Embarkation point

---

## Tools

* SAS Programming

---

## Methodology

### 1. Multiple Linear Regression (Bike Demand Prediction)
A multiple regression model was built to estimate bike rental demand.

Key Findings:

* Model is statistically significant (p < 0.0001)
* Explains ~26% of variance (R² ≈ 0.26)

Strong predictors:

* Humidity (negative impact)
* Temperature (positive impact)
* Seasonality effects
* Weather conditions

Stepwise Selection Result:
* Final model includes: season, atemp, humidity, windspeed, weather

Insight:
Environmental conditions are key drivers of transportation demand, but additional variables (e.g., time of day, events) are likely needed for stronger predictive performance.

### 2. Logistic Regression (Titanic Survival Prediction)

A binary classification model was developed to estimate survival probability.

Model 1: Simple (Age only)
* Weak predictive power (c ≈ 0.53)
* Age has a small negative effect on survival
Model 2: Full Model
Includes Sex, Age, Class, and Family variables

Model Performance:
* AIC improvement: 966 → 648
* C-statistic: 0.859 (strong model)
* Highly significant (p < 0.0001)

Key Predictors:
* Female passengers had dramatically higher survival odds (OR ≈ 13.8)
* First-class passengers had strong survival advantage
* Age negatively affects survival probability
* Family size slightly reduces survival odds

### 3. Logistic Regression Interpretation (Capital Punishment Case)
This section demonstrates how variable coding impacts interpretation:
* Changing reference groups reverses coefficient signs
* Odds ratios remain consistent in magnitude
* Interpretation depends entirely on baseline category

Key takeaway:
* Correct variable encoding is essential for ethical and accurate interpretation of regression results.
---

## Key Findings

### Transportation Analytics
* Weather and humidity significantly influence bike demand
* Demand patterns are season-dependent
* Linear regression provides moderate predictive accuracy (~26%)

### Survival Analytics
* Socio-demographic variables dominate survival outcomes
* Logistic regression is highly effective for classification (C = 0.859)
* Gender is the strongest predictor of survival

### Modeling Insight
* Feature encoding directly affects interpretability
* Model selection (stepwise vs full model) impacts performance and complexity

---

## Business Value
This project demonstrates applied analytics skills relevant to data-driven roles:
📊 Demand forecasting for transportation systems
⚠️ Risk prediction using classification models
📈 Feature importance analysis for decision-making
🧠 Interpretation of statistical models for business stakeholders
---

## Files

* `regression-analysis-sas` → SAS code
* `bikes.xlsx` → dataset
* `Titanic.xlsx` →  dataset
* `technical_report.pdf` → Detailed statistical analysis
* `business_report.pdf` → Simplified insights for non-technical audience

---

## Conclusion

This project highlights how regression models can be used to extract meaningful insights from real-world datasets. 
While linear models provide interpretable trends, logistic regression proves highly effective for classification tasks.
