CREATE TABLE TRANSACTIONS
(
	Patient_ID	int
,	Store_ID	smallint
,	Prescriber_ID	int
,	Drug_ID	smallint
,	SourceSystem_Code	varchar(1)
,	Prescription_Week	DATE
,	Dispense_Week	DATE
,	Drug_Code	varchar(37)
,	NHS_Code	varchar(6)
,	IsDeferredScript	tinyint
,	Script_Qty	smallint
,	Dispensed_Qty	smallint
,	MaxDispense_Qty	smallint
,	PatientPrice_Amt	float
,	WholeSalePrice_Amt	float
,	GovernmentReclaim_Amt	float
,	RepeatsTotal_Qty	smallint
,	RepeatsLeft_Qty	smallint
,	StreamlinedApproval_Code	smallint
);

LOAD DATA LOCAL INFILE './MelbDatathon2017/Transactions/patients_1.txt' INTO TABLE TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/Transactions/patients_2.txt' INTO TABLE TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/Transactions/patients_3.txt' INTO TABLE TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/Transactions/patients_4.txt' INTO TABLE TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/Transactions/patients_5.txt' INTO TABLE TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/Transactions/patients_6.txt' INTO TABLE TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/Transactions/patients_7.txt' INTO TABLE TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/Transactions/patients_8.txt' INTO TABLE TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/Transactions/patients_9.txt' INTO TABLE TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/Transactions/patients_10.txt' INTO TABLE TRANSACTIONS
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE './MelbDatathon2017/Transactions/patients_11.txt' INTO TABLE TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/Transactions/patients_12.txt' INTO TABLE TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/Transactions/patients_13.txt' INTO TABLE TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/Transactions/patients_14.txt' INTO TABLE TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/Transactions/patients_15.txt' INTO TABLE TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/Transactions/patients_16.txt' INTO TABLE TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/Transactions/patients_17.txt' INTO TABLE TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/Transactions/patients_18.txt' INTO TABLE TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/Transactions/patients_19.txt' INTO TABLE TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/Transactions/patients_20.txt' INTO TABLE TRANSACTIONS
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE './MelbDatathon2017/Transactions/patients_21.txt' INTO TABLE TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/Transactions/patients_22.txt' INTO TABLE TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/Transactions/patients_23.txt' INTO TABLE TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/Transactions/patients_24.txt' INTO TABLE TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/Transactions/patients_25.txt' INTO TABLE TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/Transactions/patients_26.txt' INTO TABLE TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/Transactions/patients_27.txt' INTO TABLE TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/Transactions/patients_28.txt' INTO TABLE TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/Transactions/patients_29.txt' INTO TABLE TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/Transactions/patients_30.txt' INTO TABLE TRANSACTIONS
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE './MelbDatathon2017/Transactions/patients_31.txt' INTO TABLE TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/Transactions/patients_32.txt' INTO TABLE TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/Transactions/patients_33.txt' INTO TABLE TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/Transactions/patients_34.txt' INTO TABLE TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/Transactions/patients_35.txt' INTO TABLE TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/Transactions/patients_36.txt' INTO TABLE TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/Transactions/patients_37.txt' INTO TABLE TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/Transactions/patients_38.txt' INTO TABLE TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/Transactions/patients_39.txt' INTO TABLE TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/Transactions/patients_40.txt' INTO TABLE TRANSACTIONS
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE './MelbDatathon2017/Transactions/patients_41.txt' INTO TABLE TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/Transactions/patients_42.txt' INTO TABLE TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/Transactions/patients_43.txt' INTO TABLE TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/Transactions/patients_44.txt' INTO TABLE TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/Transactions/patients_45.txt' INTO TABLE TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/Transactions/patients_46.txt' INTO TABLE TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/Transactions/patients_47.txt' INTO TABLE TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/Transactions/patients_48.txt' INTO TABLE TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/Transactions/patients_49.txt' INTO TABLE TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/Transactions/patients_50.txt' INTO TABLE TRANSACTIONS
IGNORE 1 LINES;

CREATE TABLE PATIENTS
(
	Patient_ID	int
,	gender	varchar(1)
,	year_of_birth	smallint
,	postcode	varchar(4) 
);

LOAD DATA LOCAL INFILE './MelbDatathon2017/Lookups/patients.txt' INTO TABLE PATIENTS
IGNORE 1 LINES;

CREATE TABLE STORES
(
	Store_ID	smallint
,	StateCode	varchar(3)
,	postcode	varchar(4)
);

LOAD DATA LOCAL INFILE './MelbDatathon2017/Lookups/stores.txt' INTO TABLE STORES
IGNORE 1 LINES;

