mysql> tee C:\PGCP_AC\DBT\Assignments\Assignment_16.sql
mysql> -- 1) Write a command that will enable a user to pull orders grouped by date out of the Orders table quickly.
Query OK, 0 rows affected (0.00 sec)

mysql> CREATE INDEX idx_orders_odate
    -> ON Orders(odate);
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from orders;
+------+---------+------------+------+------+
| Onum | Amt     | Odate      | Cnum | Snum |
+------+---------+------------+------+------+
| 3001 |   18.69 | 1990-10-03 | 2008 | 1007 |
| 3003 |  767.19 | 1990-10-03 | 2001 | 1001 |
| 3002 | 1900.10 | 1990-10-03 | 2007 | 1004 |
| 3005 | 5160.45 | 1990-10-03 | 2003 | 1002 |
| 3006 | 1098.16 | 1990-10-03 | 2008 | 1007 |
| 3009 | 1713.23 | 1990-10-04 | 2002 | 1003 |
| 3007 |   75.75 | 1990-10-04 | 2004 | 1002 |
| 3010 | 1309.95 | 1990-10-06 | 2004 | 1002 |
+------+---------+------------+------+------+
8 rows in set (0.00 sec)

mysql> -- 2) If the Orders table has already been created, how can you force the onum field to be unique (assume all current values are unique)?
Query OK, 0 rows affected (0.00 sec)

mysql> ALTER TABLE Orders
    -> ADD CONSTRAINT unique_onum UNIQUE (onum);
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from orders;
+------+---------+------------+------+------+
| Onum | Amt     | Odate      | Cnum | Snum |
+------+---------+------------+------+------+
| 3001 |   18.69 | 1990-10-03 | 2008 | 1007 |
| 3003 |  767.19 | 1990-10-03 | 2001 | 1001 |
| 3002 | 1900.10 | 1990-10-03 | 2007 | 1004 |
| 3005 | 5160.45 | 1990-10-03 | 2003 | 1002 |
| 3006 | 1098.16 | 1990-10-03 | 2008 | 1007 |
| 3009 | 1713.23 | 1990-10-04 | 2002 | 1003 |
| 3007 |   75.75 | 1990-10-04 | 2004 | 1002 |
| 3010 | 1309.95 | 1990-10-06 | 2004 | 1002 |
+------+---------+------------+------+------+
8 rows in set (0.00 sec)

mysql> INSERT INTO Orders VALUES (4001, 500, '1990-10-10', 2001, 1001);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Orders VALUES (3001, 600, '1990-10-11', 2002, 1002);
ERROR 1062 (23000): Duplicate entry '3001' for key 'orders.unique_onum'
mysql> select * from orders;
+------+---------+------------+------+------+
| Onum | Amt     | Odate      | Cnum | Snum |
+------+---------+------------+------+------+
| 3001 |   18.69 | 1990-10-03 | 2008 | 1007 |
| 3003 |  767.19 | 1990-10-03 | 2001 | 1001 |
| 3002 | 1900.10 | 1990-10-03 | 2007 | 1004 |
| 3005 | 5160.45 | 1990-10-03 | 2003 | 1002 |
| 3006 | 1098.16 | 1990-10-03 | 2008 | 1007 |
| 3009 | 1713.23 | 1990-10-04 | 2002 | 1003 |
| 3007 |   75.75 | 1990-10-04 | 2004 | 1002 |
| 3010 | 1309.95 | 1990-10-06 | 2004 | 1002 |
| 4001 |  500.00 | 1990-10-10 | 2001 | 1001 |
+------+---------+------------+------+------+
9 rows in set (0.00 sec)

mysql> -- 3) Create  an  index  that  would  permit  each  salesperson  to  retrieve  his  or  her  orders grouped by date quickly.
Query OK, 0 rows affected (0.00 sec)

