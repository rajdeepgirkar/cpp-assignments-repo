mysql> -- Assignment ? 14 Entering, Deleting, and Changing Field Values.
Query OK, 0 rows affected (0.00 sec)

mysql> -- 1) Write  a  command  that  puts  the  following  values,  in  their  given  order,  into  the salespeople table: city ? San Jose, name ? Blanco, comm ? NULL, cnum ? 1100.
Query OK, 0 rows affected (0.00 sec)

mysql> INSERT INTO Salespeople (snum, sname, city, comm)
    -> VALUES (1100, 'Blanco', 'San Jose', NULL);
Query OK, 1 row affected (0.01 sec)

mysql> SELECT * FROM SALESPEOPLE;
+------+---------+-----------+------+
| Snum | Sname   | City      | Comm |
+------+---------+-----------+------+
| 1001 | Peel    | London    | 0.12 |
| 1002 | Serres  | San Jose  | 0.13 |
| 1004 | Motika  | London    | 0.11 |
| 1007 | Rifkin  | Barcelona | 0.15 |
| 1003 | Axelrod | New York  | 0.10 |
| 1100 | Blanco  | San Jose  | NULL |
+------+---------+-----------+------+
6 rows in set (0.00 sec)

mysql> -- 2) Write  a  command  that  removes  all  orders  from  customer  Clemens  from  the Orders table.
Query OK, 0 rows affected (0.00 sec)

mysql> DELETE FROM Orders
    -> WHERE cnum = (
    ->     SELECT cnum
    ->     FROM Customers
    ->     WHERE cname = 'Clemens'
    -> );
Query OK, 2 rows affected (0.01 sec)

mysql> SELECT * FROM ORDERS;
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

mysql> -- 3) Write a command that increases the rating of all customers in Rome by 100.
Query OK, 0 rows affected (0.00 sec)

mysql> SELECT * FROM CUSTOMERS;
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

mysql> UPDATE Customers
    -> SET rating = rating + 100
    -> WHERE city = 'Rome';
Query OK, 2 rows affected (0.01 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> SELECT * FROM CUSTOMERS;
+------+----------+----------+--------+------+
| Cnum | Cname    | City     | Rating | Snum |
+------+----------+----------+--------+------+
| 2001 | Hoffman  | London   |    100 | 1001 |
| 2002 | Giovanni | Rome     |    300 | 1003 |
| 2003 | Liu      | San Jose |    200 | 1002 |
| 2004 | Grass    | Berlin   |    300 | 1002 |
| 2006 | Clemens  | London   |    100 | 1001 |
| 2008 | Cisneros | San Jose |    300 | 1007 |
| 2007 | Pereira  | Rome     |    200 | 1004 |
+------+----------+----------+--------+------+
7 rows in set (0.00 sec)

mysql> -- 4) Salesperson Serres has left the company. Assign her customers to Motika.
Query OK, 0 rows affected (0.00 sec)

mysql> select *  from salespeople;
+------+---------+-----------+------+
| Snum | Sname   | City      | Comm |
+------+---------+-----------+------+
| 1001 | Peel    | London    | 0.12 |
| 1002 | Serres  | San Jose  | 0.13 |
| 1004 | Motika  | London    | 0.11 |
| 1007 | Rifkin  | Barcelona | 0.15 |
| 1003 | Axelrod | New York  | 0.10 |
| 1100 | Blanco  | San Jose  | NULL |
+------+---------+-----------+------+
6 rows in set (0.00 sec)

mysql> select *  from customers;
+------+----------+----------+--------+------+
| Cnum | Cname    | City     | Rating | Snum |
+------+----------+----------+--------+------+
| 2001 | Hoffman  | London   |    100 | 1001 |
| 2002 | Giovanni | Rome     |    300 | 1003 |
| 2003 | Liu      | San Jose |    200 | 1002 |
| 2004 | Grass    | Berlin   |    300 | 1002 |
| 2006 | Clemens  | London   |    100 | 1001 |
| 2008 | Cisneros | San Jose |    300 | 1007 |
| 2007 | Pereira  | Rome     |    200 | 1004 |
+------+----------+----------+--------+------+
7 rows in set (0.00 sec)

mysql> UPDATE Customers
    -> SET snum = (
    ->     SELECT snum
    ->     FROM Salespeople
    ->     WHERE sname = 'Motika'
    -> )
    -> WHERE snum = (
    ->     SELECT snum
    ->     FROM Salespeople
    ->     WHERE sname = 'Serres'
    -> );
Query OK, 2 rows affected (0.01 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> select *  from salespeople;
+------+---------+-----------+------+
| Snum | Sname   | City      | Comm |
+------+---------+-----------+------+
| 1001 | Peel    | London    | 0.12 |
| 1002 | Serres  | San Jose  | 0.13 |
| 1004 | Motika  | London    | 0.11 |
| 1007 | Rifkin  | Barcelona | 0.15 |
| 1003 | Axelrod | New York  | 0.10 |
| 1100 | Blanco  | San Jose  | NULL |
+------+---------+-----------+------+
6 rows in set (0.00 sec)

mysql> select *  from customers;
+------+----------+----------+--------+------+
| Cnum | Cname    | City     | Rating | Snum |
+------+----------+----------+--------+------+
| 2001 | Hoffman  | London   |    100 | 1001 |
| 2002 | Giovanni | Rome     |    300 | 1003 |
| 2003 | Liu      | San Jose |    200 | 1004 |
| 2004 | Grass    | Berlin   |    300 | 1004 |
| 2006 | Clemens  | London   |    100 | 1001 |
| 2008 | Cisneros | San Jose |    300 | 1007 |
| 2007 | Pereira  | Rome     |    200 | 1004 |
+------+----------+----------+--------+------+
7 rows in set (0.00 sec)

mysql> notee;
