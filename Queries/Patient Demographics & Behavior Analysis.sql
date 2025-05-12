-- 1. Patient Count by Gender --

SELECT 
	"Patient Gender", 
	COUNT(*) AS Total
FROM "Hospital_ER_Data"
GROUP BY "Patient Gender";


-- 2. Patient Count by Age Group --

SELECT 
  CASE 
    WHEN "Patient Age" BETWEEN 0 AND 9 THEN '0-9'
    WHEN "Patient Age" BETWEEN 10 AND 19 THEN '10-19'
    WHEN "Patient Age" BETWEEN 20 AND 29 THEN '20-29'
    WHEN "Patient Age" BETWEEN 30 AND 39 THEN '30-39'
    WHEN "Patient Age" BETWEEN 40 AND 49 THEN '40-49'
    WHEN "Patient Age" BETWEEN 50 AND 59 THEN '50-59'
    WHEN "Patient Age" BETWEEN 60 AND 69 THEN '60-69'
    WHEN "Patient Age" BETWEEN 70 AND 79 THEN '70-79'
    ELSE '80+'
  END AS Age_Group,
  COUNT(*) AS Total
FROM "Hospital_ER_Data"
GROUP BY Age_Group
ORDER BY Age_Group;


-- 3. Average Satisfaction Score by Gender --

SELECT 
	"Patient Gender", 
	ROUND(AVG("Patient Satisfaction Score"),2) AS Avg_Score
FROM "Hospital_ER_Data"
WHERE "Patient Satisfaction Score" IS NOT NULL
GROUP BY "Patient Gender";


-- 4. Top 5 Last Names with Highest Visits --

SELECT 
	"Patient Last Name", 
	COUNT(*) AS Visit_Count
FROM "Hospital_ER_Data"
GROUP BY "Patient Last Name"
ORDER BY Visit_Count DESC
LIMIT 5;


-- 5. Count of Admitted vs Non-Admitted Patients --

SELECT 
	"Patient Admission Flag", 
	COUNT(*) AS Total
FROM "Hospital_ER_Data"
GROUP BY "Patient Admission Flag";


-- 6. Race-wise Patient Count --

SELECT 
	"Patient Race", 
	COUNT(*) AS Total
FROM "Hospital_ER_Data"
GROUP BY "Patient Race"
ORDER BY Total DESC;


-- 7. Average Wait Time by Age Group --

SELECT 
  CASE 
    WHEN "Patient Age" BETWEEN 0 AND 9 THEN '0-9'
    WHEN "Patient Age" BETWEEN 10 AND 19 THEN '10-19'
    WHEN "Patient Age" BETWEEN 20 AND 29 THEN '20-29'
    WHEN "Patient Age" BETWEEN 30 AND 39 THEN '30-39'
    WHEN "Patient Age" BETWEEN 40 AND 49 THEN '40-49'
    WHEN "Patient Age" BETWEEN 50 AND 59 THEN '50-59'
    WHEN "Patient Age" BETWEEN 60 AND 69 THEN '60-69'
    WHEN "Patient Age" BETWEEN 70 AND 79 THEN '70-79'
    ELSE '80+'
  END AS Age_Group,
  ROUND(AVG("Patient Wait time"),2) AS Avg_Wait
FROM "Hospital_ER_Data"
GROUP BY Age_Group
ORDER BY Age_Group;


-- 8. Patients with Satisfaction Score of 5 --

SELECT 
	COUNT(*) AS Perfect_Score_Patients
FROM "Hospital_ER_Data"
WHERE "Patient Satisfaction Score" = 5;


-- 9. Gender-wise Average Wait Time --

SELECT 
	"Patient Gender", 
	ROUND(AVG("Patient Wait time"),2) AS Avg_Wait
FROM "Hospital_ER_Data"
GROUP BY "Patient Gender";


-- 10. Patients with Null Satisfaction Scores --

SELECT 
	COUNT(*) AS Null_Satisfaction_Count
FROM "Hospital_ER_Data"
WHERE "Patient Satisfaction Score" IS NULL;