mysql> CREATE INDEX idx_snum_odate
    -> ON Orders(snum, odate);
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from orders;
+------+---------+------------+------+------+
| Onum | Amt     | Odate      | Cnum | Snum |
+------+---------+------------+------+------+
| 3001 |   18.69 | 1990-10-03 | 2008 | 1007 |
| 3003 |  767.19 | 1990-10-03 | 2001 | 1001 |
| 3002 | 1900.10 | 1990-10-03 | 2007 | 1004 |
| 3005 | 5160.45 | 1990-10-03 | 2003 | 1002 |
| 3006 | 1098.16 | 1990-10-03 | 2008 | 1007 |
| 3009 | 1713.23 | 1990-10-04 | 2002 | 1003 |
| 3007 |   75.75 | 1990-10-04 | 2004 | 1002 |
| 3010 | 1309.95 | 1990-10-06 | 2004 | 1002 |
| 4001 |  500.00 | 1990-10-10 | 2001 | 1001 |
+------+---------+------------+------+------+
9 rows in set (0.00 sec)

mysql> -- 4) Let  us  assume  that  each  salesperson  is  to  have  only  one  customer  of  a  given rating, and that this is currently the case. Enter a command that enforces it.
Query OK, 0 rows affected (0.00 sec)

mysql> ALTER TABLE Customers
    -> ADD CONSTRAINT unique_snum_rating UNIQUE (snum, rating);
ERROR 1062 (23000): Duplicate entry '1004-200' for key 'customers.unique_snum_rating'
mysql> SELECT snum, rating, COUNT(*)
    -> FROM Customers
    -> GROUP BY snum, rating
    -> HAVING COUNT(*) > 1;
+------+--------+----------+
| snum | rating | COUNT(*) |
+------+--------+----------+
| 1004 |    200 |        2 |
+------+--------+----------+
1 row in set (0.00 sec)

mysql> SELECT *
    -> FROM Customers
    -> WHERE snum = 1004 AND rating = 200;
+------+---------+----------+--------+------+
| Cnum | Cname   | City     | Rating | Snum |
+------+---------+----------+--------+------+
| 2003 | Liu     | San Jose |    200 | 1004 |
| 2007 | Pereira | Rome     |    200 | 1004 |
+------+---------+----------+--------+------+
2 rows in set (0.01 sec)

mysql> UPDATE Customers
    -> SET rating = 250
    -> WHERE cnum = 2007;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT *
    -> FROM Customers
    -> WHERE snum = 1004 AND rating = 200;
+------+-------+----------+--------+------+
| Cnum | Cname | City     | Rating | Snum |
+------+-------+----------+--------+------+
| 2003 | Liu   | San Jose |    200 | 1004 |
+------+-------+----------+--------+------+
1 row in set (0.00 sec)

mysql> SELECT snum, rating, COUNT(*)
    ->     -> FROM Customers
    ->     -> GROUP BY snum, rating
    ->     -> HAVING COUNT(*) > 1;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '-> FROM Customers
    -> GROUP BY snum, rating
    -> HAVING COUNT(*) > 1' at line 2
mysql> SELECT snum, rating, COUNT(*)
    -> FROM Customers
    -> GROUP BY snum, rating
    -> HAVING COUNT(*) > 1;
Empty set (0.00 sec)

mysql> ALTER TABLE Customers
    -> ADD CONSTRAINT unique_snum_rating UNIQUE (snum, rating);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from customers;
+------+----------+----------+--------+------+
| Cnum | Cname    | City     | Rating | Snum |
+------+----------+----------+--------+------+
| 2001 | Hoffman  | London   |    100 | 1001 |
| 2002 | Giovanni | Rome     |    300 | 1003 |
| 2003 | Liu      | San Jose |    200 | 1004 |
| 2004 | Grass    | Berlin   |    300 | 1004 |
| 2008 | Cisneros | San Jose |    300 | 1007 |
| 2007 | Pereira  | Rome     |    250 | 1004 |
+------+----------+----------+--------+------+
6 rows in set (0.00 sec)

mysql> notee
