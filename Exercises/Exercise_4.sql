SQL> -- SQL Exercise 4
SQL> -- 1. Display the minimum Status in the Supplier table.
SQL> SELECT MIN(STATUS)
  2  FROM S;

MIN(STATUS)                                                                     
-----------                                                                     
         10                                                                     

SQL> -- 2. Display the maximum Weight in the Parts table.
SQL> SELECT MAX(WEIGHT)
  2  FROM P;

MAX(WEIGHT)                                                                     
-----------                                                                     
         17                                                                     

SQL> -- 3. Display the average Weight of the Parts.
SQL> SELECT AVG(WEIGHT)
  2  FROM P;

AVG(WEIGHT)                                                                     
-----------                                                                     
 14.3333333                                                                     

SQL> -- 4. Display the total Quantity sold for part `P1'.
SQL> SELECT SUM(QTY)
  2  FROM SPJ
  3  WHERE P# = 'P1';

  SUM(QTY)                                                                      
----------                                                                      
       200                                                                      

SQL> -- 5. Display the total Quantity sold for each part.
SQL> SELECT P#, SUM(QTY)
  2  FROM SPJ
  3  GROUP BY P#;

P#   SUM(QTY)                                                                   
-- ----------                                                                   
P1        200                                                                   
P2        300                                                                   
P3        400                                                                   

SQL> -- 6. Display the average Quantity sold for each part.
SQL> SELECT P#, AVG(QTY)
  2  FROM SPJ
  3  GROUP BY P#;

P#   AVG(QTY)                                                                   
-- ----------                                                                   
P1        200                                                                   
P2        300                                                                   
P3        400                                                                   

SQL> -- 7. Display the maximum Quantity sold for each part, provided the maximum Quantity is greater than 800.
SQL> SELECT P#, MAX(QTY)
  2  FROM SPJ
  3  GROUP BY P#
  4  HAVING MAX(QTY) > 800;

no rows selected

SQL> -- 8. Display the Status and the count of Suppliers with that Status.
SQL> SELECT STATUS, COUNT(*)
  2  FROM S
  3  GROUP BY STATUS;

    STATUS   COUNT(*)                                                           
---------- ----------                                                           
        30          1                                                           
        20          1                                                           
        10          1                                                           

SQL> -- 9. Display the count of Projects going on in different cities.
SQL> SELECT CITY, COUNT(*)
  2  FROM J
  3  GROUP BY CITY;

CITY                   COUNT(*)                                                 
-------------------- ----------                                                 
London                        1                                                 
Paris                         1                                                 
Athens                        1                                                 

SQL> -- 10. What is the difference between COUNT(Status) and COUNT(*) ?
SQL> 
SQL> -- Count(Status)- counts only valid status value
SQL> -- Count(*) -counts all values including null values
SQL> 
SQL> -- 11. Display the Status and the Count of Suppliers with that Status in the following format as shown below:-
SQL> SELECT
  2      DECODE(STATUS,
  3             10,'Ten',
  4             20,'Twenty',
  5             30,'Thirty') AS STATUS,
  6      COUNT(*) AS COUNT
  7  FROM S
  8  GROUP BY STATUS;

STATUS      COUNT                                                               
------ ----------                                                               
Thirty          1                                                               
Twenty          1                                                               
Ten             1                                                               

SQL> SELECT
  2      DECODE(STATUS,
  3             10,'Ten',
  4             20,'Twenty',
  5             30,'Thirty') AS STATUS,
  6      COUNT(*) AS COUNT
  7  FROM S
  8  GROUP BY STATUS
  9  ORDER BY 1;

STATUS      COUNT                                                               
------ ----------                                                               
Ten             1                                                               
Thirty          1                                                               
Twenty          1                                                               

SQL> spool off;
