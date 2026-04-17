/*--------------------------------------------------*/
/* Cooperative vs Competitive Classroom Activities  */
/* Descriptive Statistics Analysis                  */
/*--------------------------------------------------*/

/* Step 1: Create the dataset */
data classroom;
    input cooperation competition;
    datalines;
70 66 
70 62
71 68
72 68
72 75
72 74
73 80
73 80
74 82
84 85
80 85
79 86
80 88 
85 90
;
run;

/* Step 2: Display the dataset */
proc print data=classroom;
    title "Classroom Data: Cooperation vs Competition";
run;

/*--------------------------------------------------*/
/* (a) Measures of Central Tendency                  */
/* Mean, Median, Mode                                */
/*--------------------------------------------------*/
proc means data=classroom mean median mode maxdec=2;
    var cooperation competition;
    title "Measures of Central Tendency";
run;

/*--------------------------------------------------*/
/* (b) Measures of Variation                         */
/* Range, Variance, Standard Deviation               */
/*--------------------------------------------------*/
proc means data=classroom range var std maxdec=2;
    var cooperation competition;
    title "Measures of Variation";
run;

/*--------------------------------------------------*/
/* (c) Measures of Shape                             */
/* Skewness and Kurtosis                             */
/*--------------------------------------------------*/
proc means data=classroom skewness kurtosis maxdec=2;
    var cooperation competition;
    title "Measures of Shape";
run;

/*--------------------------------------------------*/
/* Optional: Detailed Distribution Analysis          */
/*--------------------------------------------------*/
proc univariate data=classroom;
    var cooperation competition;
    title "Detailed Univariate Analysis";
run;




/*--------------------------------------------------*/
/* Baby Birth Weight Analysis                        */
/* Investigating Relationship Using T-Tests         */
/*--------------------------------------------------*/

/* Step 1: Inspect the data */
proc import out= babyweight
datafile= "/home/u64425566/BAN_100/File BIRTH(1).xlsx"
dbms= xlsx;
getnames= yes;
run;

proc print data=babyweight(obs=10);
    title "Sample of Baby Birth Weight Data";
run;

/*--------------------------------------------------*/
/* Step 2: Data audit – missing values               */
/*--------------------------------------------------*/
proc means data=babyweight n nmiss;
    var Weight;
    title "Missing Value Check for Birth Weight";
run;

/*--------------------------------------------------*/
/* Step 3: Descriptive statistics                    */
/*--------------------------------------------------*/
proc means data=babyweight mean std min max;
    var Weight;
    title "Descriptive Statistics for Birth Weight";
run;

/*--------------------------------------------------*/
/* Step 4: Distribution check (Normality)            */
/*--------------------------------------------------*/
proc univariate data=babyweight;
    var Weight;
    histogram Weight / normal;
    title "Distribution of Infant Birth Weight";
run;

/*--------------------------------------------------*/
/* Step 5: T-Test by Baby Sex                        */
/*--------------------------------------------------*/
proc ttest data=babyweight;
    class Boy;
    var Weight;
    title "T-Test: Birth Weight by Baby Sex";
run;

/*--------------------------------------------------*/
/* Step 6: T-Test by Maternal Smoking Status         */
/*--------------------------------------------------*/
proc ttest data=babyweight;
    class MomSmoke;
    var Weight;
    title "T-Test: Birth Weight by Maternal Smoking";
run;

/*--------------------------------------------------*/
/* Step 7: T-Test by Marital Status                  */
/*--------------------------------------------------*/
proc ttest data=babyweight;
    class Married;
    var Weight;
    title "T-Test: Birth Weight by Marital Status";
run;