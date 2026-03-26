SQL> -- SQL Exercise 5
SQL> -- 1. Display the Supplier name and the Quantity sold.
SQL> SELECT S.SNAME, SPJ.QTY
  2  FROM S, SPJ
  3  WHERE S.S# = SPJ.S#;

SNAME                       QTY                                                 
-------------------- ----------                                                 
SMITH                       200                                                 
JONES                       300                                                 
BLAKE                       400                                                 

SQL> -- 2. Display the Part name and Quantity sold.
SQL> SELECT P.PNAME, SPJ.QTY
  2  FROM P, SPJ
  3  WHERE P.P# = SPJ.P#;

PNAME                       QTY                                                 
-------------------- ----------                                                 
Nut                         200                                                 
Bolt                        300                                                 
Screw                       400                                                 

SQL> -- 3. Display the Project name and Quantity sold.
SQL> SELECT J.JNAME, SPJ.QTY
  2  FROM J, SPJ
  3  WHERE J.J# = SPJ.J#;

JNAME                       QTY                                                 
-------------------- ----------                                                 
Sorter                      200                                                 
Display                     300                                                 
OCR                         400                                                 

SQL> -- 4. Display the Supplier name, Part name, Project name and Quantity sold.
SQL> SELECT S.SNAME, P.PNAME, J.JNAME, SPJ.QTY
  2  FROM S, P, J, SPJ
  3  WHERE S.S# = SPJ.S#
  4  AND P.P# = SPJ.P#
  5  AND J.J# = SPJ.J#;

SNAME                PNAME                JNAME                       QTY       
-------------------- -------------------- -------------------- ----------       
SMITH                Nut                  Sorter                      200       
JONES                Bolt                 Display                     300       
BLAKE                Screw                OCR                         400       

SQL> -- 5. Display the Supplier name, Supplying Parts to a Project in the same City.
SQL> SELECT S.SNAME
  2  FROM S, J, SPJ
  3  WHERE S.S# = SPJ.S#
  4  AND J.J# = SPJ.J#
  5  AND S.CITY = J.CITY;

no rows selected

SQL> -- 6. Display the Part name that is `Red' is color, and the Quantity sold.
SQL> SELECT P.PNAME, SPJ.QTY
  2  FROM P, SPJ
  3  WHERE P.P# = SPJ.P#
  4  AND P.COLOR = 'Red';

PNAME                       QTY                                                 
-------------------- ----------                                                 
Nut                         200                                                 

SQL> 7. Display all the Quantity sold by Suppliers with the Status = 20.
SP2-0734: unknown command beginning "7. Display..." - rest of line ignored.
SQL> -- 7. Display all the Quantity sold by Suppliers with the Status = 20.
SQL> SELECT SPJ.QTY
  2  FROM S, SPJ
  3  WHERE S.S# = SPJ.S#
  4  AND S.STATUS = 20;

       QTY                                                                      
----------                                                                      
       200                                                                      

SQL> -- 8. Display all the Parts and Quantity with a Weight > 14.
SQL> SELECT P.PNAME, SPJ.QTY
  2  FROM P, SPJ
  3  WHERE P.P# = SPJ.P#
  4  AND P.WEIGHT > 14;

PNAME                       QTY                                                 
-------------------- ----------                                                 
Bolt                        300                                                 

SQL> -- 9. Display all the Project names and City, which has bought more than 500 Parts.
SQL> SELECT J.JNAME, J.CITY
  2  FROM J, SPJ
  3  WHERE J.J# = SPJ.J#
  4  AND SPJ.QTY > 500;

no rows selected

SQL> -- 10. Display all the Part names and Quantity sold that have a Weight less than 15.
SQL> SELECT P.PNAME, SPJ.QTY
  2  FROM P, SPJ
  3  WHERE P.P# = SPJ.P#
  4  AND P.WEIGHT < 15;

PNAME                       QTY                                                 
-------------------- ----------                                                 
Nut                         200                                                 
Screw                       400                                                 

SQL> -- 11. Display all the Employee names and the name of their Managers.
SQL> SELECT E1.EMPNAME AS EMPLOYEE, E2.EMPNAME AS MANAGER
  2  FROM SEMP E1, SEMP E2
  3  WHERE E1.DEPTHEAD = E2.EMPNO;

EMPLOYEE             MANAGER                                                    
-------------------- --------------------                                       
ALI                  SUNIL                                                      
GEORGE               HIREN                                                      

SQL> spool off;
