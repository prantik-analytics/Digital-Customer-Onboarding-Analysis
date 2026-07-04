-- CREATE DATABASE DigitalBank;
-- USE DigitalBank;

-- CREATE TABLE Numbers(
--     n INT PRIMARY KEY
-- );

-- CREATE TABLE Customers (
-- Customer_id VARCHAR(10) PRIMARY KEY NOT NULL,
-- Age INT NOT NULL,
-- Occupation VARCHAR(30) NOT NULL,
-- Annual_income DECIMAL(10,2) NOT NULL,
-- State VARCHAR(20) NOT NULL,
-- City VARCHAR(20) NOT NULL,
-- Region ENUM('Metro','Tier2','Rural') NOT NULL,
-- Device_type ENUM('Andriod','Iphone','Deskstop')  NOT NULL,
-- Existing_customer ENUM('Yes','No') NOT NULL
-- );

-- CREATE TABLE Applications (
-- Application_id VARCHAR(10) PRIMARY KEY,
-- Customer_id VARCHAR(10)NOT NULL,
-- Account_type ENUM('Savings','Current','Salaried')NOT NULL,
-- Application_date DATE NOT NULL,
-- Application_start_time TIME NOT NULL,
-- Final_status ENUM('Completed','Rejected','Progress','Abandoned') NOT NULL,
-- Current_stage ENUM('Started','OTP','Document upload','OCR', 'Video KYC', 'Compliance','Completed')NOT NULL,
-- Failed_stage ENUM('OTP','Document upload', 'OCR', 'Video KYC','Compliance') NOT NULL,
-- Total_processing_time INT NOT NULL,
-- Application_channel ENUM('Mobile App','Website')NOT NULL,
-- Resume_after_exit ENUM('yes','no')NOT NULL,
-- FOREIGN KEY (Customer_id) REFERENCES Customers(customer_id)
-- );

-- CREATE TABLE Verifications (
-- Verification_id VARCHAR(10) PRIMARY KEY,
-- Application_id VARCHAR(10) NOT NULL,
-- Document_type ENUM('Aadhar','Pan card','Driving license')NOT NULL,
-- Document_quality ENUM('Good','Blurry','Cropped') NOT NULL,
-- OCR_status ENUM('Pass','Fail') NOT NULL,
-- OTP_status ENUM('Success','Failed') NOT NULL,
-- Manual_verification ENUM('Yes','No')NOT NULL,
-- Video_KYC_status ENUM('Completed','Failed','Pending')NOT NULL,
-- Compliance_status ENUM('Fail','Pass')NOT NULL,
-- Verification_time INT NOT NULL,
-- FOREIGN KEY (Application_id) REFERENCES Applications (Application_id)
-- );

--  CREATE TABLE Applications_journey (
--  Journey_id VARCHAR(20) PRIMARY KEY,
--  Application_id VARCHAR(10) NOT NULL,
--  Stage_name ENUM('OTP','Document Upload','OCR','Video KYC','Compliance') NOT NULL,
--  Stage_status ENUM('Completed','Failed','Pending') NOT NULL,
--  Time_spent INT,
--  Failure_reason VARCHAR(100),
--  FOREIGN KEY (Application_ID) REFERENCES Applications(Application_ID)
-- );


-- INSERT INTO Customers
-- (
--     Customer_id,
--     Age,
--     Occupation,
--     Annual_income,
--     State,
--     City,
--     Region,
--     Device_type,
--     Existing_customer
-- )

-- WITH RECURSIVE seq AS
-- (
--     SELECT 1 AS n
--     UNION ALL
--     SELECT n + 1
--     FROM seq
--     WHERE n < 500
-- )

-- SELECT
--     CONCAT('C',LPAD(n,4,'0')),

--     18 + MOD(n,43),

--     CASE
--         WHEN n<=200 THEN 'Salaried'
--         WHEN n<=280 THEN 'Student'
--         WHEN n<=350 THEN 'Self Employed'
--         WHEN n<=430 THEN 'Business'
--         ELSE 'Government Employee'
--     END,

