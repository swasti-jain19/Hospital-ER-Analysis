WITH CM_Wait AS (
  SELECT 
    "Patients CM",
    ROUND(AVG("Patient Wait time"),2) AS Avg_Wait
  FROM "Hospital_ER_Data"
  GROUP BY "Patients CM"
)
SELECT 
  "Patients CM",
  Avg_Wait
FROM CM_Wait
ORDER BY Avg_Wait DESC
LIMIT 5;
