# Data Cleaning & Preparation for Bike Sharing Analytics (SAS + Python Project)

## Overview
This project focuses on data cleaning, preparation, and feature engineering using both SAS and Python to transform raw bike‑sharing data into a high‑quality analytical dataset.

It demonstrates end‑to‑end data preparation skills including:

* Data import and structure validation

* Missing value detection and imputation

* Duplicate removal

* Outlier detection using the IQR method

* Feature engineering for predictive modeling

* Variable transformation and normalization

* Export of a clean, modeling‑ready dataset

This dual‑implementation (SAS + Python) highlights the ability to reproduce the same analytical workflow across multiple tools — a key skill for data analysts and data engineers.

---
## Business Objective
The goal of this project is to prepare a clean and enriched dataset that can be used for:

* Forecasting bike‑sharing demand

* Understanding environmental and temporal drivers of usage

* Supporting transportation planning and operational decisions

Clean and well‑structured data enables:

* More accurate predictive models

* Better understanding of user behavior

* Improved decision‑making for bike‑sharing systems

---
## Dataset

The project uses the Bike Sharing Dataset (Washington D.C.), containing hourly rental data from the Capital Bikeshare system.

Target Variable
* count — total number of bike rentals per hour

Predictor Variables
Environmental conditions

* temp, atemp, humidity, windspeed, weather

Calendar effects

* season, holiday, workingday

User behavior

* casual, registered

---

## Tools

* SAS Programming (PROC IMPORT, PROC MEANS, PROC UNIVARIATE, DATA steps)

* Python (Pandas, NumPy, Scikit‑Learn)

---

## Methodology

### 1. Data Inspection
* Structure validation
* Summary statistics
* Missing value detection
* Duplicate removal

### 2. Imputation (Median Strategy)
Numeric variables imputed using dataset medians:
* temp
* atemp
* humidity
* windspeed
This ensures robustness against skewed distributions.

### 3. Outlier Detection (IQR Method)
Outliers in count were removed using:
* Q1 = 43
* Q3 = 284
* IQR = 241
* Lower bound = –318.5
* Upper bound = 645.5
A total of 307 extreme observations were removed.

### 4. Feature Engineering
New variables created to enhance modeling:
* temp_level (Cold / Mild / Hot)
* demand_level (Low / Medium / High)
* humidity_risk (humidity × windspeed)
* high_demand (binary flag)
* Time‑based features: hour, day, month, is_weekend

### 5. Normalization (Standardization)
Using PROC STANDARD in SAS and StandardScaler in Python:
* temp
* atemp
* humidity
* windspeed
* count
All transformed to mean = 0, std = 1.

### 6. Export of Final Dataset
A clean, enriched, and standardized dataset is exported for modeling.

---

## Key Findings

### Data Quality Insights
* No missing values in the raw dataset
* 15 duplicate rows removed
* Outliers significantly affected the distribution of count
* Environmental variables show strong variability and influence

### Feature Engineering Insights
* Temperature and humidity categories reveal clear behavioral patterns
* High demand is strongly associated with moderate temperatures
* Weekend and hour‑of‑day features are essential for modeling

### Technical Insight
Reproducing the same workflow in SAS and Python demonstrates:
* Tool‑agnostic analytical skills
* Strong understanding of data preparation principles
* Ability to validate results across platforms

---

## Business Value
This project demonstrates practical data preparation skills relevant to:
* Transportation analytics
* Demand forecasting
* Operational optimization
* Predictive modeling pipelines
* Data engineering workflows
Clean data is the foundation of reliable analytics, and this project shows the full transformation from raw data to modeling‑ready features.

---

## Files

* `project1.sas` → SAS code
* `project1.ipynb` → Python notebook
* `bikes_sharing.csv` → Employment dataset
* `project1.pdf` → Detailed statistical analysis
* `output_python.html` → execution results

---

## Conclusion

This project demonstrates how robust data cleaning and feature engineering can transform raw operational data into a powerful analytical asset.
