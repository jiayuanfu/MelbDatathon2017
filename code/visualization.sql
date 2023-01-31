-- Q5
CREATE TABLE Q5_AgeGroup
(postcode VARCHAR(4),
0_14 INT,
15_24 INT,
25_44 INT,
45_64 INT,
65_ INT,
U INT
);

INSERT INTO Q5_AgeGroup
SELECT p.postcode,
SUM(CASE WHEN p.year_of_birth>= 2003 THEN 1 ELSE 0 END),
SUM(CASE WHEN p.year_of_birth BETWEEN 1993 AND 2002 THEN 1 ELSE 0 END),
SUM(CASE WHEN p.year_of_birth BETWEEN 1973 AND 1992 THEN 1 ELSE 0 END),
SUM(CASE WHEN p.year_of_birth BETWEEN 1953 AND 1972 THEN 1 ELSE 0 END),
SUM(CASE WHEN p.year_of_birth BETWEEN 1901 AND 1932 THEN 1 ELSE 0 END),
SUM(CASE WHEN p.year_of_birth=1900 THEN 1 ELSE 0 END)
FROM PATIENTS p
GROUP BY p.postcode;

-- Q7
CREATE TABLE A
(postcode VARCHAR(4),
patients_cnt INT);

INSERT INTO A
SELECT p.postcode,
COUNT(Patient_ID)
FROM PATIENTS p
GROUP BY p.postcode;

CREATE TABLE B
(postcode VARCHAR(4),
stores_cnt INT);

INSERT INTO B
SELECT s.postcode,
COUNT(Store_ID)
FROM STORES s
GROUP BY s.postcode;

CREATE TABLE Q7_PostcodePatient
(postcode VARCHAR(4),
patients_cnt INT,
stores_cnt INT);

INSERT INTO Q7_PostcodePatient
SELECT a.postcode,
a.patients_cnt,
b.stores_cnt
FROM A a LEFT JOIN B b
on a.postcode = b.postcode;

CREATE TABLE C
(postcode varchar(4),
patients_cnt INT,
stores_cnt INT,
patients_bystores FLOAT
);

INSERT INTO C
SELECT q.postcode,
q.patients_cnt,
COALESCE(q.stores_cnt,0),
q.patients_cnt/q.stores_cnt
FROM Q7_PostcodePatient q;

CREATE TABLE Q7_NewStores
(postcode varchar(4),
patients_cnt INT,
stores_cnt INT,
patients_bystores FLOAT,
NewStore_qty FLOAT
);

INSERT INTO Q7_NewStores
SELECT c.postcode,
c.patients_cnt,
c.stores_cnt,
c.patients_bystores,
CASE WHEN c.patients_bystores > 218.9616 THEN (c.patients_cnt/218.9626)-c.stores_cnt
WHEN c.patients_bystores = NULL THEN c.patients_cnt/218.9626 ELSE 0 END
FROM C c

-- Q8
CREATE TABLE Q8_Trans AS
SELECT *
FROM TRANSACTIONS t
WHERE t.Prescription_Week > t.Dispense_Week;

CREATE TABLE A AS 
SELECT t.Store_ID,
COUNT(*) AS trans_all,
SUM(CASE WHEN ill.ChronicIllness='Lipids' THEN 1 ELSE 0 END) AS trans_Lipids,
SUM(CASE WHEN ill.ChronicIllness='Hypertension' THEN 1 ELSE 0 END) AS trans_Hypertension,
SUM(CASE WHEN ill.ChronicIllness='Depression' THEN 1 ELSE 0 END) AS trans_Depression,
SUM(CASE WHEN ill.ChronicIllness='Diabetes' THEN 1 ELSE 0 END) AS trans_Diabetes,
SUM(CASE WHEN ill.ChronicIllness='Heart Failure' THEN 1 ELSE 0 END) AS trans_HeartFailure
FROM Q8_Trans t
INNER JOIN CHRONIC_ILLNESS ill
on t.Drug_ID = ill.MasterProductID
GROUP BY 1;