--     200000 + (n*3500),

--     CASE MOD(n,5)
--         WHEN 0 THEN 'Delhi'
--         WHEN 1 THEN 'Maharashtra'
--         WHEN 2 THEN 'Karnataka'
--         WHEN 3 THEN 'Assam'
--         ELSE 'West Bengal'
--     END,

--     CASE MOD(n,5)
--         WHEN 0 THEN 'Delhi'
--         WHEN 1 THEN 'Mumbai'
--         WHEN 2 THEN 'Bengaluru'
--         WHEN 3 THEN 'Guwahati'
--         ELSE 'Kolkata'
--     END,

--     CASE MOD(n,3)
--         WHEN 0 THEN 'Metro'
--         WHEN 1 THEN 'Tier2'
--         ELSE 'Rural'
--     END,

--     CASE MOD(n,3)
--         WHEN 0 THEN 'Andriod'
--         WHEN 1 THEN 'Iphone'
--         ELSE 'Deskstop'
--     END,

--     CASE
--         WHEN MOD(n,5)=0 THEN 'Yes'
--         ELSE 'No'
--     END

-- FROM seq;

SELECT * FROM Customers;

-- INSERT INTO Applications
-- (
--     Application_id,
--     Customer_id,
--     Account_type,
--     Application_date,
--     Application_start_time,
--     Final_status,
--     Current_stage,
--     Failed_stage,
--     Total_processing_time,
--     Application_channel,
--     Resume_after_exit
-- )

-- WITH RECURSIVE seq AS
-- (
--     SELECT 1 AS n
--     UNION ALL
--     SELECT n+1
--     FROM seq
--     WHERE n<500
-- )

-- SELECT

-- CONCAT('A',LPAD(n,4,'0')),

-- CONCAT('C',LPAD(n,4,'0')),

-- CASE
-- WHEN MOD(n,3)=0 THEN 'Savings'
-- WHEN MOD(n,3)=1 THEN 'Current'
-- ELSE 'Salaried'
-- END,

-- DATE_ADD('2025-01-01',INTERVAL MOD(n,180) DAY),

-- SEC_TO_TIME(32400 + MOD(n,36000)),

-- CASE
-- WHEN MOD(n,10)<=6 THEN 'Completed'
-- WHEN MOD(n,10)=7 THEN 'Rejected'
-- WHEN MOD(n,10)=8 THEN 'Abandoned'
-- ELSE 'Progress'
-- END,

-- CASE
-- WHEN MOD(n,10)<=6 THEN 'Completed'
-- WHEN MOD(n,10)=7 THEN 'Compliance'
-- WHEN MOD(n,10)=8 THEN 'Video KYC'
-- ELSE 'OCR'
-- END,

-- CASE
-- WHEN MOD(n,10)=7 THEN 'Compliance'
-- WHEN MOD(n,10)=8 THEN 'Video KYC'
-- ELSE 'OTP'
-- END,

-- 60 + MOD(n,240),

-- CASE
-- WHEN MOD(n,2)=0 THEN 'Mobile App'
-- ELSE 'Website'
-- END,

-- CASE
-- WHEN MOD(n,8)=0 THEN 'Yes'
-- ELSE 'No'
-- END

-- FROM seq;

SELECT * FROM Applications ;




-- INSERT INTO Verifications
-- (
--     Verification_id,
--     Application_id,
--     Document_type,
--     Document_quality,
--     OCR_status,
--     OTP_status,
--     Manual_verification,
--     Video_KYC_status,
--     Compliance_status,
--     Verification_time
-- )

-- WITH RECURSIVE seq AS
-- (
--     SELECT 1 AS n
--     UNION ALL
--     SELECT n + 1
--     FROM seq
--     WHERE n < 500
-- )

-- SELECT

-- CONCAT('V',LPAD(n,4,'0')),

-- CONCAT('A',LPAD(n,4,'0')),