CREATE TABLE DRUG
(
	MasterProductID	smallint
,	MasterProductCode	varchar(9)
,	MasterProductFullName	varchar(61)
,	BrandName	varchar(30)
,	FormCode	varchar(10)
,	StrengthCode	varchar(21)
,	PackSizeNumber	smallint
,	GenericIngredientName	varchar(30)
,	EthicalSubCategoryName	varchar(21)
,	EthicalCategoryName	varchar(16)
,	ManufacturerCode	varchar(9)
,	ManufacturerName	varchar(27)
,	ManufacturerGroupID	smallint
,	ManufacturerGroupCode	varchar(43)
,	ChemistListPrice	float
,	ATCLevel5Code	varchar(7)
,	ATCLevel4Code	varchar(5)
,	ATCLevel3Code	varchar(4)
,	ATCLevel2Code	varchar(3)
,	ATCLevel1Code	varchar(2)
);

LOAD DATA LOCAL INFILE './MelbDatathon2017/Lookups/Drug_LookUp.txt' INTO TABLE DRUG
IGNORE 1 LINES;

CREATE TABLE CHRONIC_ILLNESS
(
	ChronicIllness	varchar(44)
,	MasterProductID	smallint
,	MasterProductFullName	varchar(59)
);

LOAD DATA LOCAL INFILE './MelbDatathon2017/Lookups/ChronicIllness_LookUp.txt' INTO TABLE CHRONIC_ILLNESS
IGNORE 1 LINES;

CREATE TABLE ATC
(
	ATCLevel1Code	varchar(2)
,	ATCLevel1Name	varchar(63)
,	ATCLevel2Code	varchar(3)
,	ATCLevel2Name	varchar(64)
,	ATCLevel3Code	varchar(4)
,	ATCLevel3Name	varchar(71)
,	ATCLevel4Code	varchar(5)
,	ATCLevel4Name	varchar(92)
,	ATCLevel5Code	varchar(7)
,	ATCLevel5Name	varchar(78)
);

LOAD DATA LOCAL INFILE './MelbDatathon2017/Lookups/ATC_LookUp.txt' INTO TABLE ATC
IGNORE 1 LINES;

CREATE TABLE M_TRANSACTIONS
(
	Patient_ID	int
,	Store_ID	smallint
,	Prescriber_ID	int
,	Drug_ID	smallint
,	SourceSystem_Code	varchar(1)
,	Prescription_Week	DATE
,	Dispense_Week	DATE
,	Drug_Code	varchar(37)
,	NHS_Code	varchar(6)
,	IsDeferredScript	varchar(1)
,	Script_Qty	smallint
,	Dispensed_Qty	smallint
,	MaxDispense_Qty	smallint
,	PatientPrice_Amt	float
,	WholeSalePrice_Amt	float
,	GovernmentReclaim_Amt	float
,	RepeatsTotal_Qty	smallint
,	RepeatsLeft_Qty	smallint
,	StreamlinedApproval_Code	smallint
);