CREATE TABLE B AS
SELECT a.*
FROM A a WHERE a.Store_ID > 0 and a.trans_all >1;

CREATE TABLE Q8_PstcodeIllness AS
SELECT s.postcode AS postcode,
SUM(b.trans_all) AS trans_all,
SUM(b.trans_Lipids) AS trans_Lipids,
SUM(b.trans_Hypertension) AS trans_Hypertension,
SUM(b.trans_Depression) AS trans_Depression,
SUM(b.trans_Diabetes) AS trans_Diabetes,
SUM(b.trans_HeartFailure) AS trans_HeartFailure
FROM B b INNER JOIN STORES s
ON b.Store_ID = s.Store_ID GROUP BY 1;

-- Q9
CREATE TABLE TRANS_VIC AS
SELECT t.* 
FROM TRANSACTIONS t INNER JOIN STORES s
ON t.Store_ID = s.Store_ID
WHERE s.StateCode = 'VIC';

CREATE TABLE Q9_DispensedQty AS
SELECT t.* 
FROM TRANSACTIONS t
WHERE t.Dispensed_Qty > t.MaxDispense_Qty AND t.MaxDispense_Qty >0;

-- V1
CREATE TABLE A AS
SELECT t.Drug_ID,
COUNT(*) AS trans_Drug
FROM TRANS_VIC t GROUP BY 1 ORDER BY trans_Drug DESC;

CREATE TABLE V1_Popular_Drugs AS
SELECT a.Drug_ID,
c.ChronicIllness,
a.trans_Drug
FROM A a INNER JOIN CHRONIC_ILLNESS c
ON a.Drug_ID = c.MasterProductID;

-- V2
CREATE TABLE A AS
SELECT t.Drug_ID,
t.Store_ID,
t.Dispense_Week,
(t.Dispensed_Qty*t.PatientPrice_Amt) AS Income,
(t.Dispensed_Qty*(t.PatientPrice_Amt-t.WholeSalePrice_Amt/d.PackSizeNumber))As Profit
FROM TRANS_VIC t INNER JOIN DRUG d
ON t.Drug_ID = d.MasterProductID
ORDER BY t.Store_ID ASC;

CREATE TABLE A_Profit AS
SELECT a.Store_ID,
SUM(a.Income) AS Income_all,
SUM(CASE WHEN a.Dispense_Week BETWEEN '2011-01-01' AND '2011-12-31' THEN a.Income ELSE 0 END) AS Income_2011,
SUM(CASE WHEN a.Dispense_Week BETWEEN '2012-01-01' AND '2012-12-31' THEN a.Income ELSE 0 END) AS Income_2012,
SUM(CASE WHEN a.Dispense_Week BETWEEN '2013-01-01' AND '2013-12-31' THEN a.Income ELSE 0 END) AS Income_2013,
SUM(CASE WHEN a.Dispense_Week BETWEEN '2014-01-01' AND '2014-12-31' THEN a.Income ELSE 0 END) AS Income_2014,
SUM(CASE WHEN a.Dispense_Week BETWEEN '2015-01-01' AND '2015-12-31' THEN a.Income ELSE 0 END) AS Income_2015,
SUM(CASE WHEN a.Dispense_Week BETWEEN '2016-01-01' AND '2016-12-31' THEN a.Income ELSE 0 END) AS Income_2016,
SUM(a.Profit) AS Profit_all,
SUM(CASE WHEN a.Dispense_Week BETWEEN '2011-01-01' AND '2011-12-31' THEN a.Profit ELSE 0 END) AS Profit_2011,
SUM(CASE WHEN a.Dispense_Week BETWEEN '2012-01-01' AND '2012-12-31' THEN a.Profit ELSE 0 END) AS Profit_2012,
SUM(CASE WHEN a.Dispense_Week BETWEEN '2013-01-01' AND '2013-12-31' THEN a.Profit ELSE 0 END) AS Profit_2013,
SUM(CASE WHEN a.Dispense_Week BETWEEN '2014-01-01' AND '2014-12-31' THEN a.Profit ELSE 0 END) AS Profit_2014,
SUM(CASE WHEN a.Dispense_Week BETWEEN '2015-01-01' AND '2015-12-31' THEN a.Profit ELSE 0 END) AS Profit_2015,
SUM(CASE WHEN a.Dispense_Week BETWEEN '2016-01-01' AND '2016-12-31' THEN a.Profit ELSE 0 END) AS Profit_2016
FROM A a GROUP BY 1;

