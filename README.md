# Credit Ratings and Bond Yield Spreads: Continuous Risk Pricing at the Investment-Grade Threshold 

Replication files & code for an ECO375 course project.

---

## 📄 Project Description

This repository contains the paper PDF, code, and supporting files, for a regression analysis of Bloomberg-sourced U.S. Corporate Bond Yields. The study investigates whether bond yield spreads reflect a pricing discontinuity at the threshold between investment-grade and junk-grade credit ratings. Using interaction models, the project explores whether yield spreads are more sensitive to credit quality declines for junk bonds than for investment-grade bonds.

---

## 🗂️ Datasets

**Source:**  
Bloomberg Terminal – U.S. corporate bonds with 5–10 year maturities (as of November 7, 2024).

**Included File:**  
- `Project_Working_Copy.dta` – Cleaned and processed dataset used in all analyses.

*Note:* Due to licensing restrictions, the raw dataset is not publicly available. The `.dta` file contains a processed version suitable for replication.

---

## 💻 Code

**File:** `Project Code.do`  
This Stata `.do` file performs the following:

1. Loads the dataset  
2. Runs regression models:
   - **Model 6:** Interaction terms without controls  
   - **Model 7:** Full model with bond maturity, coupon rate, and industry fixed effects  
3. Generates all tables and figures from the final paper

---

## 🔁 Replication Instructions

1. Ensure `Project_Working_Copy.dta` and `Project Code.do` are in the same directory  
2. Open the `.do` file in **Stata (v17 or higher)**  
3. Run the code either line-by-line or all at once  


## ⚙️ Dependencies

- **Software:** Stata (tested on version 17)  
- **Packages:** All commands used are native to Stata; no external packages required  

---

## ⚠️ Limitations

- Replication assumes access to Bloomberg-sourced bond data for full validation  
- Raw data cannot be shared due to licensing restrictions  
