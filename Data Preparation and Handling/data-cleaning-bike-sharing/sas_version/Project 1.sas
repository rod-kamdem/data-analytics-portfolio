/*=========================================================
PROJECT: Data Cleaning & Preparation - Bike Sharing Dataset
AUTHOR: Data Analyst Portfolio
TOOL: SAS
OBJECTIVE: Prepare raw bike sharing data for analysis/modeling
=========================================================*/


/*---------------------------------------------------------
1. IMPORT DATA / LOAD DATASET
---------------------------------------------------------*/
proc import datafile="/home/u64425566/BAN_100/final_exam/bikes_sharing.csv"
    out=bikes_raw
    dbms=csv
    replace;
    getnames=yes;
run;


/*---------------------------------------------------------
2. DATA INSPECTION
---------------------------------------------------------*/

/* Structure of dataset */
title "Dataset Structure - bikes_raw";
proc contents data=bikes_raw;
run;

/* First observations */
title "First 10 Observations - bikes_raw";
proc print data=bikes_raw (obs=10);
run;

/* Summary statistics */
title "Summary Statistics - bikes_raw";
proc means data=bikes_raw (obs=10) n mean std min max;
run;

/* Missing values check */
title "Missing Values Check - bikes_raw";
proc freq data=bikes_raw (obs=10);
    tables _all_ / missing;
run;


/*---------------------------------------------------------
3. DATA QUALITY CHECKS
---------------------------------------------------------*/

/* Check duplicates */
title "Duplicate Check - bikes_raw" (obs=10);
proc sort data=bikes_raw nodupkey out=bikes_nodup;
    by _all_;
run;


/*---------------------------------------------------------
4. DATA CLEANING (IMPUTATION WITH MEDIANS)
---------------------------------------------------------*/

/* Calculate medians */
proc means data=bikes_nodup median noprint;
    var temp atemp humidity windspeed;
    output out=medians 
        median(temp)=med_temp 
        median(atemp)=med_atemp 
        median(humidity)=med_humidity 
        median(windspeed)=med_windspeed;
run;

/* Apply imputation */
data bikes_clean;
    if _n_=1 then set medians;
    set bikes_nodup;

    if temp = . then temp = med_temp;
    if atemp = . then atemp = med_atemp;
    if humidity = . then humidity = med_humidity;
    if windspeed = . then windspeed = med_windspeed;
run;


/*---------------------------------------------------------
5. OUTLIER DETECTION (IQR METHOD)
---------------------------------------------------------*/

/* Compute IQR */
proc univariate data=bikes_clean noprint;
    var count;
    output out=iqr pctlpts=25 75 pctlpre=P_;
run;

/* Remove outliers */
data bikes_no_outliers;
    if _n_=1 then set iqr;
    set bikes_clean;

    iqr = P_75 - P_25;
    lower = P_25 - 1.5 * iqr;
    upper = P_75 + 1.5 * iqr;

    if count < lower or count > upper then delete;
run;

title "Summary After Outlier Removal" ;
proc means data=bikes_no_outliers n mean std min max;
run;


/*---------------------------------------------------------
6. FEATURE ENGINEERING
---------------------------------------------------------*/

data bikes_final;
    set bikes_no_outliers;

    /* Temperature categories */
    if temp < 10 then temp_level = "Cold";
    else if temp < 25 then temp_level = "Mild";
    else temp_level = "Hot";

    /* Demand level classification */
    if count < 100 then demand_level = "Low";
    else if count < 500 then demand_level = "Medium";
    else demand_level = "High";

    /* Humidity risk score */
    humidity_risk = humidity * windspeed;

    /* Binary variable for high demand */
    high_demand = (count > 200);

    /* Time-based features */
    hour = hour(datetime);
    day = day(datetime);
    month = month(datetime);
    is_weekend = (weekday(datetime) in (1,7));
run;

title "Feature Engineering - Sample Observations" (obs=10);
proc print data=bikes_final (obs=10);
run;


/*---------------------------------------------------------
7. DATA TRANSFORMATION (NORMALIZATION)
---------------------------------------------------------*/

title "Standardized Variables Summary" (obs=10);
proc standard data=bikes_final mean=0 std=1 out=bikes_standardized;
    var temp atemp humidity windspeed count;
run;

proc means data=bikes_standardized n mean std min max;
run;


/*---------------------------------------------------------
8. FINAL CLEAN DATA CHECK
---------------------------------------------------------*/

title "Final Dataset - First 10 Observations" (obs=10);
proc print data=bikes_standardized (obs=10);
run;


/*---------------------------------------------------------
9. EXPORT CLEAN DATASET
---------------------------------------------------------*/

proc export data=bikes_standardized
    outfile="/home/u64425566/BAN_110/PROJECT/bikes_clean.csv"
    dbms=csv
    replace;
run;

