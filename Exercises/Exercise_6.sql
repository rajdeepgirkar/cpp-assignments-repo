SQL> -- SQL Exercise 6
SQL> -- 1. Display all the Suppliers with the same Status as the supplier, `CLARK'.
SQL> SELECT *
  2  FROM S
  3  WHERE STATUS = (
  4      SELECT STATUS
  5      FROM S
  6      WHERE SNAME = 'CLARK'
  7  );

no rows selected

SQL> -- 2. Display all the Employees in the same department as the employee `MILLER'.
SQL> SELECT *
  2  FROM SEMP
  3  WHERE DEPTNO = (
  4      SELECT DEPTNO
  5      FROM SEMP
  6      WHERE EMPNAME = 'MILLER'
  7  );

no rows selected

SQL> -- 3. Display all the Parts which have more Weight than all the Red parts.
SQL> SELECT *
  2  FROM P
  3  WHERE WEIGHT > ALL (
  4      SELECT WEIGHT
  5      FROM P
  6      WHERE COLOR = 'Red'
  7  );

P# PNAME                COLOR          WEIGHT CITY                              
-- -------------------- ---------- ---------- --------------------              
P3 Screw                Blue               14 Rome                              
P2 Bolt                 Green              17 Paris                             

SQL> -- 4. Display all the Projects going on in the same city as the project `TAPE'.
SQL> SELECT *
  2  FROM J
  3  WHERE CITY = (
  4      SELECT CITY
  5      FROM J
  6      WHERE JNAME = 'TAPE'
  7  );

no rows selected

SQL> -- 5. Display all the Parts with Weight less than all the Green parts.
SQL> 
SQL> SELECT *
  2  FROM P
  3  WHERE WEIGHT < ALL (
  4      SELECT WEIGHT
  5      FROM P
  6      WHERE COLOR = 'Green'
  7  );

P# PNAME                COLOR          WEIGHT CITY                              
-- -------------------- ---------- ---------- --------------------              
P3 Screw                Blue               14 Rome                              
P1 Nut                  Red                12 London                            

SQL> -- 6. Display the name of the Supplier who has sold the maximum Quantity (in one sale).
SQL> SELECT S.SNAME
  2  FROM S, SPJ
  3  WHERE S.S# = SPJ.S#
  4  AND SPJ.QTY = (
  5      SELECT MAX(QTY)
  6      FROM SPJ
  7  );

SNAME                                                                           
--------------------                                                            
BLAKE                                                                           

SQL> -- 7. Display the name of the Employee with the minimum Salary.
SQL> 
SQL> SELECT EMPNAME
  2  FROM SEMP
  3  WHERE BASIC = (
  4      SELECT MIN(BASIC)
  5      FROM SEMP
  6  );

EMPNAME                                                                         
--------------------                                                            
ALI                                                                             

SQL> -- 8. Display the name of the Supplier who has sold the maximum overall Quantity (sum of Sales).
SQL> SELECT S.SNAME
  2  FROM S, SPJ
  3  WHERE S.S# = SPJ.S#
  4  GROUP BY S.SNAME
  5  HAVING SUM(SPJ.QTY) = (
  6      SELECT MAX(SUM(QTY))
  7      FROM SPJ
  8      GROUP BY S#
  9  );

SNAME                                                                           
--------------------                                                            
BLAKE                                                                           

SQL> -- 9. Display the name of the Department with the maximum number of Employees.
SQL> 
SQL> SELECT D.DEPTNAME
  2  FROM SDEPT D, SEMP E
  3  WHERE D.DEPTNO = E.DEPTNO
  4  GROUP BY D.DEPTNAME
  5  HAVING COUNT(*) = (
  6      SELECT MAX(COUNT(*))
  7      FROM SEMP
  8      GROUP BY DEPTNO
  9  );

DEPTNAME                                                                        
---------------                                                                 
Development                                                                     
Training                                                                        

SQL> spool off;
