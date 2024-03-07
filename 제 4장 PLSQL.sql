/*
    ��¥ : 2024/03/07
    �̸� : ������
    ���� : PL/SQL ����
*/
-- �ǽ� 1-1
SET SERVEROUTPUT ON; 
BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello, Oracle!');
 END;
 
-- �ǽ� 1-2 
DECLARE
    NO NUMBER(4) := 1001;
    NAME VARCHAR2(10) := 'ȫ�浿';
    HP CHAR(13) := '010-1000-1001';
    ADDR VARCHAR2(100) := '�λ걤����';
BEGIN
    --DBMS_OUTPUT.PUT_LINE('��ȣ : ' || NO);
    DBMS_OUTPUT.PUT_LINE('�̸� : ' || NAME);
    DBMS_OUTPUT.PUT_LINE('��ȭ : ' || HP);
    DBMS_OUTPUT.PUT_LINE('�ּ� : ' || ADDR);
END;

-- �ǽ� 2-1
DECLARE
    NO CONSTANT NUMBER(4) := 1001;
    NAME VARCHAR2(10);
    HP CHAR(13) := '000-0000-0000';
    AGE NUMBER(2) DEFAULT 1;
    ADDR VARCHAR2(10) NOT NULL := '�λ�';
BEGIN
    NAME := '������';
    HP := '010-1000-1001';
    DBMS_OUTPUT.PUT_LINE('��ȣ : ' || NO);
    DBMS_OUTPUT.PUT_LINE('�̸� : ' || NAME);
    DBMS_OUTPUT.PUT_LINE('��ȭ : ' || HP);
    DBMS_OUTPUT.PUT_LINE('���� : ' || AGE);
    DBMS_OUTPUT.PUT_LINE('�ּ� : ' || ADDR);
END;

-- �ǽ� 2-2
DECLARE
    NO DEPT.DEPTNO%TYPE;
    NAME DEPT.DNAME%TYPE;
    ADDR DEPT.LOC%TYPE;
BEGIN
    SELECT *
    INTO NO, NAME, ADDR
    FROM DEPT
    WHERE DEPTNO =30;
    
    DBMS_OUTPUT.PUT_LINE('�μ���ȣ : ' || NO);
    DBMS_OUTPUT.PUT_LINE('�μ��� : ' || NAME);
    DBMS_OUTPUT.PUT_LINE('�ּ� : ' || ADDR);
END;

-- �ǽ� 2-3
DECLARE
    -- ����
    ROW_DEPT DEPT%ROWTYPE;
BEGIN
    -- ó��
    SELECT *
    INTO ROW_DEPT
    FROM DEPT
    WHERE DEPTNO = 40;
    
    -- ���
    DBMS_OUTPUT.PUT_LINE('�μ���ȣ : ' || ROW_DEPT.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('�μ��� : ' || ROW_DEPT.DNAME);
    DBMS_OUTPUT.PUT_LINE('�ּ� : ' || ROW_DEPT.LOC);
END;

-- �ǽ� 2-4
DECLARE
    --RECORD DEFINE
    TYPE REC_DEPT IS RECORD(
        DEPTNO NUMBER(2),
        DNAME DEPT.DNAME%TYPE,
        LOC DEPT.LOC%TYPE
    );
    --RECORD DECLARE
    DEPT_REC REC_DEPT;
BEGIN
    --RECORD INITIALIZE
    DEPT_REC.DEPTNO :=10;
    DEPT_REC.DNAME :='���ߺ�';
    DEPT_REC.LOC :='�λ�';
    --RECORD PRINT
    DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || DEPT_REC.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('DNAME: ' || DEPT_REC.DNAME);
    DBMS_OUTPUT.PUT_LINE('LOC : ' || DEPT_REC.LOC);
    DBMS_OUTPUT.PUT_LINE('PL/SQL ����...');
END;

-- �ǽ� 2-5
-- ���̺� ����(������ ����)
CREATE TABLE DEPT_RECORD AS SELECT * FROM DEPT WHERE 1 = 0;

DECLARE
    TYPE REC_DEPT IS RECORD (
        DEPTNO NUMBER(2),
        DNAME DEPT.DNAME%TYPE,
        LOC DEPT.LOC%TYPE
    );
    DEPT_REC REC_DEPT;
BEGIN
    DEPT_REC.DEPTNO := 10;
    DEPT_REC.DNAME := '���ߺ�';
    DEPT_REC.LOC := '�λ�';
    
    INSERT INTO DEPT_RECORD VALUES DEPT_REC;
    
    DBMS_OUTPUT.PUT_LINE('PL/SQL ����...');
END;

-- �ǽ� 2-6
DECLARE
    TYPE REC_DEPT IS RECORD (
        DEPTNO DEPT.DEPTNO%TYPE,
        DNAME DEPT.DNAME%TYPE,
        LOC DEPT.LOC%TYPE
    );
    TYPE REC_EMP IS RECORD (
        EMPNO EMP.EMPNO%TYPE,
        ENAME EMP.ENAME%TYPE,
        DINFO REC_DEPT
    );
    EMP_REC REC_EMP;
BEGIN
    SELECT E.EMPNO, E.ENAME, D.DEPTNO, D.DNAME, D.LOC
    INTO
        EMP_REC.EMPNO,
        EMP_REC.ENAME,
        EMP_REC.DINFO.DEPTNO,
        EMP_REC.DINFO.DNAME,
        EMP_REC.DINFO.LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO AND E.EMPNO = 7788;
     DBMS_OUTPUT.PUT_LINE('EMPNO : ' || EMP_REC.EMPNO);
     DBMS_OUTPUT.PUT_LINE('ENAME : ' || EMP_REC.ENAME);
     DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || EMP_REC.DINFO.DEPTNO);
     DBMS_OUTPUT.PUT_LINE('DNAME : ' || EMP_REC.DINFO.DNAME);
     DBMS_OUTPUT.PUT_LINE('LOC : ' || EMP_REC.DINFO.LOC);
     DBMS_OUTPUT.PUT_LINE('PL/SQL ����...');
