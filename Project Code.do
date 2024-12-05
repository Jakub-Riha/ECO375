*** SET UP

* Set working directory
cd "/Users/jakubriha/Desktop/ECO375/Project"

* Load the existing .dta file
use "/Users/jakubriha/Desktop/ECO375/Project/Data/Project_Data.dta", clear

* Save a working copy to avoid modifying the original
save "Project_Working_Copy.dta", replace

* Load the working copy
use "Project_Working_Copy.dta", clear

* Set Font
graph set window fontface "Times New Roman"

*** DATA CLEAN UP

* Set variable names

rename A security_id
rename B issuer
rename C ticker
rename D coupon
rename E maturity
rename F price
rename G spread
rename H yield
rename I asw
rename J rating
rename K currency
rename L industry

drop in 1

* Convert the ratings ranges into numeric values for analysis
gen numeric_ratings = .

replace numeric_ratings = 1 if rating == "AAA"
replace numeric_ratings = 2 if rating == "AA+"
replace numeric_ratings = 3 if rating == "AA"
replace numeric_ratings = 4 if rating == "AA-"
replace numeric_ratings = 5 if rating == "A+"
replace numeric_ratings = 6 if rating == "A"
replace numeric_ratings = 7 if rating == "A-"
replace numeric_ratings = 8 if rating == "BBB+"
replace numeric_ratings = 9 if rating == "BBB"
replace numeric_ratings = 10 if rating == "BBB-"
replace numeric_ratings = 11 if rating == "BB+"
replace numeric_ratings = 12 if rating == "BB"
replace numeric_ratings = 13 if rating == "BB-"
replace numeric_ratings = 14 if rating == "B+"
replace numeric_ratings = 15 if rating == "B"
replace numeric_ratings = 16 if rating == "B-"
replace numeric_ratings = 17 if rating == "CCC+"
replace numeric_ratings = 18 if rating == "CCC"
replace numeric_ratings = 19 if rating == "CCC-"

* destring
destring coupon maturity price spread yield asw, replace

* Identify and list outliers with negative spread values
list security_id issuer rating spread if spread < 0

* Drop observations where spread is negative
drop if spread < 0

* Generate log of spread
gen log_spread = log(spread)

* Identify and list outliers with negative log spread values
list log_spread numeric_ratings if log_spread < 0

* Drop observations where log spread is negative
drop if log_spread < 0

* Convert industry labels into numeric values for analysis
gen numeric_industry = .

