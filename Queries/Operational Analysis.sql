-- 1. Total Patients Count --

SELECT 
	COUNT(*) AS Total_Patients 
	FROM "Hospital_ER_Data";

-- 2. Average Patient Wait Time --

SELECT 
	ROUND(AVG("Patient Wait time"),2) AS Avg_Wait_Time 
	FROM "Hospital_ER_Data";

-- 3. Top 5 Departments by Referral Count --

SELECT 
	"Department Referral", 
	COUNT(*) AS Total_Referrals
FROM "Hospital_ER_Data"
GROUP BY "Department Referral"
ORDER BY Total_Referrals DESC
LIMIT 5;

-- 4. Monthly Patient Count Trend --

SELECT 
	TO_CHAR("Patient Admission Date", 'YYYY-MM') AS Month, 
	COUNT(*) AS Patient_Count
FROM "Hospital_ER_Data"
GROUP BY Month
ORDER BY Month;


-- 5. Department with Highest Average Satisfaction Score --

SELECT
	"Department Referral", 
	ROUND(AVG("Patient Satisfaction Score"),2) AS Avg_Score
FROM "Hospital_ER_Data"
WHERE "Patient Satisfaction Score" IS NOT NULL
GROUP BY "Department Referral"
ORDER BY Avg_Score DESC
LIMIT 1;

-- 6. Patients with Wait Time Over 50 Minutes --

SELECT COUNT(*) AS Over_50_Min_Wait
FROM "Hospital_ER_Data"
WHERE "Patient Wait time" > 50;

-- 7. Referral Departments with Zero Patients --

SELECT DISTINCT "Department Referral"
FROM "Hospital_ER_Data"
GROUP BY "Department Referral"
HAVING COUNT(*) = 0;

-- 8. Max & Min Patient Wait Times --

SELECT MAX("Patient Wait time") AS Max_Wait, MIN("Patient Wait time") AS Min_Wait
FROM "Hospital_ER_Data";

-- 9. Total Patients Handled by Each Cash Manager --

SELECT "Patients CM", COUNT(*) AS Total_Patients
FROM "Hospital_ER_Data"
GROUP BY "Patients CM"
ORDER BY Total_Patients DESC;

-- 10. Average Wait Time by Department --

SELECT 
	"Department Referral", 
	ROUND(AVG("Patient Wait time"),2) AS Avg_Wait_Time
FROM "Hospital_ER_Data"
GROUP BY "Department Referral"
ORDER BY Avg_Wait_Time DESC;
