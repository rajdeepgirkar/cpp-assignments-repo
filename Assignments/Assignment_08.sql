mysql>  -- Assignment ?8 Formatting Query output.
    -> 
    -> ^C
mysql> -- 1) Assume  each  salesperson  has  a  12%  commission.  Write  a  query  on  the  orders table that will produce the order number, the salesperson number, and the amount of the salesperson?s commission for that order.
Query OK, 0 rows affected (0.00 sec)

mysql> select onum, snum, amt, amt * 0.12 as Commision from orders;
+------+------+---------+-----------+
| onum | snum | amt     | Commision |
+------+------+---------+-----------+
| 3001 | 1007 |   18.69 |      2.24 |
| 3003 | 1001 |  767.19 |     92.06 |
| 3002 | 1004 | 1900.10 |    228.01 |
| 3005 | 1002 | 5160.45 |    619.25 |
| 3006 | 1007 | 1098.16 |    131.78 |
| 3009 | 1003 | 1713.23 |    205.59 |
| 3007 | 1002 |   75.75 |      9.09 |
| 3008 | 1001 | 4723.00 |    566.76 |
| 3010 | 1002 | 1309.95 |    157.19 |
| 3011 | 1001 | 9891.88 |   1187.03 |
+------+------+---------+-----------+
10 rows in set (0.00 sec)

mysql> select onum, snum, amt * 0.12 as Commision from orders;
+------+------+-----------+
| onum | snum | Commision |
+------+------+-----------+
| 3001 | 1007 |      2.24 |
| 3003 | 1001 |     92.06 |
| 3002 | 1004 |    228.01 |
| 3005 | 1002 |    619.25 |
| 3006 | 1007 |    131.78 |
| 3009 | 1003 |    205.59 |
| 3007 | 1002 |      9.09 |
| 3008 | 1001 |    566.76 |
| 3010 | 1002 |    157.19 |
| 3011 | 1001 |   1187.03 |
+------+------+-----------+
10 rows in set (0.00 sec)

mysql> -- 2) Write a query on the Customers table that will find the highest rating in each city. Put the output in this form: For the city (city), the highest rating is : (rating).
Query OK, 0 rows affected (0.00 sec)

mysql> select concat('For the city', city,', the highest rating is : ', max(rating)) from customers;
ERROR 1140 (42000): In aggregated query without GROUP BY, expression #1 of SELECT list contains nonaggregated column 'kharghar.customers.City'; this is incompatible with sql_mode=only_full_group_by
mysql> select concat('For the city', city,', the highest rating is : ', max(rating)) from customers group by city;
+------------------------------------------------------------------------+
| concat('For the city', city,', the highest rating is : ', max(rating)) |
+------------------------------------------------------------------------+
| For the cityLondon, the highest rating is : 100                        |
| For the cityRome, the highest rating is : 200                          |
| For the citySan Jose, the highest rating is : 300                      |
| For the cityBerlin, the highest rating is : 300                        |
+------------------------------------------------------------------------+
4 rows in set (0.00 sec)

mysql> select concat('For the city ', city,', the highest rating is : ', max(rating)) as OUTPUT from customers group by city;
+----------------------------------------------------+
| OUTPUT                                             |
+----------------------------------------------------+
| For the city London, the highest rating is : 100   |
| For the city Rome, the highest rating is : 200     |
| For the city San Jose, the highest rating is : 300 |
| For the city Berlin, the highest rating is : 300   |
+----------------------------------------------------+
4 rows in set (0.00 sec)

mysql> -- 3) Write a query that lists customers in descending order of rating. Output the rating field first, followed by the customer?s name and number.
Query OK, 0 rows affected (0.00 sec)

mysql> select rating, cname, cnum
    -> from customers
    -> order by rating desc;
+--------+----------+------+
| rating | cname    | cnum |
+--------+----------+------+
|    300 | Grass    | 2004 |
|    300 | Cisneros | 2008 |
|    200 | Giovanni | 2002 |
|    200 | Liu      | 2003 |
|    100 | Hoffman  | 2001 |
|    100 | Clemens  | 2006 |
|    100 | Pereira  | 2007 |
+--------+----------+------+
7 rows in set (0.00 sec)

mysql> -- 4) Write  a  query  that  totals  the  orders  for  each  day  and  places  the  results  in descending order.
Query OK, 0 rows affected (0.00 sec)

mysql> select sum(amt)
    -> from orders
    -> order by amt desc;
+----------+
| sum(amt) |
+----------+
| 26658.40 |
+----------+
1 row in set (0.00 sec)

mysql> select sum(amt)
    -> from orders
    -> group by odate
    -> order by sum(amt) desc;
+----------+
| sum(amt) |
+----------+
| 11201.83 |
|  8944.59 |
|  4723.00 |
|  1788.98 |
+----------+
4 rows in set (0.00 sec)

mysql> select odate, sum(amt)
    -> from orders
    -> group by odate
    -> order by sum(amt) desc;
+------------+----------+
| odate      | sum(amt) |
+------------+----------+
| 1990-10-06 | 11201.83 |
| 1990-10-03 |  8944.59 |
| 1990-10-05 |  4723.00 |
| 1990-10-04 |  1788.98 |
+------------+----------+
4 rows in set (0.00 sec)

mysql> select odate as 'Order Date', sum(amt) as 'Total Amount'
    -> from Orders
    -> group by odate
    -> order by sum(amt) desc;
+------------+--------------+
| Order Date | Total Amount |
+------------+--------------+
| 1990-10-06 |     11201.83 |
| 1990-10-03 |      8944.59 |
| 1990-10-05 |      4723.00 |
| 1990-10-04 |      1788.98 |
+------------+--------------+
4 rows in set (0.00 sec)

mysql> notee
