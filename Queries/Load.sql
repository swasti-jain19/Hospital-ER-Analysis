CREATE TABLE "Hospital_ER_Data" (
    "Patient ID" VARCHAR(20) PRIMARY KEY,
    "Patient Admission Date" TIMESTAMP,
    "Patient First Inital" CHAR(1),
    "Patient Last Name" VARCHAR(50),
    "Patient Gender" VARCHAR(2) CHECK ("Patient Gender" IN ('M', 'F', 'NC')),
    "Patient Age" INT,
    "Patient Race" VARCHAR(150),
    "Department Referral" VARCHAR(100),
    "Patient Admission Flag" BOOLEAN,
    "Patient Satisfaction Score" INT,  -- NULLs allowed
    "Patient Wait time" INT,
    "Patients CM" VARCHAR(100)
);

COPY "Hospital_ER_Data"
FROM 'C:\DA\Projects\PowerBi\Hospital ER Data\Hospital ER_Data.csv'
DELIMITER ','
CSV HEADER
NULL '';