CREATE TABLE A_IncomeProfit AS
SELECT a.Store_ID,
s.postcode,
s.IsBannerGroup,
a.Income_all,
a.Income_2011,
a.Income_2012,
a.Income_2013,
a.Income_2014,
a.Income_2015,
a.Income_2016,
a.Profit_all,
a.Profit_2011,
a.Profit_2012,
a.Profit_2013,
a.Profit_2014,
a.Profit_2015,
a.Profit_2016
FROM A_Profit a INNER JOIN STORES s
ON a.Store_ID = s.Store_ID 
ORDER BY s.postcode ASC;

CREATE TABLE B AS
SELECT a.postcode,
SUM(CASE WHEN a.Income_2011 != 0 THEN a.Income_2011 ELSE 0 END) AS Income_Postcode_2011,
SUM(CASE WHEN a.Income_2011 != 0 THEN 1 ELSE 0 END) AS IStore_qty_2011,
SUM(CASE WHEN a.Income_2012 != 0 THEN a.Income_2012 ELSE 0 END) AS Income_Postcode_2012,
SUM(CASE WHEN a.Income_2012 != 0 THEN 1 ELSE 0 END) AS IStore_qty_2012,
SUM(CASE WHEN a.Income_2013 != 0 THEN a.Income_2013 ELSE 0 END) AS Income_Postcode_2013,
SUM(CASE WHEN a.Income_2013 != 0 THEN 1 ELSE 0 END) AS IStore_qty_2013,
SUM(CASE WHEN a.Income_2014 != 0 THEN a.Income_2014 ELSE 0 END) AS Income_Postcode_2014,
SUM(CASE WHEN a.Income_2014 != 0 THEN 1 ELSE 0 END) AS IStore_qty_2014,
SUM(CASE WHEN a.Income_2015 != 0 THEN a.Income_2015 ELSE 0 END) AS Income_Postcode_2015,
SUM(CASE WHEN a.Income_2015 != 0 THEN 1 ELSE 0 END) AS IStore_qty_2015,
SUM(CASE WHEN a.Income_2016 != 0 THEN a.Income_2016 ELSE 0 END) AS Income_Postcode_2016,
SUM(CASE WHEN a.Income_2016 != 0 THEN 1 ELSE 0 END) AS IStore_qty_2016,
SUM(CASE WHEN a.Profit_2011 != 0 THEN a.Profit_2011 ELSE 0 END) AS Profit_Postcode_2011,
SUM(CASE WHEN a.Profit_2011 != 0 THEN 1 ELSE 0 END) AS PStore_qty_2011,
SUM(CASE WHEN a.Profit_2012 != 0 THEN a.Profit_2012 ELSE 0 END) AS Profit_Postcode_2012,
SUM(CASE WHEN a.Profit_2012 != 0 THEN 1 ELSE 0 END) AS PStore_qty_2012,
SUM(CASE WHEN a.Profit_2013 != 0 THEN a.Profit_2013 ELSE 0 END) AS Profit_Postcode_2013,
SUM(CASE WHEN a.Profit_2013 != 0 THEN 1 ELSE 0 END) AS PStore_qty_2013,
SUM(CASE WHEN a.Profit_2014 != 0 THEN a.Profit_2014 ELSE 0 END) AS Profit_Postcode_2014,
SUM(CASE WHEN a.Profit_2014 != 0 THEN 1 ELSE 0 END) AS PStore_qty_2014,
SUM(CASE WHEN a.Profit_2015 != 0 THEN a.Profit_2015 ELSE 0 END) AS Profit_Postcode_2015,
SUM(CASE WHEN a.Profit_2015 != 0 THEN 1 ELSE 0 END) AS PStore_qty_2015,
SUM(CASE WHEN a.Profit_2016 != 0 THEN a.Profit_2016 ELSE 0 END) AS Profit_Postcode_2016,
SUM(CASE WHEN a.Profit_2016 != 0 THEN 1 ELSE 0 END) AS PStore_qty_2016
FROM A_IncomeProfit a
GROUP BY 1;

