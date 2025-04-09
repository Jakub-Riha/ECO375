# ECO375-Replication
Replication files for ECO375 paper "Credit Ratings and Bond Yield Spreads: Continuous Risk Pricing at the Investment-Grade Threshold"

**Description**

This repository contains all necessary files to replicate the analysis and results presented in the ECO375 project. The study investigates the relationship between credit ratings and bond yield spreads, focusing on whether a discontinuity exists at the investment-grade to junk-grade threshold. Interaction models are employed to explore whether junk bonds face steeper penalties for credit quality declines compared to investment-grade bonds.

**Data**

Source:
The dataset used for this project was sourced from the Bloomberg Terminal. It includes all outstanding U.S. corporate bonds with 5-10 year maturities as of November 7, 2024.

Included Files:
Project_Working_Copy.dta: The processed dataset used for all analyses in the project.

**Code**

Included File:
Project Code.do: The Stata do-file containing all the commands required to replicate the results. This file performs the following:
1, Loads the dataset (Project_Working_Copy.dta).
2, Runs regression models, including:
    Model 6: Interaction terms without controls.
    Model 7: Full model with controls for bond maturity, coupon rate, and industry fixed effects.
3, Generates the tables and figures included in the paper.

**Replication Steps**

Setup:
Ensure Project_Working_Copy.dta and Project Code.do are in the same directory.
Open Project Code.do in Stata.

Run Code:
Execute the code step by step or as a whole to replicate the results.

Output:

  Regression results:
  Model 6: Interaction terms without controls.
  Model 7: Interaction model with additional controls.
  
  Figures:
  A graph showing differences in yield spread slopes between investment-grade and junk-grade bonds.
  
  Tables:
  Summary statistics.
  Regression tables for both models.

**Dependencies**

Software: Stata (tested on version 17).
Packages: All commands used are built into Stata; no external packages are required.

**Figures and Tables**

The code generates the following outputs:

  Figure III: Trends in log yield spreads for investment-grade and junk-grade bonds.
  Table III: Regression results for Models 6 and 7.
  Summary statistics for the dataset.
  
**Limitations**

The replication assumes access to Bloomberg data for validation. For security reasons, the raw dataset cannot be included in this repository. The provided .dta file contains the processed version used in the analysis.
