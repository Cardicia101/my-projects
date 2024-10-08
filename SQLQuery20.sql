CREATE DATABASE COURSES;
USE COURSES;

CREATE TABLE SHORT_COURSE(
COURSE_ID VARCHAR (50) NOT NULL PRIMARY KEY,
COURSE_DESCRIPTION VARCHAR (50) NOT NULL,
COURSE_PRICE VARCHAR (50) NOT NULL,
);

CREATE TABLE CAMPUS(
CAMPUS_ID VARCHAR (50) NOT NULL PRIMARY KEY,
CAMPUS_NAME VARCHAR (50) NOT NULL,
CAMPUS_ADDRESS VARCHAR (50) NOT NULL,
);

CREATE TABLE COURSE_REGISTRATION (
    COURSE_CODE VARCHAR(50) NOT NULL,
    CAMPUS_CODE VARCHAR(50) NOT NULL,
    SPACES_AVAILABLE INT NOT NULL,
    PRIMARY KEY (COURSE_CODE, CAMPUS_CODE),
    FOREIGN KEY (COURSE_CODE) REFERENCES SHORT_COURSE(COURSE_ID),
    FOREIGN KEY (CAMPUS_CODE) REFERENCES CAMPUS(CAMPUS_ID)
);

INSERT INTO SHORT_COURSE(COURSE_ID,COURSE_DESCRIPTION,COURSE_PRICE)
VAlUES

('CRE101', 'CREATIVE WRITTING 1','R1,500'),
('UIF101', 'USER INTERFACE DESIGN DESIGN 1','R1,700'),
('PHO201', 'PHOTOGRAPHY 2','R2,400'),
('STA301', 'ADVANCED STATISTICS ','R5,000'),
('FRE101', 'FRENCH FOR BEGINNERS','R1,900')
;

INSERT INTO CAMPUS(CAMPUS_ID,CAMPUS_NAME,CAMPUS_ADDRESS)
VAlUES

('C001', 'JOHANNESBURG CAMPUS','167 PERT ROAD,JOHANNESBURG'),
('C002', 'GQEBERHA CAMPUS','5 SECONDS AVENUE,GQEBERHA'),
('C003', 'BERTHA MKHIZE CAMPUS','33 BERTHA MKHIZE STREET,DURBAN'),
('C004', 'DURBAN CAMPUS','27 BRAAM FISCHER ROAD,DURBAN'),
('C005', 'TSHWANE CAMPUS','210 DU TOIT STREET,TSHWANE')
;

INSERT INTO COURSE_REGISTRATION(COURSE_CODE, CAMPUS_CODE, SPACES_AVAILABLE)
VALUES
    ('UIF101', 'C001', 50),
    ('UIF101', 'C004', 30),
    ('PHO201', 'C005', 15),
    ('STA301', 'C003', 20),
    ('STA301', 'C001', 40);

ALTER TABLE COURSE_REGISTRATION 
ADD NUMBER_OF_STUDENTS VARCHAR;
SELECT *FROM COURSE_REGISTRATION;

UPDATE COURSE_REGISTRATION
SET NUMBER_OF_STUDENTS = '35'
WHERE COURSE_CODE = 'STA301' AND CAMPUS_CODE = 'C001';

SELECT DISTINCT SC.COURSE_DESCRIPTION
FROM SHORT_COURSE SC
LEFT JOIN COURSE_REGISTRATION1 CR ON SC.COURSE_ID = CR.COURSE_CODE
WHERE CR.COURSE_CODE IS NULL;

SELECT SC.COURSE_DESCRIPTION, SUM(CR.SPACES_AVAILABLE) AS Total_Students
FROM SHORT_COURSE SC
LEFT JOIN COURSE_REGISTRATION1 CR ON SC.COURSE_ID = CR.COURSE_CODE
GROUP BY SC.COURSE_DESCRIPTION
ORDER BY SC.COURSE_DESCRIPTION;

SELECT SC.COURSE_DESCRIPTION, C.CAMPUS_NAME, CR.SPACES_AVAILABLE
FROM SHORT_COURSE SC
INNER JOIN COURSE_REGISTRATION CR ON SC.COURSE_ID = CR.COURSE_CODE
INNER JOIN CAMPUS C ON CR.CAMPUS_CODE = C.CAMPUS_ID
WHERE SC.COURSE_ID = 'STA301'
ORDER BY CR.SPACES_AVAILABLE DESC
LIMIT 1;