-- CASE MOD(n,3)
--     WHEN 0 THEN 'Aadhar'
--     WHEN 1 THEN 'Pan card'
--     ELSE 'Driving license'
-- END,

-- CASE
--     WHEN MOD(n,10)<=7 THEN 'Good'
--     WHEN MOD(n,10)=8 THEN 'Blurry'
--     ELSE 'Cropped'
-- END,

-- CASE
--     WHEN MOD(n,10)<=8 THEN 'Pass'
--     ELSE 'Fail'
-- END,

-- CASE
--     WHEN MOD(n,20)=0 THEN 'Failed'
--     ELSE 'Success'
-- END,

-- CASE
--     WHEN MOD(n,15)=0 THEN 'Yes'
--     ELSE 'No'
-- END,

-- CASE
--     WHEN MOD(n,10)<=6 THEN 'Completed'
--     WHEN MOD(n,10)=7 THEN 'Pending'
--     ELSE 'Failed'
-- END,

-- CASE
--     WHEN MOD(n,10)<=7 THEN 'Pass'
--     ELSE 'Fail'
-- END,

-- 30 + MOD(n,180)

-- FROM seq;

SELECT * FROM Verifications;

-- INSERT INTO Applications_journey
-- (
--     Journey_id,
--     Application_id,
--     Stage_name,
--     Stage_status,
--     Time_spent,
--     Failure_reason
-- )

-- WITH RECURSIVE seq AS
-- (
--     SELECT 1 AS n
--     UNION ALL
--     SELECT n + 1
--     FROM seq
--     WHERE n < 500
-- )

-- SELECT
--     CONCAT('J',LPAD((n-1)*5+1,5,'0')),
--     CONCAT('A',LPAD(n,4,'0')),
--     'OTP',
--     CASE WHEN MOD(n,20)=0 THEN 'Failed' ELSE 'Completed' END,
--     10 + MOD(n,20),
--     CASE WHEN MOD(n,20)=0 THEN 'OTP Timeout' ELSE NULL END
-- FROM seq

-- UNION ALL

-- SELECT
--     CONCAT('J',LPAD((n-1)*5+2,5,'0')),
--     CONCAT('A',LPAD(n,4,'0')),
--     'Document Upload',
--     CASE WHEN MOD(n,15)=0 THEN 'Failed' ELSE 'Completed' END,
--     20 + MOD(n,40),
--     CASE WHEN MOD(n,15)=0 THEN 'Blurry Document' ELSE NULL END
-- FROM seq

-- UNION ALL

-- SELECT
--     CONCAT('J',LPAD((n-1)*5+3,5,'0')),
--     CONCAT('A',LPAD(n,4,'0')),
--     'OCR',
--     CASE WHEN MOD(n,18)=0 THEN 'Failed' ELSE 'Completed' END,
--     15 + MOD(n,30),
--     CASE WHEN MOD(n,18)=0 THEN 'OCR Extraction Failed' ELSE NULL END
-- FROM seq

-- UNION ALL

-- SELECT
--     CONCAT('J',LPAD((n-1)*5+4,5,'0')),
--     CONCAT('A',LPAD(n,4,'0')),
--     'Video KYC',
--     CASE WHEN MOD(n,12)=0 THEN 'Pending'
--          WHEN MOD(n,25)=0 THEN 'Failed'
--          ELSE 'Completed'
--     END,
--     40 + MOD(n,60),
--     CASE WHEN MOD(n,25)=0 THEN 'Customer Not Available' ELSE NULL END
-- FROM seq

-- UNION ALL

-- SELECT
--     CONCAT('J',LPAD((n-1)*5+5,5,'0')),
--     CONCAT('A',LPAD(n,4,'0')),
--     'Compliance',
--     CASE WHEN MOD(n,30)=0 THEN 'Failed' ELSE 'Completed' END,
--     30 + MOD(n,40),
--     CASE WHEN MOD(n,30)=0 THEN 'Compliance Check Failed' ELSE NULL END
-- FROM seq;