CREATE TABLE V2_AvgIncomeProfit AS
SELECT b.postcode,
(CASE WHEN b.Income_Postcode_2011 != 0 THEN b.Income_Postcode_2011/b.IStore_qty_2011 ELSE NULL END) AS AvgIncome_2011,
(CASE WHEN b.Income_Postcode_2012 != 0 THEN b.Income_Postcode_2012/b.IStore_qty_2012 ELSE NULL END) AS AvgIncome_2012,
(CASE WHEN b.Income_Postcode_2013 != 0 THEN b.Income_Postcode_2013/b.IStore_qty_2013 ELSE NULL END) AS AvgIncome_2013,
(CASE WHEN b.Income_Postcode_2014 != 0 THEN b.Income_Postcode_2014/b.IStore_qty_2014 ELSE NULL END) AS AvgIncome_2014,
(CASE WHEN b.Income_Postcode_2015 != 0 THEN b.Income_Postcode_2015/b.IStore_qty_2015 ELSE NULL END) AS AvgIncome_2015,
(CASE WHEN b.Income_Postcode_2016 != 0 THEN b.Income_Postcode_2016/b.IStore_qty_2016 ELSE NULL END) AS AvgIncome_2016,
(CASE WHEN b.Profit_Postcode_2011 != 0 THEN b.Profit_Postcode_2011/b.PStore_qty_2011 ELSE NULL END) AS AvgProfit_2011,
(CASE WHEN b.Profit_Postcode_2012 != 0 THEN b.Profit_Postcode_2012/b.PStore_qty_2012 ELSE NULL END) AS AvgProfit_2012,
(CASE WHEN b.Profit_Postcode_2013 != 0 THEN b.Profit_Postcode_2013/b.PStore_qty_2013 ELSE NULL END) AS AvgProfit_2013,
(CASE WHEN b.Profit_Postcode_2014 != 0 THEN b.Profit_Postcode_2014/b.PStore_qty_2014 ELSE NULL END) AS AvgProfit_2014,
(CASE WHEN b.Profit_Postcode_2015 != 0 THEN b.Profit_Postcode_2015/b.PStore_qty_2015 ELSE NULL END) AS AvgProfit_2015,
(CASE WHEN b.Profit_Postcode_2016 != 0 THEN b.Profit_Postcode_2016/b.PStore_qty_2016 ELSE NULL END) AS AvgProfit_2016
FROM B b;

-- V3
CREATE TABLE A AS
SELECT b.*
FROM A_IncomeProfit b
ORDER BY b.IsBannerGroup ASC;