END;

-- �ǽ� 2-7
DECLARE
    TYPE ARR_CITY IS TABLE OF VARCHAR2(20) INDEX BY PLS_INTEGER;
    arrCITY ARR_CITY;
BEGIN
    arrCITY(1) :=  '����';
    arrCITY(2) :=  '����';
    arrCITY(3) :=  '�뱸';
    
    DBMS_OUTPUT.PUT_LINE('arrCITY(1) : ' || arrCITY(1));
    DBMS_OUTPUT.PUT_LINE('arrCITY(2) : ' || arrCITY(2));
    DBMS_OUTPUT.PUT_LINE('arrCITY(3) : ' || arrCITY(3));
    DBMS_OUTPUT.PUT_LINE('PL/SQL ����...');
END;

-- �ǽ� 3-1
DECLARE
    NUM NUMBER :=1;
BEGIN
    IF NUM > 0 THEN
        DBMS_OUTPUT.PUT_LINE('NUM�� 0���� ũ��');
    END IF;
    DBMS_OUTPUT.PUT_LINE('PL/SQL ����...');
END;

-- �ǽ� 3-2
DECLARE
    NUM NUMBER := -1;
BEGIN
    IF NUM > 0 THEN
        DBMS_OUTPUT.PUT_LINE('NUM�� 0���� ũ��');
    ELSE
        DBMS_OUTPUT.PUT_LINE('NUM�� 0���� �۴�');
    END IF;
    DBMS_OUTPUT.PUT_LINE('PL/SQL ����...');
END;

-- �ǽ� 3-3 
DECLARE
    SCORE NUMBER := 86;
BEGIN
    IF SCORE >= 90 AND SCORE <= 100 THEN
        DBMS_OUTPUT.PUT_LINE('A �Դϴ�');
    ELSIF SCORE >= 80 AND SCORE < 90 THEN
        DBMS_OUTPUT.PUT_LINE('B �Դϴ�');
    ELSIF SCORE >= 70 AND SCORE < 80 THEN
        DBMS_OUTPUT.PUT_LINE('C �Դϴ�');
    ELSIF SCORE >= 60 AND SCORE < 70 THEN
        DBMS_OUTPUT.PUT_LINE('D �Դϴ�');
    ELSE
        DBMS_OUTPUT.PUT_LINE('F �Դϴ�');   
    END IF;
    DBMS_OUTPUT.PUT_LINE('PL/SQL ����...');
END;

-- �ǽ� 3-4 
DECLARE
    SCORE NUMBER := 86;
BEGIN
    CASE FLOOR(SCORE/10)
        WHEN 9 THEN DBMS_OUTPUT.PUT_LINE('A �Դϴ�');
        WHEN 8 THEN DBMS_OUTPUT.PUT_LINE('B �Դϴ�');
        WHEN 7 THEN DBMS_OUTPUT.PUT_LINE('C �Դϴ�');
        WHEN 6 THEN DBMS_OUTPUT.PUT_LINE('D �Դϴ�');
        DBMS_OUTPUT.PUT_LINE('F �Դϴ�'); 
    END CASE;
    DBMS_OUTPUT.PUT_LINE('PL/SQL ����...');
