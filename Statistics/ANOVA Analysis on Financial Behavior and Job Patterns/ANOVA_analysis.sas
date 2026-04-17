proc import out=Stocks 
		datafile="/home/u64425566/BAN_100/Midtermproject/Stock.xlsx" dbms=xlsx;
	getnames=yes;
run;

proc print data=Stocks;
run;

/* Convert wide format to long format */
data stocks_long;
	set stocks;
	length age_group $20;

	/* Young */
	if not missing(Young) then
		do;
			age_group="Young";
			proportion=Young;
			output;
		end;

	/* Early Middle Age */
	if not missing(Early_Middle_Age) then
		do;
			age_group="Early_Middle_Age";
			proportion=Early_Middle_Age;
			output;
		end;

	/* Late Middle Age */
	if not missing(Late_Middle_Age) then
		do;
			age_group="Late_Middle_Age";
			proportion=Late_Middle_Age;
			output;
		end;

	/* Senior */
	if not missing(Senior) then
		do;
			age_group="Senior";
			proportion=Senior;
			output;
		end;
run;

proc contents data=stocks_long;
run;

proc anova data=stocks_long;
	class age_group;
	model proportion=age_group;
	means age_group / tukey;
	run;

	/* Normality check using PPPlot (as taught in class) */
proc univariate data=stocks_long normal;
	class age_group;
	var proportion;
	histogram proportion;
	ppplot proportion;
run;

proc glm data=stocks_long;
	class age_group;
	model proportion=age_group;
	means age_group / hovtest=levene;
	run;
quit;

/*==============================================================*
| Problem 2 – Two-Way ANOVA (Gender × Education)               |
 *==============================================================*/
proc import out=job datafile="/home/u64425566/BAN_100/Midtermproject/File_Comparing_the_Lifetime_of_Jobs_by_Educational_Level.xlsx" 
		dbms=xlsx;
	getnames=yes;
run;

proc print data=job;
run;

data job_long;
	set job;
	length Gender $10 Education $5;

	/* Male E1 */
	if not missing(Male_E1) then do;
			Gender="Male";
			Education="E1";
			Number_of_Jobs=Male_E1;
			output;
		end;

	/* Male E2 */
	if not missing(Male_E2) then
		do;
			Gender="Male";
			Education="E2";
			Number_of_Jobs=Male_E2;
			output;
		end;

	/* Male E3 */
	if not missing(Male_E3) then do;
			Gender="Male";
			Education="E3";
			Number_of_Jobs=Male_E3;
			output;
		end;

	/* Male E4 */
	if not missing(Male_E4) then do;
			Gender="Male";
			Education="E4";
			Number_of_Jobs=Male_E4;
			output;
		end;

	/* Female E1 */
	if not missing(Female_E1) then do;
			Gender="Female";
			Education="E1";
			Number_of_Jobs=Female_E1;
			output;
		end;

	/* Female E2 */
	if not missing(Female_E2) then do;
			Gender="Female";
			Education="E2";
			Number_of_Jobs=Female_E2;
			output;
		end;

	/* Female E3 */
	if not missing(Female_E3) then do;
			Gender="Female";
			Education="E3";
			Number_of_Jobs=Female_E3;
			output;
		end;

	/* Female E4 */
	if not missing(Female_E4) then do;
			Gender="Female";
			Education="E4";
			Number_of_Jobs=Female_E4;
			output;
		end;
run;

/* Vérifier que le dataset long est correct */
proc contents data=job_long;
run;

/*--* | STEP 3 — Check ANOVA assumptions  | *--*/
proc univariate data=job_long normal;
	class Gender Education;
	var Number_of_Jobs;
	histogram Number_of_Jobs;
	ppplot Number_of_Jobs;
run;

/* Homogeneity of variances (Levene test) */
proc glm data=job_long;
	class Gender Education;
	model Number_of_Jobs=Gender Education Gender*Education;
	means Gender Education / hovtest=levene;
	run;
quit;

/*--* | STEP 4 — Two-Way ANOVA with interaction | *--*/
proc glm data=job_long;
	class Gender Education;
	model Number_of_Jobs=Gender Education Gender*Education;
	lsmeans Gender Education / tukey;
	run;