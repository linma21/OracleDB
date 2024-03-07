ALTER TABLE USER1 RENAME COLUMN NID TO ID;
ALTER TABLE USER1 MODIFY NID VARCHAR2(25) DEFAULT 'A';
ALTER TABLE USER11 RENAME TO USER1;

SELECT * FROM USER11;
ALTER TABLE USER1 MODIFY NID DEFAULT NULL;
ALTER TABLE USER1 Add CONSTRAINT NID_PK PRIMARY KEY (NID);
ALTER TABLE USER1 DROP CONSTRAINT NID_PK;

// PIVOT
CREATE TABLE PIVOT(
    ITEM VARCHAR2(20),
    SEASON VARCHAR2(20),
    SALE INT
);
ALTER TABLE PIVOT RENAME TO FOOD;

INSERT INTO pivot VALUES ('�ø�','��',20);
INSERT INTO pivot VALUES ('�ø�','����',50);
INSERT INTO pivot VALUES ('�ø�','����',30);
INSERT INTO pivot VALUES ('�ø�','�ܿ�',10);
INSERT INTO pivot VALUES ('«��','��',30);
INSERT INTO pivot VALUES ('«��','����',10);
INSERT INTO pivot VALUES ('«��','����',20);
INSERT INTO pivot VALUES ('«��','�ܿ�',40);
SELECT * FROM FOOD;

SELECT * FROM FOOD
PIVOT (MAX(SALE) FOR SEASON IN ('��','����','����','�ܿ�')) PVT;

SELECT * FROM FOOD
PIVOT (MAX(SEASON) FOR SALE IN (10,20,30,40,50)) PVT;

CREATE TABLE ��� (
    ���ID VARCHAR(3) PRIMARY KEY,
    �μ�ID INT NOT NULL,
    ���� INT NOT NULL
);

 
 insert into ��� values (001,100,2500);
 insert into ��� values (002,100,3000);
 insert into ��� values (003,200,4500);
 insert into ��� values (004,200,3000);
 insert into ��� values (005,200,2500);
 insert into ��� values (006,300,4500);
 insert into ��� values (007,300,3000);
 
 SELECT * FROM ���;
 
 SELECT ���ID,�μ�ID,����, COL1, COL2, COL3
 FROM (SELECT ���ID,
 	ROW_NUMBER() OVER(PARTITION BY �μ�ID ORDER BY ���� DESC) AS COL1
	 ,SUM(����) OVER(PARTITION BY �μ�ID ORDER 
	 BY ���ID ROWS BETWEEN UNBOUNDED PRECEDING AND 
	 CURRENT ROW) AS COL2
	 ,MAX(����) OVER(ORDER BY ���� DESC ROWS CURRENT ROW) AS COL3
	 	FROM ���)
	 	JOIN ���
	 	USING (���ID)
	 	ORDER BY 1;
        
-- ROLLUP
SELECT ���ID, �μ�ID, SUM(����) AS �μ���������
FROM ���
GROUP BY ROLLUP(�μ�ID, ���ID);

-- GROUPING SETS
SELECT ���ID, �μ�ID, SUM(����) AS �μ���������
FROM ���
GROUP BY GROUPING SETS((�μ�ID, ���ID),�μ�ID,());

-- CASE GROUPING
SELECT CASE GROUPING(���ID) WHEN 1 THEN '�μ��� ������'
ELSE TO_CHAR(���ID) END AS ���ID,
CASE GROUPING(�μ�ID) WHEN 1 THEN '��ü ������'
ELSE TO_CHAR(�μ�ID) END AS �μ�ID,
SUM(����) AS ����
FROM ���
GROUP BY ROLLUP(�μ�ID, ���ID);

create table SQLD_34_21 (
    ID NUMBER,
    DEPT_NM VARCHAR(10),
    AMT NUMBER
);

INSERT INTO SQLD_34_21 VALUES (1,'��', 25);
INSERT INTO SQLD_34_21 VALUES (2,'��', 100);
INSERT INTO SQLD_34_21 VALUES (3,'��', 70);

// CUBE(1,2)
SELECT ID, DEPT_NM, SUM(AMT)
FROM SQLD_34_21
GROUP BY CUBE(ID, DEPT_NM);

// CUBE(1)
SELECT ID, SUM(AMT)
FROM SQLD_34_21
GROUP BY CUBE(ID);

// ROLLUP
SELECT ID, DEPT_NM, SUM(AMT)
FROM SQLD_34_21
GROUP BY ROLLUP(ID, DEPT_NM);

// ROLLUP (1)
SELECT ID, SUM(AMT)
FROM SQLD_34_21
GROUP BY ROLLUP(ID);

// GROUPING SETS
SELECT ID, DEPT_NM, SUM(AMT)
FROM SQLD_34_21
GROUP BY GROUPING SETS(ID, DEPT_NM);

// GROUPING SETS - ��ü �հ�
SELECT ID, DEPT_NM, SUM(AMT)
FROM SQLD_34_21
GROUP BY GROUPING SETS((ID, DEPT_NM),ID,());

// 46ȸ �ܴ��� 5
create table TAB1(
    JOB number
);
create table TAB2(
    GRADE number
);
insert into TAB1 VALUES (10);
insert into TAB1 VALUES (20);
insert into TAB1 VALUES (30);

insert into TAB2 VALUES (50);
insert into TAB2 VALUES (60);
insert into TAB2 VALUES (70);

SELECT B.GRADE, A.JOB, SUM(B.GRADE)
    FROM TAB1 A, TAB2 B GROUP BY grouping sets(B.GRADE,(B.GRADE, A.JOB));
    
SELECT B.GRADE, A.JOB, SUM(B.GRADE)
    FROM TAB1 A, TAB2 B GROUP BY A.JOB, ROLLUP(B.GRADE);

