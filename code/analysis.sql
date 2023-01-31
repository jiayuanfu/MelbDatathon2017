-- create subtrans file for training data and test data
CREATE TABLE TRANS_T AS
SELECT * FROM TRANSACTIONS t
WHERE t.Patient_ID < 259201;

CREATE TABLE TRANS_D AS
SELECT * FROM TRANSACTIONS t
WHERE t.Patient_ID BETWEEN 259201 AND 279200;

CREATE TABLE TRANS_FinalTest AS
SELECT * FROM TRANSACTIONS t
WHERE t.Patient_ID BETWEEN 279201 AND 558352;

-- get the diabetes patient_id
CREATE TABLE Diabetes_Patients AS
SELECT DISTINCT a.Patient_ID
FROM TRANSACTIONS a
INNER JOIN CHRONIC_ILLNESS b
ON a.Drug_ID = b.MasterProductID WHERE b.ChronicIllness = 'Diabetes'
AND a.prescription_week >= '2016-01-01';

-- feature calculation: past prescription
CREATE TABLE TRANS_Flag_T
(
patient_id INT,
trans_all SMALLINT,
trans_Lipids SMALLINT,
trans_Hypertension SMALLINT,
trans_Depression SMALLINT,
trans_Diabetes SMALLINT,
trans_HeartFailure SMALLINT);

INSERT INTO TRANS_Flag_T(patient_id,trans_all,trans_Lipids,trans_Hypertension,trans_Depression,trans_Diabetes,trans_HeartFailure)
SELECT t.patient_id,
COUNT(*) AS trans_all,
SUM(CASE WHEN ill.ChronicIllness='Lipids' THEN 1 ELSE 0 END),
SUM(CASE WHEN ill.ChronicIllness='Hypertension' THEN 1 ELSE 0 END),
SUM(CASE WHEN ill.ChronicIllness='Depression' THEN 1 ELSE 0 END),
SUM(CASE WHEN ill.ChronicIllness='Diabetes' THEN 1 ELSE 0 END),
SUM(CASE WHEN ill.ChronicIllness='Heart Failure' THEN 1 ELSE 0 END)
FROM TRANS_T t
INNER JOIN CHRONIC_ILLNESS ill
on t.Drug_ID = ill.MasterProductID WHERE t.prescription_week < '2016-01-01' GROUP BY 1;

CREATE TABLE TRANS_Flag_D
(
patient_id INT,
trans_all SMALLINT,
trans_Lipids SMALLINT,
trans_Hypertension SMALLINT,
trans_Depression SMALLINT,
trans_Diabetes SMALLINT,
trans_HeartFailure SMALLINT);

INSERT INTO TRANS_Flag_D(patient_id,trans_all,trans_Lipids,trans_Hypertension,trans_Depression,trans_Diabetes,trans_HeartFailure)
SELECT t.patient_id,
COUNT(*) AS trans_all,
SUM(CASE WHEN ill.ChronicIllness='Lipids' THEN 1 ELSE 0 END),
SUM(CASE WHEN ill.ChronicIllness='Hypertension' THEN 1 ELSE 0 END),
SUM(CASE WHEN ill.ChronicIllness='Depression' THEN 1 ELSE 0 END),
SUM(CASE WHEN ill.ChronicIllness='Diabetes' THEN 1 ELSE 0 END),
SUM(CASE WHEN ill.ChronicIllness='Heart Failure' THEN 1 ELSE 0 END)
FROM TRANS_D t
INNER JOIN CHRONIC_ILLNESS ill
on t.Drug_ID = ill.MasterProductID WHERE t.prescription_week < '2016-01-01' GROUP BY 1;

CREATE TABLE TRANS_Flag_FinalTest
(
patient_id INT,
trans_all SMALLINT,
trans_Lipids SMALLINT,
trans_Hypertension SMALLINT,
trans_Depression SMALLINT,
trans_Diabetes SMALLINT,
trans_HeartFailure SMALLINT);

INSERT INTO TRANS_Flag_FinalTest(patient_id,trans_all,trans_Lipids,trans_Hypertension,trans_Depression,trans_Diabetes,trans_HeartFailure)
SELECT t.patient_id,
COUNT(*) AS trans_all,
SUM(CASE WHEN ill.ChronicIllness='Lipids' THEN 1 ELSE 0 END),
SUM(CASE WHEN ill.ChronicIllness='Hypertension' THEN 1 ELSE 0 END),
SUM(CASE WHEN ill.ChronicIllness='Depression' THEN 1 ELSE 0 END),
SUM(CASE WHEN ill.ChronicIllness='Diabetes' THEN 1 ELSE 0 END),
SUM(CASE WHEN ill.ChronicIllness='Heart Failure' THEN 1 ELSE 0 END)
FROM TRANS_FinalTest t
INNER JOIN CHRONIC_ILLNESS ill
on t.Drug_ID = ill.MasterProductID WHERE t.prescription_week < '2016-01-01' GROUP BY 1;

