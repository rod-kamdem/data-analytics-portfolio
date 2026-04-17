/* BAN 100
   Projet  
   NAME: Rodrigue Kouam Kamdem */ 

libname a4 "/home/u64425566/BAN_100/final_exam";

/* Problem #1*/

/* Import the CSV file */
proc import datafile='/home/u64425566/BAN_100/final_exam/bikes_sharing.csv'
    out=a4.bikes
    dbms=csv
    replace;
    guessingrows=max;
    getnames=yes;
run;

/* Quick look */
proc contents data=a4.bikes; run;
proc print data=a4.bikes(obs=10); run;



/*a-c. Find a multiple regression model
Predict count using external variables only and interprete results*/


proc reg data=a4.bikes;
title 'Multiple regression model using external variables ';
    model count = season holiday workingday weather
                  temp atemp humidity windspeed;
run;
quit;


/* d-h. Plot the residuals versus the actual values*/

proc reg data=a4.bikes;
    model count = season holiday workingday weather
                  temp atemp humidity windspeed;
    output out=regout r=resid p=pred;
run;
quit;

proc sgplot data=regout;
    scatter x=count y=resid;
    refline 0 / axis=y;
run;

/* i. stepwise regression*/
proc reg data=a4.bikes;
    model count = season holiday workingday weather
                  temp atemp humidity windspeed
          / selection=stepwise slentry=0.05 slstay=0.05;
run;
quit;


/* Problem #2 */
proc import datafile = '/home/u64425566/BAN_100/final_exam/titanic.csv'
     dbms=csv
     out=a4.titanic
     replace;
     getnames=yes;
run;

/* a. Write the logistic regression equation relating Age and Survived */
proc logistic data = a4.titanic;
     model survived(event='1') = age;
     output out=pred_data p=prob_survived;
run;

/* b. Estimate the probability of surviving the passenger with the average Age 30. */
data test_30;
    age = 30;
    survived = .; 
run;

data combined;
    set a4.titanic test_30;
run;

proc logistic data = combined;
    model survived(event='1') = age;
    output out=predictions p=prob_survived;
run;

title 'The probability of surviving the passenger with the average Age 30';
proc print data=predictions;
    where age = 30 and survived = .;
run;

/* c. Suppose we want to check who have a 0.50 or higher probability of surviving. What is the average age to achieve this level of probability? */
data high_prob;
    set pred_data;
    if prob_survived >= 0.4; 
run;

title "The average probability to achieve 0.4 or higher probability of surviving";
proc print data=high_prob (obs=10);
run;

/* e. For the Titanic data, estimate a comprehensive logistic regression model with equations with other variables included. */
proc logistic data = a4.titanic;
     class sex class / param=ref;
     model survived(event='1') = sex age class siblingspouse;
     output out=pred_data_2 p=prob_survived_2;
run;

