-- Shows which age group suffered the most delays in each month --
-- Useful for targeting queue management and reducing wait times for the most affected groups --

WITH Age_Monthly_Wait AS (
  SELECT 
    TO_CHAR("Patient Admission Date", 'YYYY-MM') AS Month,
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
  GROUP BY Month, Age_Group
)
SELECT *
FROM (
  SELECT 
    Month,
    Age_Group,
    Avg_Wait,
    RANK() OVER (PARTITION BY Month ORDER BY Avg_Wait DESC) AS Rank
  FROM Age_Monthly_Wait
) ranked
WHERE Rank = 1
ORDER BY Month;
