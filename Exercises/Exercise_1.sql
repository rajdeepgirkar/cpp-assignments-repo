SQL> connect
Enter user-name: rajdeep
Connected.
SQL> select * from tables;
select * from tables
              *
ERROR at line 1:
ORA-00942: table or view does not exist 


SQL> SELECT name FROM sys.tables;
SELECT name FROM sys.tables
                     *
ERROR at line 1:
ORA-00942: table or view does not exist 


SQL> SELECT table_name FROM user_tables;

TABLE_NAME                                                                      
------------------------------                                                  
SALESPEOPLE                                                                     

SQL> create table SEMP (EMPNO char(4), EMPNAME char(20), BASIC float, DEPTNO char(2), DEPTHEAD char(4));

Table created.

SQL> SELECT table_name FROM user_tables;

TABLE_NAME                                                                      
------------------------------                                                  
SALESPEOPLE                                                                     
SEMP                                                                            

SQL> create table SDEPT(DEPTNO char(2), DEPTNAME(15));
create table SDEPT(DEPTNO char(2), DEPTNAME(15))
                                           *
ERROR at line 1:
ORA-00902: invalid datatype 


SQL> create table SDEPT(DEPTNO char(2), DEPTNAME char(15));

Table created.

SQL> insert into SDEPT values('10', 'Development');

1 row created.

SQL> insert into SDEPT values('20', 'Training');

1 row created.

SQL> SELECT * FROM SDEPT;

DE DEPTNAME                                                                     
-- ---------------                                                              
10 Development                                                                  
20 Training                                                                     

SQL> COLUMN DEPTNO FORMAT A6;
SQL> SELECT * FROM SDEPT;

DEPTNO DEPTNAME                                                                 
------ ---------------                                                          
10     Development                                                              
20     Training                                                                 

SQL> insert into SEMP values('0001', 'SUNIL', 6000, '10', NULL);

1 row created.

SQL> insert into SEMP values('0002', 'HIREN', 8000, '20', NULL);

1 row created.

SQL> insert into SEMP values('0003', 'ALI', 4000, '10', '0001');

1 row created.

SQL> insert into SEMP values('0004', 'GEORGE', 6000, '20', '0002');

1 row created.

SQL> SELECT * FROM S;
SELECT * FROM S
              *
ERROR at line 1:
ORA-00942: table or view does not exist 


SQL> SELECT * FROM SEMP;

EMPN EMPNAME                   BASIC DEPTNO DEPT                                
---- -------------------- ---------- ------ ----                                
0001 SUNIL                      6000 10                                         
0002 HIREN                      8000 20                                         
0003 ALI                        4000 10     0001                                
0004 GEORGE                     6000 20     0002                                