replace numeric_industry = 1 if industry == "Advertising & Marketing"
replace numeric_industry = 2 if industry == "Agricultural Chemicals"
replace numeric_industry = 3 if industry == "Agricultural Machinery"
replace numeric_industry = 4 if industry == "Agricultural Products"
replace numeric_industry = 5 if industry == "Agricultural Products Wholesalers"
replace numeric_industry = 6 if industry == "Air Freight"
replace numeric_industry = 7 if industry == "Aircraft & Parts"
replace numeric_industry = 8 if industry == "Airlines"
replace numeric_industry = 9 if industry == "Alcoholic Beverages"
replace numeric_industry = 10 if industry == "Apparel, Footwear & Acc Design"
replace numeric_industry = 11 if industry == "Application Software"
replace numeric_industry = 12 if industry == "Auto Parts"
replace numeric_industry = 13 if industry == "Automobiles"
replace numeric_industry = 14 if industry == "Automotive Retailers"
replace numeric_industry = 15 if industry == "Automotive Wholesalers"
replace numeric_industry = 16 if industry == "Banks"
replace numeric_industry = 17 if industry == "Base Metals"
replace numeric_industry = 18 if industry == "Basic & Diversified Chemicals"
replace numeric_industry = 19 if industry == "Biotech"
replace numeric_industry = 20 if industry == "Building Construction"
replace numeric_industry = 21 if industry == "Building Materials"
replace numeric_industry = 22 if industry == "Building Products"
replace numeric_industry = 23 if industry == "Cable & Satellite"
replace numeric_industry = 24 if industry == "Casinos & Gaming"
replace numeric_industry = 25 if industry == "Catalog & TV Based Retailers"
replace numeric_industry = 26 if industry == "Cement & Aggregates"
replace numeric_industry = 27 if industry == "Chemicals Distribution"
replace numeric_industry = 28 if industry == "Commercial Finance"
replace numeric_industry = 29 if industry == "Commercial Vehicles"
replace numeric_industry = 30 if industry == "Comm'l & Res Bldg Equip & Sys"
replace numeric_industry = 31 if industry == "Communications Equipment"
replace numeric_industry = 32 if industry == "Computer Hardware & Storage"
replace numeric_industry = 33 if industry == "Construction & Mining Machinery"
replace numeric_industry = 34 if industry == "Consumer Electronics"
replace numeric_industry = 35 if industry == "Consumer Finance"
replace numeric_industry = 36 if industry == "Consumer Goods Rental"
replace numeric_industry = 37 if industry == "Consumer Healthcare Products"
replace numeric_industry = 38 if industry == "Containers & Packaging"
replace numeric_industry = 39 if industry == "Courier Services"
replace numeric_industry = 40 if industry == "Cruise Lines"
replace numeric_industry = 41 if industry == "Data Center REIT"
replace numeric_industry = 42 if industry == "Defense"
replace numeric_industry = 43 if industry == "Department Stores"
replace numeric_industry = 44 if industry == "Diversified Banks"
replace numeric_industry = 45 if industry == "Diversified Industrials"
replace numeric_industry = 46 if industry == "Drilling & Drilling Support"
replace numeric_industry = 47 if industry == "EMS/ODM"
replace numeric_industry = 48 if industry == "Educational Services"
replace numeric_industry = 49 if industry == "Electric & Gas Marketing & Trading"
replace numeric_industry = 50 if industry == "Electric Transmission & Dist"
replace numeric_industry = 51 if industry == "Electrical Components"
replace numeric_industry = 52 if industry == "Electronics & Appliances Stores"
replace numeric_industry = 53 if industry == "Engineering Services"
replace numeric_industry = 54 if industry == "Entertainment Facilities"
replace numeric_industry = 55 if industry == "Exploration & Production"
replace numeric_industry = 56 if industry == "Fabricated Metal & Hardware"
replace numeric_industry = 57 if industry == "Film & TV"
replace numeric_industry = 58 if industry == "Flow Control Equipment"
replace numeric_industry = 59 if industry == "Food & Beverage Wholesalers"
replace numeric_industry = 60 if industry == "Food & Drug Stores"
replace numeric_industry = 61 if industry == "Funeral Services"
replace numeric_industry = 62 if industry == "Gaming REIT"
replace numeric_industry = 63 if industry == "Gas Utilities"
replace numeric_industry = 64 if industry == "Health Care Facilities"
replace numeric_industry = 65 if industry == "Health Care REIT"
replace numeric_industry = 66 if industry == "Health Care Services"
replace numeric_industry = 67 if industry == "Health Care Supplies"
replace numeric_industry = 68 if industry == "Health Care Supply Chain"
replace numeric_industry = 69 if industry == "Home Products"
replace numeric_industry = 70 if industry == "Home Products Stores"
replace numeric_industry = 71 if industry == "Homebuilding"
replace numeric_industry = 72 if industry == "Hotel REIT"
replace numeric_industry = 73 if industry == "Household Appliances"
replace numeric_industry = 74 if industry == "Housewares"
replace numeric_industry = 75 if industry == "IT Services"
replace numeric_industry = 76 if industry == "Industrial Automation Controls"
replace numeric_industry = 77 if industry == "Industrial REIT"
replace numeric_industry = 78 if industry == "Industrial Wholesale & Rental"
replace numeric_industry = 79 if industry == "Infrastructure Construction"
replace numeric_industry = 80 if industry == "Infrastructure Equipment"
replace numeric_industry = 81 if industry == "Infrastructure REIT"
replace numeric_industry = 82 if industry == "Infrastructure Software"
replace numeric_industry = 83 if industry == "Institutional Brokerage"
replace numeric_industry = 84 if industry == "Inst'l Trust, Fiduciary & Custody"
replace numeric_industry = 85 if industry == "Insurance Brokers & Services"
replace numeric_industry = 86 if industry == "Integrated Electric Utilities"
replace numeric_industry = 87 if industry == "Integrated Oil & Gas"
replace numeric_industry = 88 if industry == "Internet Media & Services"
replace numeric_industry = 89 if industry == "Investment Companies"
replace numeric_industry = 90 if industry == "Investment Management"
replace numeric_industry = 91 if industry == "Large Pharma"
replace numeric_industry = 92 if industry == "Life Insurance"
replace numeric_industry = 93 if industry == "Life Science & Diagnostics"
replace numeric_industry = 94 if industry == "Local TV & Radio Broadcast"
replace numeric_industry = 95 if industry == "Lodging"
replace numeric_industry = 96 if industry == "Logistics Services"
replace numeric_industry = 97 if industry == "Managed Care"
replace numeric_industry = 98 if industry == "Mass Merchants"
replace numeric_industry = 99 if industry == "Measurement Instruments"
replace numeric_industry = 100 if industry == "Medical Devices"
replace numeric_industry = 101 if industry == "Medical Equipment"
replace numeric_industry = 102 if industry == "Metal Svc Centers & Processors"
replace numeric_industry = 103 if industry == "Metalworking Machinery"
replace numeric_industry = 104 if industry == "Midstream – Oil & Gas"
replace numeric_industry = 105 if industry == "Mortgage Finance"
replace numeric_industry = 106 if industry == "Multi Asset Class Own & Develop"
replace numeric_industry = 107 if industry == "Multi Asset Class REIT"
replace numeric_industry = 108 if industry == "Music"
replace numeric_industry = 109 if industry == "Non-Alcoholic Beverages"
replace numeric_industry = 110 if industry == "Non-Profit Organization"
replace numeric_industry = 111 if industry == "Office REIT"
replace numeric_industry = 112 if industry == "Oilfield Services & Equipment"
replace numeric_industry = 113 if industry == "Online Marketplace"
replace numeric_industry = 114 if industry == "Other Commercial Support Svcs"
replace numeric_industry = 115 if industry == "Other Financial Services"
replace numeric_industry = 116 if industry == "Other Machinery & Equipment"
replace numeric_industry = 117 if industry == "Other Spec Retail – Discr"
replace numeric_industry = 118 if industry == "Other Wholesalers"
replace numeric_industry = 119 if industry == "Out-of-Home Display Advertising"
replace numeric_industry = 120 if industry == "P&C Insurance"
replace numeric_industry = 121 if industry == "Packaged Food"
replace numeric_industry = 122 if industry == "Paper & Pulp Mills"
replace numeric_industry = 123 if industry == "Personal Care Products"
replace numeric_industry = 124 if industry == "Pollution Control Equipment"
replace numeric_industry = 125 if industry == "Power Generation"
replace numeric_industry = 126 if industry == "Precious Metals"
replace numeric_industry = 127 if industry == "Printing Services"
replace numeric_industry = 128 if industry == "Private Equity"
replace numeric_industry = 129 if industry == "Professional Services"
replace numeric_industry = 130 if industry == "Publishing"
replace numeric_industry = 131 if industry == "Rail Freight"
replace numeric_industry = 132 if industry == "Railroad Rolling Stock"
replace numeric_industry = 133 if industry == "Real Estate Services"
replace numeric_industry = 134 if industry == "Recreational Vehicles"
replace numeric_industry = 135 if industry == "Refining & Marketing"
replace numeric_industry = 136 if industry == "Reinsurance"
replace numeric_industry = 137 if industry == "Renewable Energy Equipment"
replace numeric_industry = 138 if industry == "Renewable Energy Project Dev"
replace numeric_industry = 139 if industry == "Residential Owners & Developers"
replace numeric_industry = 140 if industry == "Residential REIT"
replace numeric_industry = 141 if industry == "Restaurants"
replace numeric_industry = 142 if industry == "Retail REIT"
replace numeric_industry = 143 if industry == "Security & Cmmdty Exchanges"
replace numeric_industry = 144 if industry == "Security Services"
replace numeric_industry = 145 if industry == "Self-storage REIT"
replace numeric_industry = 146 if industry == "Semiconductor Devices"
replace numeric_industry = 147 if industry == "Semiconductor Mfg"
replace numeric_industry = 148 if industry == "Specialty & Generic Pharma"
replace numeric_industry = 149 if industry == "Specialty Apparel Stores"
replace numeric_industry = 150 if industry == "Specialty Chemicals"
replace numeric_industry = 151 if industry == "Specialty Owners & Developers"
replace numeric_industry = 152 if industry == "Specialty REIT"
replace numeric_industry = 153 if industry == "Specialty Technology Hardware"
replace numeric_industry = 154 if industry == "Sporting Goods Stores"
replace numeric_industry = 155 if industry == "Steel Producers"
replace numeric_industry = 156 if industry == "Technology Distributors"
replace numeric_industry = 157 if industry == "Timber REIT"
replace numeric_industry = 158 if industry == "Tobacco"
replace numeric_industry = 159 if industry == "Toys & Games"
replace numeric_industry = 160 if industry == "Transit Services"
replace numeric_industry = 161 if industry == "Transport Operations & Services"
replace numeric_industry = 162 if industry == "Trucking"
replace numeric_industry = 163 if industry == "Video Games"
replace numeric_industry = 164 if industry == "Waste Management"
replace numeric_industry = 165 if industry == "Water Utilities"
replace numeric_industry = 166 if industry == "Wealth Management"
replace numeric_industry = 167 if industry == "Wireless Telecommunications"
replace numeric_industry = 168 if industry == "Wireline Telecommunications"
replace numeric_industry = 169 if industry == "Wood Products"
replace numeric_industry = 170 if industry == "Instl Trust, Fiduciary & Custody"
replace numeric_industry = 171 if industry == "Other Spec Retail - Discr"
replace numeric_industry = 172 if industry == "Midstream - Oil & Gas"
replace numeric_industry = 173 if industry == "Agricultural Producers"
replace numeric_industry = 174 if industry == "Comml & Res Bldg Equip & Sys"
replace numeric_industry = 175 if industry == "Security & Cmdty Exchanges"
replace numeric_industry = 176 if industry == "Integrated Oils"
replace numeric_industry = 177 if industry == "Agricultural Products Whslrs"
replace numeric_industry = 178 if industry == "Elec & Gas Marketing & Trading"

