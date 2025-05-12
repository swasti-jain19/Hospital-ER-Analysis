-- Ranks every department by patient satisfaction --
-- Useful for identifying which departments are top-performing and which need service improvement --

WITH Dept_Scores AS (
  SELECT 
    "Department Referral", 
    ROUND(AVG("Patient Satisfaction Score"),2) AS Avg_Score
  FROM "Hospital_ER_Data"
  WHERE "Patient Satisfaction Score" IS NOT NULL
  GROUP BY "Department Referral"
)
SELECT 
  "Department Referral", 
  Avg_Score,
  ROW_NUMBER() OVER (ORDER BY Avg_Score DESC) AS Rank
FROM Dept_Scores;
