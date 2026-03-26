mysql> -- Assignment ? 15 Using Subqueries with DML Commands.
Query OK, 0 rows affected (0.00 sec)

mysql> -- 1) Assume there is a table called Multicust, with all of the same column definitions as Salespeople. Write a command that inserts all salespeople with more than one customer into this table.
Query OK, 0 rows affected (0.00 sec)

mysql> insert into Multicust
    -> select * from salespeople
    -> where snum in (
    -> select snum
    -> from customers
    -> group by snum
    -> having count(*) > 1
    -> );
-- ERROR 1146 (42S02): Table 'kharghar.multicust' doesn't exist
mysql> create table Multicust like Salespeople;
Query OK, 0 rows affected, 1 warning (0.04 sec)

mysql> insert into Multicust
    -> select * from salespeople
    -> where snum in (
    -> select snum
    -> from customers
    -> group by snum
    -> having count(*) > 1
    -> );
Query OK, 2 rows affected (0.04 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from multicust;
+------+--------+--------+------+
| Snum | Sname  | City   | Comm |
+------+--------+--------+------+
| 1001 | Peel   | London | 0.12 |
| 1004 | Motika | London | 0.11 |
+------+--------+--------+------+
2 rows in set (0.00 sec)

mysql> -- 2) Write a command that deletes all customers with no current orders.
Query OK, 0 rows affected (0.00 sec)

mysql> delete from Customers
    -> where cnum not in (
    -> select distinct cnum
    -> from Orders
    -> );
Query OK, 1 row affected (0.04 sec)

mysql> select * from customers;
+------+----------+----------+--------+------+
| Cnum | Cname    | City     | Rating | Snum |
+------+----------+----------+--------+------+
| 2001 | Hoffman  | London   |    100 | 1001 |
| 2002 | Giovanni | Rome     |    300 | 1003 |
| 2003 | Liu      | San Jose |    200 | 1004 |
| 2004 | Grass    | Berlin   |    300 | 1004 |
| 2008 | Cisneros | San Jose |    300 | 1007 |
| 2007 | Pereira  | Rome     |    200 | 1004 |
+------+----------+----------+--------+------+
6 rows in set (0.00 sec)

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

mysql> -- 3) Write  a  command  that  increases  by  twenty  percent  the  commissions  of  all salespeople with total orders above Rs. 3,000.
Query OK, 0 rows affected (0.00 sec)

mysql> UPDATE Salespeople
    -> SET comm = comm * 1.2
    -> WHERE snum IN (
    ->     SELECT snum
    ->     FROM Orders
    ->     GROUP BY snum
    ->     HAVING SUM(amt) > 3000
    -> );
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from salespeople;
+------+---------+-----------+------+
| Snum | Sname   | City      | Comm |
+------+---------+-----------+------+
| 1001 | Peel    | London    | 0.12 |
| 1002 | Serres  | San Jose  | 0.16 |
| 1004 | Motika  | London    | 0.11 |
| 1007 | Rifkin  | Barcelona | 0.15 |
| 1003 | Axelrod | New York  | 0.10 |
| 1100 | Blanco  | San Jose  | NULL |
+------+---------+-----------+------+
6 rows in set (0.00 sec)

mysql> notee;
