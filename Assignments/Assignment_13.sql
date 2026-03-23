mysql> -- Assignment ? 13 Using the UNION clause.
Query OK, 0 rows affected (0.00 sec)

mysql> -- 1) Create  a  union  of  two  queries  that  shows  the  names,  cities,  and  ratings  of  all customers.  Those  with  rating  of  200  or  greater  will  also  have  the  words  ?High Rating?, while the others will have the words ?Low Rating?.
Query OK, 0 rows affected (0.00 sec)

mysql> SELECT cname, city, rating, 'High Rating' AS status
    -> FROM Customers
    -> WHERE rating >= 200
    -> 
    -> UNION
    -> 
    -> SELECT cname, city, rating, 'Low Rating' AS status
    -> FROM Customers
    -> WHERE rating < 200;
+----------+----------+--------+-------------+
| cname    | city     | rating | status      |
+----------+----------+--------+-------------+
| Giovanni | Rome     |    200 | High Rating |
| Liu      | San Jose |    200 | High Rating |
| Grass    | Berlin   |    300 | High Rating |
| Cisneros | San Jose |    300 | High Rating |
| Hoffman  | London   |    100 | Low Rating  |
| Clemens  | London   |    100 | Low Rating  |
| Pereira  | Rome     |    100 | Low Rating  |
+----------+----------+--------+-------------+
7 rows in set (0.00 sec)

mysql> -- 2) Write  a  command  that  produces  the  name  and  number  of  each  salesperson  and each  customer  with  more  than  one  current  order.  Put  the  results  in  alphabetical order.
Query OK, 0 rows affected (0.00 sec)

mysql> SELECT s.sname AS name, s.snum AS number
    -> FROM Salespeople s
    -> WHERE s.snum IN (
    ->     SELECT snum
    ->     FROM Orders
    ->     GROUP BY snum
    ->     HAVING COUNT(*) > 1
    -> )
    -> 
    -> UNION
    -> 
    -> SELECT c.cname AS name, c.cnum AS number
    -> FROM Customers c
    -> WHERE c.cnum IN (
    ->     SELECT cnum
    ->     FROM Orders
    ->     GROUP BY cnum
    ->     HAVING COUNT(*) > 1
    -> )
    -> 
    -> ORDER BY name;
+----------+--------+
| name     | number |
+----------+--------+
| Cisneros |   2008 |
| Clemens  |   2006 |
| Grass    |   2004 |
| Peel     |   1001 |
| Rifkin   |   1007 |
| Serres   |   1002 |
+----------+--------+
6 rows in set (0.01 sec)

mysql> -- 3) Form a union of three queries. 
Query OK, 0 rows affected (0.00 sec)

mysql> Have the first select the snums of all salespeople in San  Jose;  
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'Have the first select the snums of all salespeople in San  Jose' at line 1
mysql> the  second,  the  cnums  of  all  customers  in  San  Jose;  
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'the  second,  the  cnums  of  all  customers  in  San  Jose' at line 1
mysql> and  the  third  the onums of all orders on October 3. 
    -> Retain duplicates between the last two queries but eliminate any redundancies between either of them and the first.   
    -> (Note: in the sample tables as given, there would be no such redundancy.  This is besides the point.) 
    -> ^C
mysql> -- 3) Form a union of three queries. 
Query OK, 0 rows affected (0.00 sec)

mysql> Have the first select the snums of all salespeople in San  Jose;  
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'Have the first select the snums of all salespeople in San  Jose' at line 1
mysql> the  second,  the  cnums  of  all  customers  in  San  Jose;  
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'the  second,  the  cnums  of  all  customers  in  San  Jose' at line 1
mysql> and  the  third  the onums of all orders on October 3. 
    -> Retain duplicates between the last two queries but eliminate any redundancies between either of them and the first.   
    -> (Note: in the sample tables as given, there would be no such redundancy.  This is besides the point.) 
    -> ^C
mysql> /* 3) Form a union of three queries.  */
    -> Have the first select the snums of all salespeople in San  Jose;  
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'Have the first select the snums of all salespeople in San  Jose' at line 2
mysql> the  second,  the  cnums  of  all  customers  in  San  Jose;  
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'the  second,  the  cnums  of  all  customers  in  San  Jose' at line 1
mysql> and  the  third  the onums of all orders on October 3. 
    -> Retain duplicates between the last two queries but eliminate any redundancies between either of them and the first.   
    -> (Note: in the sample tables as given, there would be no such redundancy.  This is besides the point.) 
    -> SELECT snum AS num
    -> FROM Salespeople
    -> WHERE city = 'San Jose'
    -> 
    -> UNION
    -> 
    -> SELECT cnum
    -> FROM Customers
    -> WHERE city = 'San Jose'
    -> 
    -> UNION ALL
    -> 
    -> SELECT onum
    -> FROM Orders
    -> WHERE odate = '1990-10-03';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'and  the  third  the onums of all orders on October 3. 
Retain duplicates betwee' at line 1
mysql> SELECT snum AS num
    -> FROM Salespeople
    -> WHERE city = 'San Jose'
    -> 
    -> UNION
    -> 
    -> SELECT cnum
    -> FROM Customers
    -> WHERE city = 'San Jose'
    -> 
    -> UNION ALL
    -> 
    -> SELECT onum
    -> FROM Orders
    -> WHERE odate = '1990-10-03';
+------+
| num  |
+------+
| 1002 |
| 2003 |
| 2008 |
| 3001 |
| 3003 |
| 3002 |
| 3005 |
| 3006 |
+------+
8 rows in set (0.01 sec)

mysql> notee;
mysql> notee;
