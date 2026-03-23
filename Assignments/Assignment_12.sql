mysql> -- 1) Write a query that selects all customers whose ratings are equal to or greater than ANY of Serres?.
Query OK, 0 rows affected (0.00 sec)

mysql> select * 
    -> from customers
    -> where rating >= any(
    -> select rating
    -> from customer
    -> where cname = 'Serres');
-- ERROR 1146 (42S02): Table 'kharghar.customer' doesn't exist
mysql> select * 
    -> from customers
    -> where rating >= any(
    -> select rating
    -> from customers
    -> where cname = 'Serres');
Empty set (0.01 sec)

mysql> select * from customers;
+------+----------+----------+--------+------+
| Cnum | Cname    | City     | Rating | Snum |
+------+----------+----------+--------+------+
| 2001 | Hoffman  | London   |    100 | 1001 |
| 2002 | Giovanni | Rome     |    200 | 1003 |
| 2003 | Liu      | San Jose |    200 | 1002 |
| 2004 | Grass    | Berlin   |    300 | 1002 |
| 2006 | Clemens  | London   |    100 | 1001 |
| 2008 | Cisneros | San Jose |    300 | 1007 |
| 2007 | Pereira  | Rome     |    100 | 1004 |
+------+----------+----------+--------+------+
7 rows in set (0.00 sec)

mysql> select * from salespeople;
+------+---------+-----------+------+
| Snum | Sname   | City      | Comm |
+------+---------+-----------+------+
| 1001 | Peel    | London    | 0.12 |
| 1002 | Serres  | San Jose  | 0.13 |
| 1004 | Motika  | London    | 0.11 |
| 1007 | Rifkin  | Barcelona | 0.15 |
| 1003 | Axelrod | New York  | 0.10 |
+------+---------+-----------+------+
5 rows in set (0.01 sec)

mysql> select * 
    -> from customers
    -> where snum = ( 
    -> select snum
    -> from salespeople
    -> where sname = 'Serres');
+------+-------+----------+--------+------+
| Cnum | Cname | City     | Rating | Snum |
+------+-------+----------+--------+------+
| 2003 | Liu   | San Jose |    200 | 1002 |
| 2004 | Grass | Berlin   |    300 | 1002 |
+------+-------+----------+--------+------+
2 rows in set (0.00 sec)

mysql> -- 2) Write a query using ANY or ALL that will find all salespeople who have no customers located in their city.
Query OK, 0 rows affected (0.00 sec)

mysql> SELECT *
    -> FROM Salespeople s
    -> WHERE city <> ALL (
    ->     SELECT city
    ->     FROM Customers c
    ->     WHERE c.snum = s.snum
    -> );
+------+---------+-----------+------+
| Snum | Sname   | City      | Comm |
+------+---------+-----------+------+
| 1004 | Motika  | London    | 0.11 |
| 1007 | Rifkin  | Barcelona | 0.15 |
| 1003 | Axelrod | New York  | 0.10 |
+------+---------+-----------+------+
3 rows in set (0.00 sec)

mysql> -- 3) Write a query that selects all orders for amounts greater than any for the customers in London.
Query OK, 0 rows affected (0.00 sec)

mysql> SELECT *
    -> FROM Orders
    -> WHERE amt > ANY (
    ->     SELECT amt
    ->     FROM Orders
    ->     WHERE cnum IN (
    ->         SELECT cnum
    ->         FROM Customers
    ->         WHERE city = 'London'
    ->     )
    -> );
+------+---------+------------+------+------+
| Onum | Amt     | Odate      | Cnum | Snum |
+------+---------+------------+------+------+
| 3002 | 1900.10 | 1990-10-03 | 2007 | 1004 |
| 3005 | 5160.45 | 1990-10-03 | 2003 | 1002 |
| 3006 | 1098.16 | 1990-10-03 | 2008 | 1007 |
| 3009 | 1713.23 | 1990-10-04 | 2002 | 1003 |
| 3008 | 4723.00 | 1990-10-05 | 2006 | 1001 |
| 3010 | 1309.95 | 1990-10-06 | 2004 | 1002 |
| 3011 | 9891.88 | 1990-10-06 | 2006 | 1001 |
+------+---------+------------+------+------+
7 rows in set (0.01 sec)

mysql> -- 4) Write the above query using MIN or MAX.
Query OK, 0 rows affected (0.00 sec)

mysql> SELECT *
    -> FROM Orders
    -> WHERE amt > (
    ->     SELECT MIN(amt)
    ->     FROM Orders
    ->     WHERE cnum IN (
    ->         SELECT cnum
    ->         FROM Customers
    ->         WHERE city = 'London'
    ->     )
    -> );
+------+---------+------------+------+------+
| Onum | Amt     | Odate      | Cnum | Snum |
+------+---------+------------+------+------+
| 3002 | 1900.10 | 1990-10-03 | 2007 | 1004 |
| 3005 | 5160.45 | 1990-10-03 | 2003 | 1002 |
| 3006 | 1098.16 | 1990-10-03 | 2008 | 1007 |
| 3009 | 1713.23 | 1990-10-04 | 2002 | 1003 |
| 3008 | 4723.00 | 1990-10-05 | 2006 | 1001 |
| 3010 | 1309.95 | 1990-10-06 | 2004 | 1002 |
| 3011 | 9891.88 | 1990-10-06 | 2006 | 1001 |
+------+---------+------------+------+------+
7 rows in set (0.00 sec)

mysql> notee;
