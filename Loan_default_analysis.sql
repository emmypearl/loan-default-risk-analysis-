CREATE TABLE loans(
 LoanID VARCHAR,
 Age INT,
 Income NUMERIC,
 LoanAmount NUMERIC,
 CreditScore INT,
 MonthsEmployed INT,
 NumCreditLines INT,
 InterestRate NUMERIC,
 LoanTerm INT,
 DTIRatio NUMERIC,
 Education VARCHAR,
 EmploymentType VARCHAR,
 MaritalStatus VARCHAR,
 HasMortgage VARCHAR,
 HasDependents VARCHAR,
 LoanPurpose VARCHAR,
 HasCoSigner VARCHAR,
 defaults INT
);





SELECT * 
FROM loans
LIMIT 10;

SELECT COUNT(*) AS total_records
FROM loans;


--overall default rate
SELECT
	COUNT(*) AS total_Loans,
	SUM(defaults) AS total_defaults,
	ROUND(SUM(defaults) * 100 / COUNT(*), 2) AS default_rate_pct
FROM loans;


--default rate by age group
SELECT 
	CASE 
		WHEN age < 25 THEN 'Under 25'
		WHEN age BETWEEN 25 AND 34 THEN '25-34'
		WHEN age BETWEEN 35 AND 44 THEN '35-44'
		WHEN age BETWEEN 45 AND 54 THEN '45-54'
		ELSE '55+'
	END AS age_group,
	COUNT(*) AS total_loans,
	ROUND(AVG(defaults) * 100, 2) AS default_rate_pct
FROM loans
GROUP BY age_group
ORDER BY default_rate_pct DESC;



--default rate by loan purpose
SELECT 
	loanpurpose,
	COUNT(*) AS total_loans,
	ROUND(AVG(defaults) * 100, 2) AS default_rate_pct
FROM loans
GROUP BY loanpurpose
ORDER BY default_rate_pct DESC;



--income and loan amount (defaulters vs non-defaulters)
SELECT 
	CASE 
		WHEN defaults = 0 THEN 'non-defaulter'
		ELSE 'defaulter'
	END AS defaulter_category,
	ROUND(AVG(income)::numeric,2) AS avg_income,
	ROUND(AVG(loanamount)::numeric, 2) AS avg_loan_amount,
	ROUND(AVG(interestrate)::numeric, 2) AS avg_interest_rate
FROM loans
GROUP BY defaults;




--default rate by employment type
SELECT 
	employmenttype,
	COUNT(*) AS total_loans,
	ROUND(AVG(defaults) * 100, 2) AS default_rate_pct
FROM loans
GROUP BY employmenttype
ORDER BY default_rate_pct DESC;



--default rate by credit score band
SELECT 
	CASE
		WHEN creditscore < 580 THEN 'Poor (<580)'
		WHEN creditscore BETWEEN 580 AND 669 THEN 'Fair (580-669)'
		WHEN creditscore BETWEEN 670 AND 739 THEN 'Good (670-739)'
		WHEN creditscore BETWEEN 740 AND 799 THEN 'Very Good (740-799)'
		ELSE 'Exceptional (800+)'
	END AS credit_band,
	COUNT(*) AS total_loans,
	ROUND(AVG(defaults) * 100, 2) AS default_rate_pct
FROM loans
GROUP BY credit_band
ORDER BY default_rate_pct DESC;



--high risk combined segment
SELECT 
	employmenttype,
	CASE 
		WHEN age < 35 THEN 'Under 35'
		ELSE '35+'
	END AS age_group,
	COUNT(*) AS total_loans,
	ROUND(AVG(defaults) * 100, 2) AS default_rate_pct
FROM loans
GROUP BY employmenttype, age_group
ORDER BY default_rate_pct DESC;


--interest rate vs default
SELECT 
	CASE
		WHEN interestrate < 10 THEN 'Low (<10%)'
		WHEN interestrate BETWEEN 10 AND 15 THEN 'Medium (10-15)'
		ELSE 'High (>15)'
	END AS rate_band,
	COUNT(*) AS total_loans,
	ROUND(AVG(defaults) * 100, 2) AS default_rate_pct
FROM loans
GROUP BY rate_band
ORDER BY default_rate_pct DESC;