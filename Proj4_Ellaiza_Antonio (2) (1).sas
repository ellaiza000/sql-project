************************************
* Ellaiza Antonio
* V00877988
* February 11 2022
* Project 4
************************************;

PROC IMPORT OUT= WORK.BPD
			DATAFILE= "/home/u60899853/BPD_Part_1_Victim_Based_Crime_Data.txt"
			DBMS= CSV REPLACE;
		GETNAMES=YES; * Get column names?;
		DATAROW=2; * Row data starts on.;
RUN;


*** 1 ***
* Number of Crimes using Firearms for 2019;

* Creating new columns to separate date values;
DATA BALTCRIME;
	SET BPD;
	Day1 = weekday(CrimeDate);
	Month1 = month(CrimeDate);
	Year1 = year(CrimeDate);
RUN;
* Finding # of Crimes using firearms for 2019;
PROC SQL;
SELECT YEAR1, COUNT(*)
FROM BALTCRIME
WHERE WEAPON = 'FIREARM'AND YEAR1 = 2019;
QUIT;
* THERE WERE 5158 CRIMES USING FIREARMS FOR 2019;

*** 2 ***;
* 2019 Incidents;
PROC SQL;
SELECT 'Total Incidents'n, COUNT(*)
FROM BALTCRIME
WHERE YEAR1 = 2019
GROUP BY DISTRICT = 'SOUTHWEST';
RUN;
QUIT;
* NorthWest = 41638;
* SouthEast = 39943;
* Eastern = 42223;
* Western = 42701;
* Central = 40486;
* Northern = 41685;
* Southern = 41348;
* NorthEast = 39699;
* SouthWest = 41027;

* 2018 Incidents;
PROC SQL;
SELECT 'Total Incidents'n, COUNT(*)
FROM BALTCRIME
WHERE YEAR1 = 2018
GROUP BY DISTRICT = 'SOUTHWEST';
RUN;
QUIT;
* NorthWest = 43932;
* SouthEast = 41496;
* Eastern = 44217;
* Western = 44626;
* Central = 42677;
* Northern = 43342;
* Southern = 42929;
* NorthEast = 41438;
* SouthWest = 43109;

*** 3 ***;
* SHOWS AM. OF FIREARM CRIME BY YEAR AND BY NEIGHBORHOOD;
PROC SQL;
SELECT NEIGHBORHOOD,YEAR1, COUNT(*)
FROM BALTCRIME
WHERE WEAPON = 'FIREARM'
GROUP BY YEAR1;
RUN;
QUIT;
* TOO LARGE TO SHOW RESULTS AS COMMENT;

*** 4 ***;
* FIREARM CRIMES BY YEAR;
PROC SQL;
SELECT YEAR1, COUNT(*)
FROM BALTCRIME
WHERE WEAPON = 'FIREARM'
GROUP BY YEAR1;
RUN;
QUIT;
*2014 =	3100
*2015 =	4515
*2016 =	4827
*2017 =	5619
*2018 =	5386
*2019 =	5158
*2020 =	2575;

*** 5 ***;
* AGG ASSAULT BY MONTH;
PROC SQL;
SELECT MONTH1, COUNT(*)
FROM BALTCRIME
WHERE Description = 'AGG. ASSAULT'
GROUP BY MONTH1;
RUN;
QUIT;
*1 =	2578
*2 =	2225
*3 =	2861
*4 =	3113
*5 =	3476
*6 =	3441
*7 =	3472
*8 =	2981
*9 =	2776
*10 =	2662
*11 =	2388
*12 =	2350;

*** 6 ***;
PROC SQL;
* COMMON ASSAULT BY YEAR;
SELECT YEAR1, COUNT(*)
FROM BALTCRIME
WHERE Description = 'COMMON ASSAULT'
GROUP BY YEAR1;
RUN;
QUIT;
*2014 =	7463
*2015 =	6993
*2016 =	7499
*2017 =	8751
*2018 =	8373
*2019 =	8315
*2020 =	4360;

*** 7 ***;
* CREATING NEW DATASET W/ YEAR, # OF AGG ASSAULTS, # OF COMMON ASSAULTS;
PROC SQL;
CREATE TABLE ASSAULTS AS
SELECT DESCRIPTION, YEAR1, COUNT(*) 
FROM BALTCRIME
where Description in ('AGG. ASSAULT', 'COMMON ASSAULT')
ORDER BY YEAR1;
QUIT;

* Best I can do when there are duplicate rows... I'm not sure how to group and 
* squeeze duplicates... I'm sure there's a longer way to make this feasible,
* but I have not found it yet...;



























