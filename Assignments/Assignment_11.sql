mysql> -- Assignment ? 11 Subqueries.
ERROR 2013 (HY000): Lost connection to MySQL server during query
No connection. Trying to reconnect...
Connection id:    10
Current database: kharghar

Query OK, 0 rows affected (0.01 sec)

mysql> -- 1) Write  a  query  that  uses  a  subquery  to  obtain  all  orders  for  the  customer  named Cisneros. Assume you do not know his customer number (cnum).
Query OK, 0 rows affected (0.00 sec)

mysql> select * from orders
    -> where cnum = (
    -> select cnum
    -> from customers
    -> where cname = 'Cisneros'
    -> );
+------+---------+------------+------+------+
| Onum | Amt     | Odate      | Cnum | Snum |
+------+---------+------------+------+------+
| 3001 |   18.69 | 1990-10-03 | 2008 | 1007 |
| 3006 | 1098.16 | 1990-10-03 | 2008 | 1007 |
+------+---------+------------+------+------+
2 rows in set (0.00 sec)

mysql> -- 2) Write  a  query  that  produces  the  names  and  ratings  of  all  customers  who  have above-average orders.
Query OK, 0 rows affected (0.00 sec)

mysql> select cname, rating
    -> from Cutomers
    -> where cnum in (
    -> select cnum
    -> from orders
    -> where amt > (select avg(amt) from orders));
-- ERROR 1146 (42S02): Table 'kharghar.cutomers' doesn't exist

mysql> select cname, rating
    -> from Customers
    -> where cnum in (
    -> select cnum
    -> from orders
    -> where amt > (select avg(amt) from orders));
+---------+--------+
| cname   | rating |
+---------+--------+
| Liu     |    200 |
| Clemens |    100 |
+---------+--------+
2 rows in set (0.00 sec)

mysql> -- 3) Write  a  query  that  selects  the  total  amount  in  orders  for  each  salesperson  for whom this total is greater than the amount of the largest order in the table.
Query OK, 0 rows affected (0.00 sec)

mysql> select snum, sum(amt) as 'Total  Amount'
    -> from orders
    -> group by snum
    -> having sum(amt) > (select max(amt)
    -> from orders);
+------+---------------+
| snum | Total  Amount |
+------+---------------+
| 1001 |      15382.07 |
+------+---------------+
1 row in set (0.00 sec)

mysql> notee;