SQL> create table S(S# char(2), SNAME char(20), STATUS int(3), CITY char(20));
create table S(S# char(2), SNAME char(20), STATUS int(3), CITY char(20))
                                                     *
ERROR at line 1:
ORA-00907: missing right parenthesis 


SQL> create table S(S# char(2), SNAME char(20), STATUS number(3), CITY char(20));

Table created.

SQL> create table P(P# char(2), PNAME char(20), COLOR char(10), WEIGHT NUMBER(5), CITY CHAR(20));

Table created.

SQL> create table J(J# char(2), JNAME char(20), CITY(20));
create table J(J# char(2), JNAME char(20), CITY(20))
                                               *
ERROR at line 1:
ORA-00902: invalid datatype 


SQL> create table J(J# char(2), JNAME char(20), CITY char(20));

Table created.

SQL> create table SPJ(S# char(2), P# char(2), J#(2), QTY NUMBER(5));
create table SPJ(S# char(2), P# char(2), J#(2), QTY NUMBER(5))
                                           *
ERROR at line 1:
ORA-00902: invalid datatype 


SQL> create table SPJ(S# char(2), P# char(2), J# char(2), QTY NUMBER(5));

Table created.

SQL> INSERT INTO S VALUES('S1','SMITH',20,'London');

1 row created.

SQL> INSERT INTO S VALUES('S2','JONES',10,'Paris');

1 row created.

SQL> INSERT INTO S VALUES('S3','BLAKE',30,'Athens');

1 row created.

SQL> INSERT INTO P VALUES('P1','Nut','Red',12,'London');

1 row created.

SQL> INSERT INTO P VALUES('P2','Bolt','Green',17,'Paris');

1 row created.

SQL> INSERT INTO P VALUES('P3','Screw','Blue',14,'Rome');

1 row created.

SQL> INSERT INTO J VALUES('J1','Sorter','Paris');

1 row created.

SQL> INSERT INTO J VALUES('J2','Display','Athens');

1 row created.

SQL> INSERT INTO J VALUES('J3','OCR','London');

1 row created.

SQL> INSERT INTO SPJ VALUES('S1','P1','J1',200);

1 row created.

SQL> INSERT INTO SPJ VALUES('S2','P2','J2',300);

1 row created.

SQL> INSERT INTO SPJ VALUES('S3','P3','J3',400);

1 row created.

SQL> COMMIT;

Commit complete.

SQL> -- Display all the data from the S table.
SQL> SELECT * FROM S;

S# SNAME                    STATUS CITY                                         
-- -------------------- ---------- --------------------                         
S1 SMITH                        20 London                                       
S2 JONES                        10 Paris                                        
S3 BLAKE                        30 Athens                                       

SQL> -- Display only the S# and SNAME fields from the S table.
SQL> SELECT S#, SNAME FROM s;

S# SNAME                                                                        
-- --------------------                                                         
S1 SMITH                                                                        
S2 JONES                                                                        
S3 BLAKE                                                                        

SQL> -- 7. Display the PNAME and COLOR from the P table for the CITY="London".
-- SQL> SELECT PNAME, COLOR FROM P WHERE CITY='LONDON;
ERROR:
ORA-01756: quoted string not properly terminated 


SQL> SELECT PNAME, COLOR FROM P WHERE CITY='LONDON';

no rows selected

SQL> SELECT PNAME, COLOR
  2  FROM P
  3  WHERE CITY='London';

PNAME                COLOR                                                      
-------------------- ----------                                                 
Nut                  Red                                                        

SQL> -- 8. Display all the Suppliers from London.
SQL> SELECT * FROM S WHERE CITY = 'London';

S# SNAME                    STATUS CITY                                         
-- -------------------- ---------- --------------------                         
S1 SMITH                        20 London                                       

SQL> -- 9. Display all the Suppliers from Paris or Athens.
SQL> SELECT *
  2  FROM S
  3  WHERE CITY='Paris' OR CITY='Athens';

S# SNAME                    STATUS CITY                                         
-- -------------------- ---------- --------------------                         
S2 JONES                        10 Paris                                        
S3 BLAKE                        30 Athens                                       

SQL> -- 10. Display all the Projects in Athens.
SQL> SELECT *
  2  FROM J
  3  WHERE CITY='Athens';

J# JNAME                CITY                                                    
-- -------------------- --------------------                                    
J2 Display              Athens                                                  

SQL> -- 11. Display all the Partnames with the weight between 12 and 14 (inclusive of both).
SQL> SELECT PNAME
  2  FROM P
  3  WHERE WEIGHT BETWEEN 12 AND 14;

PNAME                                                                           
--------------------                                                            
Nut                                                                             
Screw                                                                           

SQL> 12. Display all the Suppliers with a Status greater than or equal to 20.
SP2-0734: unknown command beginning "12. Displa..." - rest of line ignored.
SQL> -- 12. Display all the Suppliers with a Status greater than or equal to 20.
SQL> SELECT *
  2  FROM S
  3  WHERE STATUS >= 20;

S# SNAME                    STATUS CITY                                         
-- -------------------- ---------- --------------------                         
S1 SMITH                        20 London                                       
S3 BLAKE                        30 Athens                                       

SQL> -- 13. Display all the Suppliers except the Suppliers from London
SQL> SELECT *
  2  FROM S
  3  WHERE CITY <> 'London';

S# SNAME                    STATUS CITY                                         
-- -------------------- ---------- --------------------                         
S2 JONES                        10 Paris                                        
S3 BLAKE                        30 Athens                                       

SQL> -- 14. Display only the Cities from where the Suppliers come from.
SQL> SELECT CITY
  2  FROM S;

CITY                                                                            
--------------------                                                            
London                                                                          
Paris                                                                           
Athens                                                                          

SQL> -- 15. Assuming that the Part Weight is in GRAMS, display the same in
SQL> MILLIGRAMS and KILOGRAMS.
SP2-0734: unknown command beginning "MILLIGRAMS..." - rest of line ignored.
SQL> SELECT WEIGHT,
  2         WEIGHT*1000 AS MILLIGRAMS,
  3         WEIGHT/1000 AS KILOGRAMS
  4  FROM P;

    WEIGHT MILLIGRAMS  KILOGRAMS                                                
---------- ---------- ----------                                                
        12      12000       .012                                                
        17      17000       .017                                                
        14      14000       .014                                                

SQL> commit;

Commit complete.

SQL> spool off;