END;

-- �ǽ� 3-5 LOOP
DECLARE
    NUM NUMBER := 0;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('NUM : ' || NUM);
        NUM := NUM +1;
        
        IF NUM >3 THEN
            EXIT;
        END IF;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('PL/SQL ����...');
END;

-- �ǽ� 3-6 FOR
BEGIN 
    FOR i IN 1..3 LOOP
        DBMS_OUTPUT.PUT_LINE('i : ' || i);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('PL/SQL ����...');
END;

-- �ǽ� 3-7 
DECLARE
    NUM NUMBER := 0;
BEGIN
    WHILE NUM < 4 LOOP
    DBMS_OUTPUT.PUT_LINE('NUM : ' || NUM);
    NUM := NUM +1;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('PL/SQL ����...');
END;

-- �ǽ� 3-8 
DECLARE
    NUM NUMBER := 0;
BEGIN
    WHILE NUM < 5 LOOP
        
        NUM := NUM +1;
        
        -- MOD() : �������� ���ϴ� �Լ�
        IF MOD(NUM, 2) = 0 THEN
            CONTINUE;
        END IF;
        DBMS_OUTPUT.PUT_LINE('NUM : ' || NUM);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('PL/SQL ����...');
END;

-- �ǽ� 3-9 
BEGIN
    FOR i IN 1..5 LOOP
        CONTINUE WHEN MOD(i, 2) =0;
        DBMS_OUTPUT.PUT_LINE('i : ' || i);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('PL/SQL ����...');
END;

-- �ǽ� 4-1 Ŀ��
DECLARE
    -- Ŀ�� �����͸� ������ ���� ����
    V_DEPT_ROW DEPT%ROWTYPE;
    
    -- Ŀ�� ����
    CURSOR c1 IS SELECT * FROM DEPT WHERE DEPTNO = 40;
BEGIN
    -- Ŀ�� ����
    OPEN c1;
    
    -- Ŀ�� ������ �Է�
    FETCH c1 INTO V_DEPT_ROW;
    
    -- Ŀ�� ������ ���
    DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || V_DEPT_ROW.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('DNAME : ' || V_DEPT_ROW.DNAME);
    DBMS_OUTPUT.PUT_LINE('LOC : ' || V_DEPT_ROW.LOC);
    
    CLOSE c1;
END;

-- �ǽ� 4-2 Ŀ�� LOOP
DECLARE
    V_DEPT_ROW DEPT%ROWTYPE;
    CURSOR c1 IS SELECT * FROM DEPT;
BEGIN
    OPEN c1;
    LOOP
        FETCH c1 INTO V_DEPT_ROW;
        EXIT WHEN c1%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('-------------------------------');
        DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || V_DEPT_ROW.DEPTNO);
        DBMS_OUTPUT.PUT_LINE('DNAME : ' || V_DEPT_ROW.DNAME);
        DBMS_OUTPUT.PUT_LINE('LOC : ' || V_DEPT_ROW.LOC);
    END LOOP;
    CLOSE c1;
END;

-- �ǽ� 4-3 Ŀ�� FOR
DECLARE
    CURSOR c1 IS SELECT * FROM DEPT;
BEGIN
    FOR c1_REC IN c1 LOOP
        DBMS_OUTPUT.PUT_LINE('-------------------------------');
        DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || c1_REC.DEPTNO);
        DBMS_OUTPUT.PUT_LINE('DNAME : ' || c1_REC.DNAME);
        DBMS_OUTPUT.PUT_LINE('LOC : ' || c1_REC.LOC);
    END LOOP;
END;

-- �ǽ� 4-4 ����ó��
DECLARE 
    V_WRONG NUMBER;
BEGIN
    SELECT DNAME INTO V_WRONG FROM DEPT WHERE DEPTNO = 10;
EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('VALUE_ERROR(��ġ �Ǵ� ��) ���� �߻�...');
END;

-- �ǽ� 4-5 
DECLARE
    DEPTNO DEPT.DEPTNO%TYPE;
    DNAME DEPT.DNAME%TYPE;
BEGIN
    SELECT DEPTNO, DNAME INTO DEPTNO, DNAME FROM DEPT;
    
    DBMS_OUTPUT.PUT_LINE('DEPTNO : ' || DEPTNO);
    DBMS_OUTPUT.PUT_LINE('DNAME : ' || DNAME);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(' ���� �߻�...');
        DBMS_OUTPUT.PUT_LINE(' ���� �ڵ� : ' || SQLCODE);
        DBMS_OUTPUT.PUT_LINE(' ���� ���� : ' || SQLERRM);
END;
