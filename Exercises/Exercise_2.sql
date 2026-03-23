SQL> SELECT table_name FROM user_tables;

TABLE_NAME                                                                      
------------------------------                                                  
SALESPEOPLE                                                                     
SEMP                                                                            
SDEPT                                                                           
S                                                                               
P                                                                               
J                                                                               
SPJ                                                                             

7 rows selected.

SQL> SELECT * FROM SALESPEOPLE;

      SNUM SNAME      CITY             COMM                                     
---------- ---------- ---------- ----------                                     
      1001 Peel       London            .12                                     
      1002 Serres     San Jose          .13                                     
      1004 Motika     London            .11                                     
      1007 Rifkin     Barcelona         .15                                     
      1003 Axelrod    New York           .1                                     

SQL> DROP TABLE SALESPEOPLE;

Table dropped.

SQL> SELECT table_name FROM user_tables;

TABLE_NAME                                                                      
------------------------------                                                  
SEMP                                                                            
SDEPT                                                                           
S                                                                               
P                                                                               
J                                                                               
SPJ                                                                             

6 rows selected.

SQL> -- EXERCISE 2
SQL> -- 1. Display the Supplier table in the descending order of CITY.
SQL> SELECT * FROM S ORDER BY CITY DESC;

S# SNAME                    STATUS CITY                                         
-- -------------------- ---------- --------------------                         
S2 JONES                        10 Paris                                        
S1 SMITH                        20 London                                       
S3 BLAKE                        30 Athens                                       

SQL> commit;

Commit complete.

SQL> -- 2. Display the Part Table in the ascending order of CITY and within the city in the ascending order of Part names.
SQL> SELECT P ORDER BY CITY ASC, PNAME ASC;
SELECT P ORDER BY CITY ASC, PNAME ASC
         *
ERROR at line 1:
ORA-00923: FROM keyword not found where expected 


SQL> SELECT * FROM P ORDER BY CITY ASC, PNAME ASC;

P# PNAME                COLOR          WEIGHT CITY                              
-- -------------------- ---------- ---------- --------------------              
P1 Nut                  Red                12 London                            
P2 Bolt                 Green              17 Paris                             
P3 Screw                Blue               14 Rome                              

SQL> -- 3. Display all the Suppliers with a status between 10 and 20.
SQL> SELECT * FROM S WHERE STATUS BETWEEN 10 and 20;

S# SNAME                    STATUS CITY                                         
-- -------------------- ---------- --------------------                         
S1 SMITH                        20 London                                       
S2 JONES                        10 Paris                                        

SQL> -- 4. Display all the Parts and their Weight, which are not in the range of 10 and 15.
SQL> select * from P;

P# PNAME                COLOR          WEIGHT CITY                              
-- -------------------- ---------- ---------- --------------------              
P1 Nut                  Red                12 London                            
P2 Bolt                 Green              17 Paris                             
P3 Screw                Blue               14 Rome                              

SQL> select * from P where weight not between 10 and 15;

P# PNAME                COLOR          WEIGHT CITY                              
-- -------------------- ---------- ---------- --------------------              
P2 Bolt                 Green              17 Paris                             

SQL> -- 5. Display all the Part names starting with the letter `S'.
SQL> select PNAME from P where pname like 'S%';

PNAME                                                                           
--------------------                                                            
Screw                                                                           

SQL> -- 6. Display all the Suppliers, belonging to cities starting with the letter `L'.
SQL> select * from S;

S# SNAME                    STATUS CITY                                         
-- -------------------- ---------- --------------------                         
S1 SMITH                        20 London                                       
S2 JONES                        10 Paris                                        
S3 BLAKE                        30 Athens                                       

SQL> select sname where city like 'L%';
select sname where city like 'L%'
             *
ERROR at line 1:
ORA-00923: FROM keyword not found where expected 


SQL> select sname from s where city like 'L%';

SNAME                                                                           
--------------------                                                            
SMITH                                                                           

SQL> -- 7. Display all the Projects, with the third letter in JNAME as `n'.
SQL> select * from p;

P# PNAME                COLOR          WEIGHT CITY                              
-- -------------------- ---------- ---------- --------------------              
P1 Nut                  Red                12 London                            
P2 Bolt                 Green              17 Paris                             
P3 Screw                Blue               14 Rome                              

SQL> select * from j;

J# JNAME                CITY                                                    
-- -------------------- --------------------                                    
J1 Sorter               Paris                                                   
J2 Display              Athens                                                  
J3 OCR                  London                                                  

-- SQL> select * from j where jname like '__n%;
ERROR:
ORA-01756: quoted string not properly terminated 


SQL> select * from j where jname like '__n%';

no rows selected

SQL> spool off;
