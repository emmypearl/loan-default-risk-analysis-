# 🏦 Loan Default Risk Analysis

**Tools:** PostgreSQL · Microsoft Excel  
**Dataset:** [Loan Default Dataset – Kaggle](https://www.kaggle.com/datasets/nikhil1e9/loan-default)  
**Records analysed:** 255,347 loan applications

---

## 📌 Project Overview

This project analyses personal loan data to identify the key factors that predict whether a borrower will default on their loan. The findings are intended to help banks and financial institutions make more informed lending decisions and reduce credit risk exposure.

---

## 🎯 Business Questions Answered

- What is the overall loan default rate?
- Which borrower age groups carry the highest default risk?
- Does employment type affect the likelihood of default?
- How do income and loan amount differ between defaulters and non-defaulters?
- Which loan purposes are riskiest?
- How reliable is credit score as a standalone risk predictor?
- Does a higher interest rate correlate with higher default rates?

---

## 🗂️ Dataset

| Column | Description |
|--------|-------------|
| `Age` | Borrower's age |
| `Income` | Annual income |
| `LoanAmount` | Total loan value |
| `CreditScore` | Borrower's credit score |
| `EmploymentType` | Full-time, Part-time, Self-employed, Unemployed |
| `LoanPurpose` | Business, Auto, Education, Home, Other |
| `InterestRate` | Loan interest rate (%) |
| `Default` | 1 = defaulted, 0 = did not default |

---

## 🛠️ Methodology

### Step 1 — Data Import & Exploration (PostgreSQL)
- Imported CSV into PostgreSQL and created a structured `loans` table
- Verified data integrity: checked row counts and null values across key columns
- Explored data distributions using `LIMIT`, `COUNT`, and `PRAGMA` checks

### Step 2 — SQL Analysis
Wrote 8 analytical queries covering:
- Overall default rate calculation
- Default rate segmented by age group, employment type, loan purpose, credit score band and interest rate band
- Average income and loan amount comparison between defaulters and non-defaulters
- High-risk combined segments (age + employment type)

### Step 3 — Excel Dashboard
- Exported all query results from PostgreSQL to Excel as CSVs
- Built a structured workbook with one sheet per query result
- Created a professional dashboard with KPI cards and 6 charts

---

## 📊 Key Findings

### 1. Overall Default Rate
- **11% of all loans defaulted** — 29,653 out of 255,347 applications

### 2. Age is the Strongest Default Predictor
| Age Group | Default Rate |
|-----------|-------------|
| Under 25 | 21.03% |
| 25–34 | 16.56% |
| 35–44 | 11.98% |
| 45–54 | 8.75% |
| 55+ | 5.59% |

> Borrowers under 25 default at nearly **4x the rate** of borrowers over 55.

### 3. Defaulters Earn Less but Borrow More
| Group | Avg Income | Avg Loan Amount | Avg Interest Rate |
|-------|-----------|-----------------|-------------------|
| Defaulters | $71,845 | $144,515 | 15.90% |
| Non-defaulters | $83,899 | $125,354 | 13.18% |

> Defaulters borrowed 15% more despite earning 14% less — a clear overleveraging pattern.

### 4. Employment Type Matters
| Employment Type | Default Rate |
|----------------|-------------|
| Unemployed | 13.55% |
| Part-time | 11.97% |
| Self-employed | 11.46% |
| Full-time | 9.46% |

### 5. Credit Score is a Weak Standalone Predictor
The gap between Poor (<580) and Exceptional (800+) credit scores is only **2.66 percentage points** (12.47% vs 9.81%), suggesting credit score alone is insufficient for risk assessment.

### 6. Business Loans Carry the Highest Default Risk by Purpose
Business loans default at **12.33%** while Home loans are the safest at **10.23%**.

### 7. Higher Interest Rates Strongly Correlate with Default
| Interest Rate Band | Default Rate |
|-------------------|-------------|
| High (>15%) | 15.82% |
| Medium (10–15%) | 10.54% |
| Low (<10%) | 7.06% |

---

## 💡 Recommendations

1. **Apply stricter lending criteria for borrowers under 35** — this group represents disproportionate default risk
2. **Use DTI ratio (debt-to-income) as a primary screening metric** — the income vs loan amount gap between defaulters and non-defaulters is significant
3. **Weight employment stability heavily in risk models** — full-time employment is the safest employment category by a meaningful margin
4. **Do not rely on credit score alone** — combine it with age, income, employment type and loan amount for accurate risk assessment
5. **Review interest rate assignment policies** — high interest rates correlate strongly with defaults, possibly creating a self-fulfilling risk cycle

---

## 📁 Repository Structure

```
loan-default-risk-analysis/
│
├── data/
│   └── loan_default.csv          # Raw dataset (from Kaggle)
│
├── sql/
│   └── loan_default_queries.sql  # All 8 analysis queries
│
├── dashboard/
│   └── Loan_Default_Risk_Analysis.xlsx  # Excel dashboard
│
└── README.md
```

---

## 🚀 How to Reproduce

1. Download the dataset from [Kaggle](https://www.kaggle.com/datasets/nikhil1e9/loan-default)
2. Create a PostgreSQL database named `loan_analysis`
3. Run the table creation script and import the CSV
4. Execute the queries in `/sql/loan_default_queries.sql`
5. Open the Excel dashboard in `/dashboard/`

---

## 👤 Author

Emmanuel Enuodu 
Aspiring Data Analyst | Excel · SQL · Power BI  
LinkedIn Profile: https://www.linkedin.com/in/enuodu-emmanuel/· Github profile: https://github.com/EmmyPearl
