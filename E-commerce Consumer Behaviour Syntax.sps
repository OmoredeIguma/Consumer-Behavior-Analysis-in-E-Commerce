* Encoding: UTF-8.
SET SEED 1234

 * # Data Transformations (Recoding variables and transformations)

DATASET ACTIVATE DataSet2.
AUTORECODE VARIABLES=Gender 
  /INTO Gender_Coded
  /PRINT.

RECODE MembershipType ('Bronze'=1) ('Silver'=2) ('Gold'=3) INTO Membership_Type_Coded.
VARIABLE LABELS  Membership_Type_Coded 'Membership Type recoded into a diff var'.
EXECUTE.



AUTORECODE VARIABLES=DiscountApplied 
  /INTO Discount_Applied_Recoded
  /PRINT.

RECODE Age (20 thru 29=1) (30 thru 39=2) (40 thru 49=3) INTO Age_Category.
VARIABLE LABELS  Age_Category 'Age Category of the consumers'.
EXECUTE.


RECODE SatisfactionLevel ('Unsatisfied'=1) ('Neutral'=2) ('Satisfied'=3) INTO Satisfaction_Level.
VARIABLE LABELS  Satisfaction_Level 'Level of Satisfaction of the consumers'.
EXECUTE.

* Normality check for total amount spent

EXAMINE VARIABLES=Total_Amount_Spent
  /PLOT BOXPLOT HISTOGRAM NPPLOT
  /COMPARE GROUPS
  /STATISTICS DESCRIPTIVES
  /CINTERVAL 95
  /MISSING LISTWISE
  /NOTOTAL.


 * # Inverse Normal Distribution Transformation

RANK VARIABLES=Total_Amount_Spent (A)
  /RFRACTION
  /PRINT=YES
  /TIES=MEAN.

COMPUTE Total_Amount_Spent_IND=IDF.NORMAL(RTotal_A,845.3817
,362.05870).
EXECUTE.

* # Normality check for total amount spent IND

EXAMINE VARIABLES=Total_Amount_Spent_IND
  /PLOT BOXPLOT HISTOGRAM NPPLOT
  /COMPARE GROUPS
  /STATISTICS DESCRIPTIVES
  /CINTERVAL 95
  /MISSING LISTWISE
  /NOTOTAL.



 * # Descriptive Statistics (Age Category, Gender, Membership Type, Level of Satisfaction)
 
* Mean and Median for Age Variable
 
FREQUENCIES VARIABLES=Age
  /FORMAT=NOTABLE
  /STATISTICS=MEAN MEDIAN
  /ORDER=ANALYSIS.

* Custom Tables.
CTABLES
  /VLABELS VARIABLES=Age_Category Gender_Coded Membership_Type_Coded Satisfaction_Level 
    DISPLAY=LABEL
  /TABLE Age_Category [COUNT F40.0, COLPCT.TOTALN PCT40.1] + Gender_Coded [COUNT F40.0, 
    COLPCT.TOTALN PCT40.1] + Membership_Type_Coded [COUNT F40.0, COLPCT.TOTALN PCT40.1] + 
    Satisfaction_Level [COUNT F40.0, COLPCT.TOTALN PCT40.1]
  /CATEGORIES VARIABLES=Age_Category Gender_Coded Membership_Type_Coded Satisfaction_Level ORDER=A 
    KEY=VALUE EMPTY=INCLUDE
  /CRITERIA CILEVEL=95.


 * # K-Means Cluster Analysis (Total Amount Spent, Items Purchased and Age)

 * # Hierchical Cluster Analysis

CLUSTER   Total_Amount_Spent Items_Purchased Age
  /METHOD WARD
  /MEASURE=SEUCLID
  /PLOT DENDROGRAM VICICLE
  /PRINT NONE.

* # K-Means Cluster Analysis

QUICK CLUSTER Total_Amount_Spent Items_Purchased Age
  /MISSING=LISTWISE
  /CRITERIA=CLUSTER(2) MXITER(50) CONVERGE(0)
  /METHOD=KMEANS(NOUPDATE)
  /SAVE CLUSTER
  /PRINT INITIAL CLUSTER DISTAN.



 * # Crosstab between Gender and Membership Type

CROSSTABS
  /TABLES=Gender_Coded BY Membership_Type_Coded
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ PHI 
  /CELLS=COUNT EXPECTED ASRESID 
  /COUNT ROUND CELL.


 * # ANOVA (WELCH) (Total Amount Spent by Age Category)

ONEWAY Total_Amount_Spent BY Age_Category
  /ES=OVERALL
  /STATISTICS DESCRIPTIVES HOMOGENEITY WELCH 
  /PLOT MEANS
  /MISSING ANALYSIS
  /CRITERIA=CILEVEL(0.95)
  /POSTHOC=GH ALPHA(0.05).

 * # Crosstabs between Membership Type and Level of Satisfaction

CROSSTABS
  /TABLES=Satisfaction_Level BY Membership_Type_Coded
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ GAMMA 
  /CELLS=COUNT EXPECTED ASRESID 
  /COUNT ROUND CELL.

 *  # Independent Samples t-Test (Total Amount Spent by Discount Applie)

T-TEST GROUPS=Discount_Applied_Recoded(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=Total_Amount_Spent_IND
  /ES DISPLAY(TRUE)
  /CRITERIA=CI(.95).

* # Spearman's Rank Correlation

DATASET ACTIVATE DataSet1.
NONPAR CORR
  /VARIABLES=Days_Since_Last_Purchase Membership_Type_Coded
  /PRINT=SPEARMAN TWOTAIL NOSIG FULL
  /MISSING=PAIRWISE.
