mysql> -- Assignment ? 9 Querying Multiple Tables at Once.
Query OK, 0 rows affected (0.00 sec)

mysql> SELECT o.onum, c.cname
    -> FROM Orders o
    -> JOIN Customers c
    -> ON o.cnum = c.cnum;
+------+----------+
| onum | cname    |
+------+----------+
| 3001 | Cisneros |
| 3003 | Hoffman  |
| 3002 | Pereira  |
| 3005 | Liu      |
| 3006 | Cisneros |
| 3009 | Giovanni |
| 3007 | Grass    |
| 3008 | Clemens  |
| 3010 | Grass    |
| 3011 | Clemens  |
+------+----------+
10 rows in set (0.00 sec)

mysql> -- 2) Write  a  query  that  gives  the  names  of  both  the  salesperson  and  the  customer  for each order along with the order number.
Query OK, 0 rows affected (0.00 sec)

mysql> SELECT o.onum, s.sname, c.cname
    -> FROM Orders o
    -> JOIN Customers c ON o.cnum = c.cnum
    -> JOIN Salespeople s ON o.snum = s.snum;
+------+---------+----------+
| onum | sname   | cname    |
+------+---------+----------+
| 3003 | Peel    | Hoffman  |
| 3009 | Axelrod | Giovanni |
| 3005 | Serres  | Liu      |
| 3010 | Serres  | Grass    |
| 3007 | Serres  | Grass    |
| 3011 | Peel    | Clemens  |
| 3008 | Peel    | Clemens  |
| 3006 | Rifkin  | Cisneros |
| 3001 | Rifkin  | Cisneros |
| 3002 | Motika  | Pereira  |
+------+---------+----------+
10 rows in set (0.00 sec)

mysql> -- 3) Write a query that produces all customers serviced by salespeople with a commission  above  12%.  Output  the  customer?s  name,  the  salesperson?s  name, and the salesperson?s rate of commission.
Query OK, 0 rows affected (0.00 sec)

mysql> SELECT c.cname, s.sname, s.comm
    -> FROM Customers c
    -> JOIN Salespeople s
    -> ON c.snum = s.snum
    -> WHERE s.comm > 0.12;
+----------+--------+------+
| cname    | sname  | comm |
+----------+--------+------+
| Liu      | Serres | 0.13 |
| Grass    | Serres | 0.13 |
| Cisneros | Rifkin | 0.15 |
+----------+--------+------+
3 rows in set (0.00 sec)

mysql> -- 4) Write a query that calculates the amount of the salesperson?s commission on each order by a customer with a rating above 100.
Query OK, 0 rows affected (0.00 sec)

mysql> SELECT o.onum, s.sname, (o.amt * s.comm) AS commission
    -> FROM Orders o
    -> JOIN Customers c ON o.cnum = c.cnum
    -> JOIN Salespeople s ON o.snum = s.snum
    -> WHERE c.rating > 100;
+------+---------+------------+
| onum | sname   | commission |
+------+---------+------------+
| 3010 | Serres  |     170.29 |
| 3007 | Serres  |       9.85 |
| 3005 | Serres  |     670.86 |
| 3006 | Rifkin  |     164.72 |
| 3001 | Rifkin  |       2.80 |
| 3009 | Axelrod |     171.32 |
+------+---------+------------+
6 rows in set (0.00 sec)

mysql> notee;
