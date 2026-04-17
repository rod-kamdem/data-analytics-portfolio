# Correlation Analysis on Fitness and Physiological Data

## Objective

This project explores relationships between key physiological and fitness-related variables measured on men in a physical fitness course at N.C. State University. 
The main goal is to identify and interpret correlations between variables such as oxygen consumption, pulse rates, age, weight, and running performance.
---

## Dataset

The datalines contains measurements from a group of male participants in a physical fitness study.

Variables include:
age: Age of participant
weight: Body weight
oxy: Oxygen consumption (fitness indicator)
runtime: Time required to complete a run
rstpulse: Resting pulse rate
runpulse: Pulse rate while running
maxpulse: Maximum recorded pulse rate

---

## Tools

* SAS Programming

---

## Methodology

### Part 1: Data Exploration
Loaded dataset using SAS DATA step
Reviewed structure and variables
Prepared data for correlation analysis

### Part 2: Scatter Plot Analysis
Generated scatter plots between key variables:
      oxygen consumption vs pulse rates
      runtime vs oxygen consumption
      age vs fitness indicators
Visually assessed relationships and trends

### Part 3: Correlation Analysis
Computed Pearson correlation coefficients 
Evaluated strength and direction of relationships between variables

### Part 4: Interpretation
Interpreted positive and negative correlations
Identified strong vs weak relationships among fitness indicators

### Part 5: Limitations of Correlation
Correlation does not imply causation
Sensitive to outliers
Cannot capture non-linear relationships
Limited in explaining complex physiological interactions

---

## Key Findings

* Oxygen consumption shows strong relationships with running performance indicators
* Pulse rates (resting, running, maximum) are moderately to strongly correlated
* Runtime is negatively related to oxygen consumption (better fitness → lower runtime)
* Age and weight show weaker relationships with performance variables


---

## Business Insight (Non-Technical)

* Oxygen consumption can be used as a strong indicator of physical fitness
* Heart rate metrics provide useful insights into cardiovascular performance
* Fitness performance decreases with age, but not uniformly across individuals
* Correlation analysis helps identify patterns but should not be used alone for medical or fitness decisions
---

## Files

* correlation_analysis.sas → SAS code
* correlation_results.pdf → Statistical output report
* interpretation_report.pdf → Detailed explanation of results
---

## Conclusion

This project demonstrates how correlation analysis can be used to study relationships between physiological and fitness variables. 
It highlights the importance of combining statistical measures with visual analysis to better understand real-world health and performance data.
