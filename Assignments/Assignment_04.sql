mysql> -- Assignment 4 Retrieving Information from Tables.
Query OK, 0 rows affected (0.00 sec)

mysql> -- Write a select command that produces the order number, amount, and date for all rows in the Orders table.
Query OK, 0 rows affected (0.00 sec)

mysql> use kharghar;
Database changed
mysql> select kharghar;
ERROR 1054 (42S22): Unknown column 'kharghar' in 'field list'
mysql> select kharghar();
ERROR 1305 (42000): FUNCTION kharghar.kharghar does not exist
mysql> select database();
+------------+
| database() |
+------------+
| kharghar   |
+------------+
1 row in set (0.00 sec)

mysql> -- 1. Write a select command that produces the order number, amount, and date for all rows in the Orders table.
Query OK, 0 rows affected (0.00 sec)

mysql> select onum, amt, odate from orders;
+------+---------+------------+
| onum | amt     | odate      |
+------+---------+------------+
| 3001 |   18.69 | 1990-10-03 |
| 3003 |  767.19 | 1990-10-03 |
| 3002 | 1900.10 | 1990-10-03 |
| 3005 | 5160.45 | 1990-10-03 |
| 3006 | 1098.16 | 1990-10-03 |
| 3009 | 1713.23 | 1990-10-04 |
| 3007 |   75.75 | 1990-10-04 |
| 3008 | 4723.00 | 1990-10-05 |
| 3010 | 1309.95 | 1990-10-06 |
| 3011 | 9891.88 | 1990-10-06 |
+------+---------+------------+
10 rows in set (0.00 sec)

mysql> -- 2) Write  a  query  that  produces  all  rows  from  the  Customers  table  for  which  the salesperson?s number is 1001.
Query OK, 0 rows affected (0.00 sec)

mysql> select * from customers where snum = 1001;
+------+---------+--------+--------+------+
| Cnum | Cname   | City   | Rating | Snum |
+------+---------+--------+--------+------+
| 2001 | Hoffman | London |    100 | 1001 |
| 2006 | Clemens | London |    100 | 1001 |
+------+---------+--------+--------+------+
2 rows in set (0.01 sec)

mysql> -- 3) Write  a  query  that  displays  the  Salespeople  table  with  the  columns  in  the following order: city, sname, snum, comm.
Query OK, 0 rows affected (0.00 sec)

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
5 rows in set (0.02 sec)

mysql> select city, sname, snum, comm from salespeople;
+-----------+---------+------+------+
| city      | sname   | snum | comm |
+-----------+---------+------+------+
| London    | Peel    | 1001 | 0.12 |
| San Jose  | Serres  | 1002 | 0.13 |
| London    | Motika  | 1004 | 0.11 |
| Barcelona | Rifkin  | 1007 | 0.15 |
| New York  | Axelrod | 1003 | 0.10 |
+-----------+---------+------+------+
5 rows in set (0.00 sec)

mysql> -- 4) Write  a  select  command  that  produces  the  rating  followed  by  the  name  of  each customer in San Jose.
Query OK, 0 rows affected (0.00 sec)

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

mysql> select Rating, Cname from customers where City = 'San Jose';
+--------+----------+
| Rating | Cname    |
+--------+----------+
|    200 | Liu      |
|    300 | Cisneros |
+--------+----------+
2 rows in set (0.00 sec)

mysql> -- 5) Write  a  query  that  will  produce  the  snum  values  of  all  salespeople  (suppress  the duplicates) with orders in the Orders table.
Query OK, 0 rows affected (0.00 sec)

mysql> select Snum from orders;
+------+
| Snum |
+------+
| 1007 |
| 1001 |
| 1004 |
| 1002 |
| 1007 |
| 1003 |
| 1002 |
| 1001 |
| 1002 |
| 1001 |
+------+
10 rows in set (0.00 sec)

mysql> select distinct Snum from orders;
+------+
| Snum |
+------+
| 1007 |
| 1001 |
| 1004 |
| 1002 |
| 1003 |
+------+
5 rows in set (0.00 sec)

mysql> notee;
