mysql> -- Assignment ?7 Summarizing Data with Aggregate Functions.
Query OK, 0 rows affected (0.00 sec)

mysql> -- 1) Write a query that counts all orders for October 3.
Query OK, 0 rows affected (0.00 sec)

mysql> SELECT COUNT(*)
    -> FROM Orders
    -> WHERE odate = '1990-10-03';
+----------+
| COUNT(*) |
+----------+
|        5 |
+----------+
1 row in set (0.01 sec)

mysql> SELECT *
    -> FROM Orders
    -> WHERE odate = '1990-10-03';
+------+---------+------------+------+------+
| Onum | Amt     | Odate      | Cnum | Snum |
+------+---------+------------+------+------+
| 3001 |   18.69 | 1990-10-03 | 2008 | 1007 |
| 3003 |  767.19 | 1990-10-03 | 2001 | 1001 |
| 3002 | 1900.10 | 1990-10-03 | 2007 | 1004 |
| 3005 | 5160.45 | 1990-10-03 | 2003 | 1002 |
| 3006 | 1098.16 | 1990-10-03 | 2008 | 1007 |
+------+---------+------------+------+------+
5 rows in set (0.00 sec)

mysql> -- 2) Write a query that counts the number of different non-NULL city values in the Customers table.
Query OK, 0 rows affected (0.00 sec)

mysql> SELECT COUNT(DISTINCT city)
    -> FROM Customers;
+----------------------+
| COUNT(DISTINCT city) |
+----------------------+
|                    4 |
+----------------------+
1 row in set (0.00 sec)

mysql> SELECT DISTINCT city
    -> FROM Customers;
+----------+
| city     |
+----------+
| London   |
| Rome     |
| San Jose |
| Berlin   |
+----------+
4 rows in set (0.00 sec)

mysql> -- 3) Write a query that selects each customer?s smallest order.
Query OK, 0 rows affected (0.00 sec)

mysql> SELECT cnum, MIN(amt) AS smallest_order
    -> FROM Orders
    -> GROUP BY cnum;
+------+----------------+
| cnum | smallest_order |
+------+----------------+
| 2008 |          18.69 |
| 2001 |         767.19 |
| 2007 |        1900.10 |
| 2003 |        5160.45 |
| 2002 |        1713.23 |
| 2004 |          75.75 |
| 2006 |        4723.00 |
+------+----------------+
7 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM Customers
    -> WHERE cname LIKE 'G%'
    -> ORDER BY cname
    -> LIMIT 1;
+------+----------+------+--------+------+
| Cnum | Cname    | City | Rating | Snum |
+------+----------+------+--------+------+
| 2002 | Giovanni | Rome |    200 | 1003 |
+------+----------+------+--------+------+
1 row in set (0.00 sec)

mysql> -- 5) Write a query that selects the highest rating in each city.
Query OK, 0 rows affected (0.00 sec)

mysql> SELECT city, MAX(rating) AS highest_rating
    -> FROM Customers
    -> GROUP BY city;
+----------+----------------+
| city     | highest_rating |
+----------+----------------+
| London   |            100 |
| Rome     |            200 |
| San Jose |            300 |
| Berlin   |            300 |
+----------+----------------+
4 rows in set (0.00 sec)

mysql> -- 6) Write a query that counts the number of salespeople registering orders for each day. (If a salesperson has more than one order on a given day, he or she should be counted only once.).
Query OK, 0 rows affected (0.00 sec)

mysql> SELECT odate, COUNT(DISTINCT snum) AS num_salespeople
    -> FROM Orders
    -> GROUP BY odate;
+------------+-----------------+
| odate      | num_salespeople |
+------------+-----------------+
| 1990-10-03 |               4 |
| 1990-10-04 |               2 |
| 1990-10-05 |               1 |
| 1990-10-06 |               2 |
+------------+-----------------+
4 rows in set (0.00 sec)

mysql> commit;
Query OK, 0 rows affected (0.00 sec)

mysql> notee;