*** DATA ANALYSIS

* Save a scatterplot of Y on X
scatter spread numeric_ratings, ytitle("Yield Spread") xtitle("Credit Rating")
graph export "scatterplot_yield_vs_ratings.pdf", replace

* Save a scatterplot of log(Y) on X with a regression line
twoway (scatter log_spread numeric_ratings) ///
       (lfit log_spread numeric_ratings), ///
       ytitle("Log Yield Spread") xtitle("Credit Rating") legend(off)

graph export "scatterplot_yield_vs_ratings_with_regline.pdf", replace

* * Regression Analysis

* Run an OLS regression of Y (Yield Spreads) on X (Ratings)
reg spread numeric_ratings, vce(cluster numeric_industry)

* Run an OLS regression of Log(Y) (Log Yield Spreads) on X (Ratings)
reg log_spread numeric_ratings, vce(cluster numeric_industry)

* Run a regression with numeric_ratings and maturity
reg log_spread numeric_ratings maturity, vce(cluster numeric_industry)

* Run a regression with numeric_ratings and coupon
reg log_spread numeric_ratings coupon, vce(cluster numeric_industry)

* Run a regression with numeric_ratings and industry dummies
reg log_spread numeric_ratings i.numeric_industry, vce(cluster numeric_industry)

* Run a regression with numeric_ratings, maturity, coupon, and industry dummies
reg log_spread numeric_ratings maturity coupon i.numeric_industry, vce(cluster numeric_industry)

* Run a non log regression with numeric_ratings, maturity, coupon, and industry dummies
reg spread numeric_ratings maturity coupon i.numeric_industry, vce(cluster numeric_industry)

* * Junk Grade Interaction Analysis

* Create a dummy variable for junk-grade bonds (numeric ratings 11 and above)
gen junk_grade = numeric_ratings >= 11

* Regression with interaction term
reg log_spread numeric_ratings junk_grade c.numeric_ratings#c.junk_grade, vce(cluster numeric_industry)

* Regression with interaction term and controls
reg log_spread numeric_ratings junk_grade c.numeric_ratings#c.junk_grade ///
    maturity coupon i.numeric_industry, vce(cluster numeric_industry)

* Scatter plot with fitted lines for investment-grade and junk-grade bonds
twoway (scatter log_spread numeric_ratings if junk_grade == 0) ///
       (lfit log_spread numeric_ratings if junk_grade == 0) ///
       (scatter log_spread numeric_ratings if junk_grade == 1) ///
       (lfit log_spread numeric_ratings if junk_grade == 1), ///
       legend(off)


