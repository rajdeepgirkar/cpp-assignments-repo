mysql> -- Assignment ? 6  Using Special Operators in Conditions.
Query OK, 0 rows affected (0.00 sec)

mysql> -- 1) Write two different queries that would produce all orders taken on October 3rd or 4th, 1990.
Query OK, 0 rows affected (0.00 sec)

mysql> select * from orders
    -> where odate = '1990-10-03'
    -> or odate = '1990-10-04';
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
+------+---------+------------+------+------+
7 rows in set (0.00 sec)

mysql> select * from orders
    -> where odate in ('1990-10-03', '1990-10-04');
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
+------+---------+------------+------+------+
7 rows in set (0.00 sec)

mysql> -- 2) Write a query that selects all of the customers serviced by Peel or Motika. (Hint: the snum field relates the two tables to one another).
Query OK, 0 rows affected (0.00 sec)

mysql> select * 
    -> from customers where snum in (
    -> select snum
    -> from salespeople
    -> where sname = 'Peel' or sname = 'Motika'
    -> );
+------+---------+--------+--------+------+
| Cnum | Cname   | City   | Rating | Snum |
+------+---------+--------+--------+------+
| 2001 | Hoffman | London |    100 | 1001 |
| 2006 | Clemens | London |    100 | 1001 |
| 2007 | Pereira | Rome   |    100 | 1004 |
+------+---------+--------+--------+------+
3 rows in set (0.00 sec)

mysql> select cname 
    -> from customers where snum in (
    -> select snum
    -> from salespeople
    -> where sname = 'Peel' or sname = 'Motika'
    -> );
+---------+
| cname   |
+---------+
| Hoffman |
| Clemens |
| Pereira |
+---------+
3 rows in set (0.00 sec)

mysql> -- 3) Write a query that will produce all the customers whose names begin with a letter from ?A? to ?G?.
Query OK, 0 rows affected (0.00 sec)

mysql> select cname 
    -> from customers
    -> where cname like 'A%'
    -> or cname like 'B%'
    -> or cname like 'C%'
    -> or cname like 'D%'
    -> or cname like 'E%'
    -> or cname like 'F%'
    -> or cname like 'G%';
+----------+
| cname    |
+----------+
| Giovanni |
| Grass    |
| Clemens  |
| Cisneros |
+----------+
4 rows in set (0.00 sec)

mysql> -- 4) Write a query that selects all customers whose names begin with the letter ?C?.
Query OK, 0 rows affected (0.00 sec)

mysql> select cname 
    -> from customers
    -> where cname like 'C%';
+----------+
| cname    |
+----------+
| Clemens  |
| Cisneros |
+----------+
2 rows in set (0.00 sec)

mysql> -- 5) Write a query that selects all orders except those with zeroes or NULLs in the amt field.
Query OK, 0 rows affected (0.00 sec)

mysql> select * 
    -> from orders 
    -> where amt <> 0
    -> and amt is not null;
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
| 3008 | 4723.00 | 1990-10-05 | 2006 | 1001 |
| 3010 | 1309.95 | 1990-10-06 | 2004 | 1002 |
| 3011 | 9891.88 | 1990-10-06 | 2006 | 1001 |
+------+---------+------------+------+------+
10 rows in set (0.00 sec)

mysql> select * 
    -> from orders ;
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
| 3008 | 4723.00 | 1990-10-05 | 2006 | 1001 |
| 3010 | 1309.95 | 1990-10-06 | 2004 | 1002 |
| 3011 | 9891.88 | 1990-10-06 | 2006 | 1001 |
+------+---------+------------+------+------+
10 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM Orders
    -> WHERE amt IS NOT NULL
    ->   AND amt NOT IN (0);
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
| 3008 | 4723.00 | 1990-10-05 | 2006 | 1001 |
| 3010 | 1309.95 | 1990-10-06 | 2004 | 1002 |
| 3011 | 9891.88 | 1990-10-06 | 2006 | 1001 |
+------+---------+------------+------+------+
10 rows in set (0.00 sec)

mysql> commit
    -> ;
Query OK, 0 rows affected (0.00 sec)

mysql> notee