CREATE TABLE B AS
SELECT a.IsBannerGroup,
SUM(CASE WHEN a.Income_2011 != 0 THEN a.Income_2011 ELSE 0 END) AS Income_Postcode_2011,
SUM(CASE WHEN a.Income_2011 != 0 THEN 1 ELSE 0 END) AS IStore_qty_2011,
SUM(CASE WHEN a.Income_2012 != 0 THEN a.Income_2012 ELSE 0 END) AS Income_Postcode_2012,
SUM(CASE WHEN a.Income_2012 != 0 THEN 1 ELSE 0 END) AS IStore_qty_2012,
SUM(CASE WHEN a.Income_2013 != 0 THEN a.Income_2013 ELSE 0 END) AS Income_Postcode_2013,
SUM(CASE WHEN a.Income_2013 != 0 THEN 1 ELSE 0 END) AS IStore_qty_2013,
SUM(CASE WHEN a.Income_2014 != 0 THEN a.Income_2014 ELSE 0 END) AS Income_Postcode_2014,
SUM(CASE WHEN a.Income_2014 != 0 THEN 1 ELSE 0 END) AS IStore_qty_2014,
SUM(CASE WHEN a.Income_2015 != 0 THEN a.Income_2015 ELSE 0 END) AS Income_Postcode_2015,
SUM(CASE WHEN a.Income_2015 != 0 THEN 1 ELSE 0 END) AS IStore_qty_2015,
SUM(CASE WHEN a.Income_2016 != 0 THEN a.Income_2016 ELSE 0 END) AS Income_Postcode_2016,
SUM(CASE WHEN a.Income_2016 != 0 THEN 1 ELSE 0 END) AS IStore_qty_2016,
SUM(CASE WHEN a.Profit_2011 != 0 THEN a.Profit_2011 ELSE 0 END) AS Profit_Postcode_2011,
SUM(CASE WHEN a.Profit_2011 != 0 THEN 1 ELSE 0 END) AS PStore_qty_2011,
SUM(CASE WHEN a.Profit_2012 != 0 THEN a.Profit_2012 ELSE 0 END) AS Profit_Postcode_2012,
SUM(CASE WHEN a.Profit_2012 != 0 THEN 1 ELSE 0 END) AS PStore_qty_2012,
SUM(CASE WHEN a.Profit_2013 != 0 THEN a.Profit_2013 ELSE 0 END) AS Profit_Postcode_2013,
SUM(CASE WHEN a.Profit_2013 != 0 THEN 1 ELSE 0 END) AS PStore_qty_2013,
SUM(CASE WHEN a.Profit_2014 != 0 THEN a.Profit_2014 ELSE 0 END) AS Profit_Postcode_2014,
SUM(CASE WHEN a.Profit_2014 != 0 THEN 1 ELSE 0 END) AS PStore_qty_2014,
SUM(CASE WHEN a.Profit_2015 != 0 THEN a.Profit_2015 ELSE 0 END) AS Profit_Postcode_2015,
SUM(CASE WHEN a.Profit_2015 != 0 THEN 1 ELSE 0 END) AS PStore_qty_2015,
SUM(CASE WHEN a.Profit_2016 != 0 THEN a.Profit_2016 ELSE 0 END) AS Profit_Postcode_2016,
SUM(CASE WHEN a.Profit_2016 != 0 THEN 1 ELSE 0 END) AS PStore_qty_2016
FROM A a
GROUP BY 1;

CREATE TABLE V3_BannerGroupIncomeProfit AS
SELECT b.IsBannerGroup,
(CASE WHEN b.Income_Postcode_2011 != 0 THEN b.Income_Postcode_2011/b.IStore_qty_2011 ELSE NULL END) AS AvgIncome_2011,
(CASE WHEN b.Income_Postcode_2012 != 0 THEN b.Income_Postcode_2012/b.IStore_qty_2012 ELSE NULL END) AS AvgIncome_2012,
(CASE WHEN b.Income_Postcode_2013 != 0 THEN b.Income_Postcode_2013/b.IStore_qty_2013 ELSE NULL END) AS AvgIncome_2013,
(CASE WHEN b.Income_Postcode_2014 != 0 THEN b.Income_Postcode_2014/b.IStore_qty_2014 ELSE NULL END) AS AvgIncome_2014,
(CASE WHEN b.Income_Postcode_2015 != 0 THEN b.Income_Postcode_2015/b.IStore_qty_2015 ELSE NULL END) AS AvgIncome_2015,
(CASE WHEN b.Income_Postcode_2016 != 0 THEN b.Income_Postcode_2016/b.IStore_qty_2016 ELSE NULL END) AS AvgIncome_2016,
(CASE WHEN b.Profit_Postcode_2011 != 0 THEN b.Profit_Postcode_2011/b.PStore_qty_2011 ELSE NULL END) AS AvgProfit_2011,
(CASE WHEN b.Profit_Postcode_2012 != 0 THEN b.Profit_Postcode_2012/b.PStore_qty_2012 ELSE NULL END) AS AvgProfit_2012,
(CASE WHEN b.Profit_Postcode_2013 != 0 THEN b.Profit_Postcode_2013/b.PStore_qty_2013 ELSE NULL END) AS AvgProfit_2013,
(CASE WHEN b.Profit_Postcode_2014 != 0 THEN b.Profit_Postcode_2014/b.PStore_qty_2014 ELSE NULL END) AS AvgProfit_2014,
(CASE WHEN b.Profit_Postcode_2015 != 0 THEN b.Profit_Postcode_2015/b.PStore_qty_2015 ELSE NULL END) AS AvgProfit_2015,
(CASE WHEN b.Profit_Postcode_2016 != 0 THEN b.Profit_Postcode_2016/b.PStore_qty_2016 ELSE NULL END) AS AvgProfit_2016
FROM B b;

