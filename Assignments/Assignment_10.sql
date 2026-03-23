mysql> -- 1) Write  a  query  that  produces  all  pairs  of  salespeople  who  are  living  in  the  same city.    Exclude  combinations  of  salespeople  with  themselves  as  well  as  duplicate rows with the order reversed.
Query OK, 0 rows affected (0.00 sec)

mysql> SELECT s1.sname, s2.sname, s1.city
    -> FROM Salespeople s1
    -> JOIN Salespeople s2
    -> ON s1.city = s2.city
    -> WHERE s1.snum < s2.snum;
+-------+--------+--------+
| sname | sname  | city   |
+-------+--------+--------+
| Peel  | Motika | London |
+-------+--------+--------+
1 row in set (0.00 sec)

mysql> 2) Write  a  query  that  produces  the  names  and  cities  of  all  customers  with  the  same rating as Hoffman.
    -> 
    -> ^C
mysql> SELECT cname, city
    -> FROM Customers
    -> WHERE rating = (
    ->     SELECT rating
    ->     FROM Customers
    ->     WHERE cname = 'Hoffman'
    -> );
+---------+--------+
| cname   | city   |
+---------+--------+
| Hoffman | London |
| Clemens | London |
| Pereira | Rome   |
+---------+--------+
3 rows in set (0.00 sec)

mysql> SELECT cname, city, rating
    -> FROM Customers
    -> WHERE rating = (
    ->     SELECT rating
    ->     FROM Customers
    ->     WHERE cname = 'Hoffman'
    -> );
+---------+--------+--------+
| cname   | city   | rating |
+---------+--------+--------+
| Hoffman | London |    100 |
| Clemens | London |    100 |
| Pereira | Rome   |    100 |
+---------+--------+--------+
3 rows in set (0.00 sec)

mysql> notee
