-- Shows patients who waited the longest (worst 1%) --
-- Ideal for escalation audits and root cause analysis on extreme delays --

WITH Wait_Percentiles AS (
  SELECT 
    "Patient ID",
    "Patient Last Name",
    "Patient Wait time",
    PERCENT_RANK() OVER (ORDER BY "Patient Wait time" DESC) AS Wait_Percentile
  FROM "Hospital_ER_Data"
)
SELECT 
  "Patient ID",
  "Patient Last Name",
  "Patient Wait time"
FROM Wait_Percentiles
WHERE Wait_Percentile <= 0.01
ORDER BY "Patient Wait time" DESC;