-- V4
-- Filter: Dispensed_qty_2016 > 50, Profit_2016 > 1000
CREATE TABLE A AS
SELECT t.*
FROM TRANS_VIC t
ORDER BY t.Drug_ID,t.Store_ID ASC;

CREATE TABLE B AS
SELECT a.Drug_ID,
COUNT(DISTINCT a.Store_ID) AS Store_qty,
COUNT(DISTINCT a.Patient_ID) AS Patient_qty,
SUM(CASE WHEN a.Dispense_Week BETWEEN '2015-01-01' AND '2015-12-31' THEN a.Dispensed_Qty ELSE 0 END) AS Dispensed_qty_2015,
SUM(CASE WHEN a.Dispense_Week BETWEEN '2016-01-01' AND '2016-12-31' THEN a.Dispensed_Qty ELSE 0 END) AS Dispensed_qty_2016
FROM A a GROUP BY 1;

CREATE TABLE C AS
SELECT a.Drug_ID,
SUM(CASE WHEN a.Dispense_Week BETWEEN '2015-01-01' AND '2015-12-31' THEN a.Dispensed_Qty*a.PatientPrice_Amt ELSE 0 END) AS Income_2015,
SUM(CASE WHEN a.Dispense_Week BETWEEN '2016-01-01' AND '2016-12-31' THEN a.Dispensed_Qty*a.PatientPrice_Amt ELSE 0 END) AS Income_2016,
SUM(CASE WHEN a.Dispense_Week BETWEEN '2015-01-01' AND '2015-12-31' THEN a.Dispensed_Qty*(a.PatientPrice_Amt-a.WholeSalePrice_Amt/d.PackSizeNumber) ELSE 0 END) AS Profit_2015,
SUM(CASE WHEN a.Dispense_Week BETWEEN '2016-01-01' AND '2016-12-31' THEN a.Dispensed_Qty*(a.PatientPrice_Amt-a.WholeSalePrice_Amt/d.PackSizeNumber) ELSE 0 END) AS Profit_2016
FROM A a INNER JOIN DRUG d
ON a.Drug_ID = d.MasterProductID
GROUP BY 1;

CREATE TABLE V4_SpecialDrug
SELECT b.Drug_ID,
b.Store_qty,
b.Patient_qty,
b.Dispensed_qty_2016,
b.Dispensed_qty_2015,
c.Income_2016,
c.Income_2015,
c.Profit_2016,
c.Profit_2015
FROM B b INNER JOIN C c
ON b.Drug_ID = c.Drug_ID
WHERE b.Dispensed_qty_2016 > 50 AND c.Profit_2016 > 1000
ORDER BY b.Store_qty ASC,b.Dispensed_qty_2016 DESC,b.Dispensed_qty_2015 DESC;

-- V5