LOAD DATA LOCAL INFILE './MelbDatathon2017/MISSING_TRANSACTIONS/missing_patients_1.txt' INTO TABLE M_TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/MISSING_TRANSACTIONS/missing_patients_2.txt' INTO TABLE M_TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/MISSING_TRANSACTIONS/missing_patients_3.txt' INTO TABLE M_TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/MISSING_TRANSACTIONS/missing_patients_4.txt' INTO TABLE M_TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/MISSING_TRANSACTIONS/missing_patients_5.txt' INTO TABLE M_TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/MISSING_TRANSACTIONS/missing_patients_6.txt' INTO TABLE M_TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/MISSING_TRANSACTIONS/missing_patients_7.txt' INTO TABLE M_TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/MISSING_TRANSACTIONS/missing_patients_8.txt' INTO TABLE M_TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/MISSING_TRANSACTIONS/missing_patients_9.txt' INTO TABLE M_TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/MISSING_TRANSACTIONS/missing_patients_10.txt' INTO TABLE M_TRANSACTIONS
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE './MelbDatathon2017/MISSING_TRANSACTIONS/missing_patients_11.txt' INTO TABLE M_TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/MISSING_TRANSACTIONS/missing_patients_12.txt' INTO TABLE M_TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/MISSING_TRANSACTIONS/missing_patients_13.txt' INTO TABLE M_TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/MISSING_TRANSACTIONS/missing_patients_14.txt' INTO TABLE M_TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/MISSING_TRANSACTIONS/missing_patients_15.txt' INTO TABLE M_TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/MISSING_TRANSACTIONS/missing_patients_16.txt' INTO TABLE M_TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/MISSING_TRANSACTIONS/missing_patients_17.txt' INTO TABLE M_TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/MISSING_TRANSACTIONS/missing_patients_18.txt' INTO TABLE M_TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/MISSING_TRANSACTIONS/missing_patients_19.txt' INTO TABLE M_TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/MISSING_TRANSACTIONS/missing_patients_20.txt' INTO TABLE M_TRANSACTIONS
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE './MelbDatathon2017/MISSING_TRANSACTIONS/missing_patients_21.txt' INTO TABLE M_TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/MISSING_TRANSACTIONS/missing_patients_22.txt' INTO TABLE M_TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/MISSING_TRANSACTIONS/missing_patients_23.txt' INTO TABLE M_TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/MISSING_TRANSACTIONS/missing_patients_24.txt' INTO TABLE M_TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/MISSING_TRANSACTIONS/missing_patients_25.txt' INTO TABLE M_TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/MISSING_TRANSACTIONS/missing_patients_26.txt' INTO TABLE M_TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/MISSING_TRANSACTIONS/missing_patients_27.txt' INTO TABLE M_TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/MISSING_TRANSACTIONS/missing_patients_28.txt' INTO TABLE M_TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/MISSING_TRANSACTIONS/missing_patients_29.txt' INTO TABLE M_TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/MISSING_TRANSACTIONS/missing_patients_30.txt' INTO TABLE M_TRANSACTIONS
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE './MelbDatathon2017/MISSING_TRANSACTIONS/missing_patients_31.txt' INTO TABLE M_TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/MISSING_TRANSACTIONS/missing_patients_32.txt' INTO TABLE M_TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/MISSING_TRANSACTIONS/missing_patients_33.txt' INTO TABLE M_TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/MISSING_TRANSACTIONS/missing_patients_34.txt' INTO TABLE M_TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/MISSING_TRANSACTIONS/missing_patients_35.txt' INTO TABLE M_TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/MISSING_TRANSACTIONS/missing_patients_36.txt' INTO TABLE M_TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/MISSING_TRANSACTIONS/missing_patients_37.txt' INTO TABLE M_TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/MISSING_TRANSACTIONS/missing_patients_38.txt' INTO TABLE M_TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/MISSING_TRANSACTIONS/missing_patients_39.txt' INTO TABLE M_TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/MISSING_TRANSACTIONS/missing_patients_40.txt' INTO TABLE M_TRANSACTIONS
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE './MelbDatathon2017/MISSING_TRANSACTIONS/missing_patients_41.txt' INTO TABLE M_TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/MISSING_TRANSACTIONS/missing_patients_42.txt' INTO TABLE M_TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/MISSING_TRANSACTIONS/missing_patients_43.txt' INTO TABLE M_TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/MISSING_TRANSACTIONS/missing_patients_44.txt' INTO TABLE M_TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/MISSING_TRANSACTIONS/missing_patients_45.txt' INTO TABLE M_TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/MISSING_TRANSACTIONS/missing_patients_46.txt' INTO TABLE M_TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/MISSING_TRANSACTIONS/missing_patients_47.txt' INTO TABLE M_TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/MISSING_TRANSACTIONS/missing_patients_48.txt' INTO TABLE M_TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/MISSING_TRANSACTIONS/missing_patients_49.txt' INTO TABLE M_TRANSACTIONS
IGNORE 1 LINES;
LOAD DATA LOCAL INFILE './MelbDatathon2017/MISSING_TRANSACTIONS/missing_patients_50.txt' INTO TABLE M_TRANSACTIONS
IGNORE 1 LINES;

INSERT INTO TRANSACTIONS(Patient_ID,Store_ID,Prescriber_ID,Drug_ID,SourceSystem_Code,Prescription_Week,Dispense_Week,Drug_Code,NHS_Code,IsDeferredScript,Script_Qty,Dispensed_Qty,MaxDispense_Qty,PatientPrice_Amt,WholeSalePrice_Amt,GovernmentReclaim_Amt,RepeatsTotal_Qty,RepeatsLeft_Qty,StreamlinedApproval_Code)
SELECT 	m.Patient_ID,
m.Store_ID,
m.Prescriber_ID,
m.Drug_ID,
m.SourceSystem_Code,
m.Prescription_Week,
m.Dispense_Week,
m.Drug_Code,
m.NHS_Code,
CASE WHEN m.IsDeferredScript='T' THEN 1 ELSE 0 END,
m.Script_Qty,
m.Dispensed_Qty,
m.MaxDispense_Qty,
m.PatientPrice_Amt,
m.WholeSalePrice_Amt,
m.GovernmentReclaim_Amt,
m.RepeatsTotal_Qty,
m.RepeatsLeft_Qty,
m.StreamlinedApproval_Code
FROM M_TRANSACTIONS m;

-- add geographic information for each postcode
CREATE TABLE GEO
(postcode varchar(4),
suburb varchar(35),
state varchar(3),
latitude FLOAT,
longtitude FLOAT
);

LOAD DATA LOCAL INFILE './MelbDatathon2017/postcodes.txt' INTO TABLE GEO
IGNORE 1 LINES;