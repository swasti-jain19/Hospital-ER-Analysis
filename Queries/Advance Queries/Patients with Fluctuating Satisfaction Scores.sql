WITH Ranked_Visits AS (
  SELECT 
    "Patient Last Name",
    "Patient Gender",
    "Patient Satisfaction Score",
    "Patient Admission Date",
    ROW_NUMBER() OVER (PARTITION BY "Patient Last Name" ORDER BY "Patient Admission Date") AS Visit_Rank,
    COUNT(*) OVER (PARTITION BY "Patient Last Name") AS Total_Visits
  FROM "Hospital_ER_Data"
  WHERE "Patient Satisfaction Score" IS NOT NULL
),
First_Second_Visit AS (
  SELECT 
    "Patient Last Name",
    "Patient Gender",
    MAX(CASE WHEN Visit_Rank = 1 THEN "Patient Satisfaction Score" END) AS First_Score,
    MAX(CASE WHEN Visit_Rank = 2 THEN "Patient Satisfaction Score" END) AS Second_Score
  FROM Ranked_Visits
  WHERE Total_Visits >= 2  -- Only those who have at least 2 visits
  GROUP BY "Patient Last Name", "Patient Gender"
)
SELECT 
  "Patient Last Name",
  "Patient Gender",
  First_Score,
  Second_Score,
  CASE 
    WHEN Second_Score > First_Score THEN 'Improved'
    WHEN Second_Score < First_Score THEN 'Declined'
    WHEN Second_Score = First_Score THEN 'No Change'
  END AS Score_Trend
FROM First_Second_Visit
WHERE First_Score IS NOT NULL AND Second_Score IS NOT NULL  -- Ensure both scores exist
ORDER BY "Patient Last Name";