-- feature calculation: patient info
CREATE TABLE TRAIN
(patient_id INT,
gender_F SMALLINT,
gender_M SMALLINT,
year_of_birth SMALLINT,
state_code varchar(3),
trans_all SMALLINT,
trans_Lipids SMALLINT,
trans_Hypertension SMALLINT,
trans_Depression SMALLINT,
trans_Diabetes SMALLINT,
trans_HeartFailure SMALLINT,
tgt SMALLINT
);

INSERT INTO TRAIN
SELECT p.patient_id,
CASE WHEN p.gender='F' THEN 1 ELSE 0 END,
CASE WHEN p.gender='M' THEN 1 ELSE 0 END,
-- CASE WHEN p.gender='U' THEN NULL ELSE p.gender END AS gender,
p.year_of_birth,
substr(p.postcode,1,1) AS state_code,
-- flags from above
COALESCE(tf.trans_all,0),
COALESCE(tf.trans_Lipids,0),
COALESCE(tf.trans_Hypertension,0),
COALESCE(tf.trans_Depression,0),
COALESCE(tf.trans_Diabetes,0),
COALESCE(tf.trans_HeartFailure,0),
CASE WHEN res.Patient_ID IS NULL THEN 0 ELSE 1 END
FROM PATIENTS p
LEFT JOIN TRANS_Flag_T tf AND tmp_outcomes2016 res
	ON p.patient_id = tf.patient_id AND p.patient_id=res.patient_id
WHERE p.patient_id < 259201;

CREATE TABLE TEST
(patient_id INT,
gender_F SMALLINT,
gender_M SMALLINT,
year_of_birth SMALLINT,
state_code varchar(3),
trans_all SMALLINT,
trans_Lipids SMALLINT,
trans_Hypertension SMALLINT,
trans_Depression SMALLINT,
trans_Diabetes SMALLINT,
trans_HeartFailure SMALLINT,
tgt SMALLINT
);

INSERT INTO TEST
SELECT p.patient_id,
CASE WHEN p.gender='F' THEN 1 ELSE 0 END,
CASE WHEN p.gender='M' THEN 1 ELSE 0 END,
p.year_of_birth,
substr(p.postcode,1,1) AS state_code,
-- flags from above
COALESCE(tf.trans_all,0),
COALESCE(tf.trans_Lipids,0),
COALESCE(tf.trans_Hypertension,0),
COALESCE(tf.trans_Depression,0),
COALESCE(tf.trans_Diabetes,0),
COALESCE(tf.trans_HeartFailure,0),
CASE WHEN res.Patient_ID IS NULL THEN 0 ELSE 1 END
FROM PATIENTS p
LEFT JOIN TRANS_Flag_D tf AND tmp_outcomes2016 res
	ON p.patient_id = tf.patient_id AND p.patient_id=res.patient_id
WHERE p.patient_id BETWEEN 259201 AND 279200;

CREATE TABLE TEST_Final
(patient_id INT,
gender_F SMALLINT,
gender_M SMALLINT,
year_of_birth SMALLINT,
state_code varchar(3),
trans_all SMALLINT,
trans_Lipids SMALLINT,
trans_Hypertension SMALLINT,
trans_Depression SMALLINT,
trans_Diabetes SMALLINT,
trans_HeartFailure SMALLINT
);

INSERT INTO TEST_Final
SELECT p.patient_id,
CASE WHEN p.gender='F' THEN 1 ELSE 0 END,
CASE WHEN p.gender='M' THEN 1 ELSE 0 END,
p.year_of_birth,
substr(p.postcode,1,1) AS state_code,
-- flags from above
COALESCE(tf.trans_all,0),
COALESCE(tf.trans_Lipids,0),
COALESCE(tf.trans_Hypertension,0),
COALESCE(tf.trans_Depression,0),
COALESCE(tf.trans_Diabetes,0),
COALESCE(tf.trans_HeartFailure,0)
FROM PATIENTS p
LEFT JOIN TRANS_Flag_FinalTest tf
	ON p.patient_id = tf.patient_id
WHERE p.patient_id BETWEEN 279201 AND 558353;



