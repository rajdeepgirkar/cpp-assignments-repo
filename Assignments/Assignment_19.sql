mysql> -- Assignment ? 19 Views.
Query OK, 0 rows affected (0.00 sec)

mysql> -- 1) Create a view that shows all of the customers who have the highest ratings.
Query OK, 0 rows affected (0.00 sec)

mysql> CREATE VIEW HighRatingCustomers AS
    -> SELECT *
    -> FROM Customers
    -> WHERE rating = (
    ->     SELECT MAX(rating) FROM Customers
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> SELECT *
    -> FROM Customers
    -> ;
+------+----------+----------+--------+------+
| Cnum | Cname    | City     | Rating | Snum |
+------+----------+----------+--------+------+
| 2001 | Hoffman  | London   |    100 | 1001 |
| 2002 | Giovanni | Rome     |    300 | 1003 |
| 2003 | Liu      | San Jose |    200 | 1004 |
| 2004 | Grass    | Berlin   |    300 | 1004 |
| 2007 | Pereira  | Rome     |    250 | 1004 |
| 2008 | Cisneros | San Jose |    300 | 1007 |
+------+----------+----------+--------+------+
6 rows in set (0.00 sec)

mysql> SELECT * FROM HighRatingCustomers;
+------+----------+----------+--------+------+
| Cnum | Cname    | City     | Rating | Snum |
+------+----------+----------+--------+------+
| 2002 | Giovanni | Rome     |    300 | 1003 |
| 2004 | Grass    | Berlin   |    300 | 1004 |
| 2008 | Cisneros | San Jose |    300 | 1007 |
+------+----------+----------+--------+------+
3 rows in set (0.00 sec)

mysql> -- 2) Create a view that shows the number of salespeople in each city.
Query OK, 0 rows affected (0.00 sec)

mysql> CREATE VIEW SalespeopleCountByCity AS
    -> SELECT city, COUNT(*) AS total_salespeople
    -> FROM Salespeople
    -> GROUP BY city;
Query OK, 0 rows affected (0.01 sec)

mysql> SHOW FULL TABLES
    -> WHERE TABLE_TYPE = 'VIEW';
+------------------------+------------+
| Tables_in_kharghar     | Table_type |
+------------------------+------------+
| highratingcustomers    | VIEW       |
| salespeoplecountbycity | VIEW       |
+------------------------+------------+
2 rows in set (0.01 sec)

mysql> -- 3) Create  a  view  that  shows  the  average  and  total  orders  for  each  salesperson  after his or her name. Assume all names are unique.
Query OK, 0 rows affected (0.00 sec)

mysql> CREATE VIEW SalespersonOrdersSummary AS
    -> SELECT s.sname, 
    ->        AVG(o.amt) AS avg_order,
    ->        SUM(o.amt) AS total_order
    -> FROM Salespeople s
    -> JOIN Orders o ON s.snum = o.snum
    -> GROUP BY s.sname;
Query OK, 0 rows affected (0.01 sec)

mysql> DESC HighRatingCustomers;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| Cnum   | int         | NO   |     | NULL    |       |
| Cname  | varchar(10) | YES  |     | NULL    |       |
| City   | varchar(10) | YES  |     | NULL    |       |
| Rating | int         | YES  |     | NULL    |       |
| Snum   | int         | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> 4) Create a view that shows each salesperson with multiple customers.
    -> ^C
mysql> -- 4) Create a view that shows each salesperson with multiple customers.
Query OK, 0 rows affected (0.00 sec)

mysql> CREATE VIEW SalespeopleMultipleCustomers AS
    -> SELECT s.snum, s.sname, COUNT(c.cnum) AS total_customers
    -> FROM Salespeople s
    -> JOIN Customers c ON s.snum = c.snum
    -> GROUP BY s.snum, s.sname
    -> HAVING COUNT(c.cnum) > 1;
Query OK, 0 rows affected (0.01 sec)

mysql> SHOW CREATE VIEW HighRatingCustomers;
+---------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+----------------------+
| View                | Create View                                                                                                                                                                                                                                                                                                                                                                   | character_set_client | collation_connection |
+---------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+----------------------+
| highratingcustomers | CREATE ALGORITHM=UNDEFINED DEFINER=`rajdeep`@`localhost` SQL SECURITY DEFINER VIEW `highratingcustomers` AS select `customers`.`Cnum` AS `Cnum`,`customers`.`Cname` AS `Cname`,`customers`.`City` AS `City`,`customers`.`Rating` AS `Rating`,`customers`.`Snum` AS `Snum` from `customers` where (`customers`.`Rating` = (select max(`customers`.`Rating`) from `customers`)) | cp850                | cp850_general_ci     |
+---------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+----------------------+
1 row in set (0.00 sec)

mysql> show view SalespeopleMultipleCustomers;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'view SalespeopleMultipleCustomers' at line 1
mysql> show create view SalespeopleMultipleCustomers;
+------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+----------------------+
| View                         | Create View                                                                                                                                                                                                                                                                                                                                               | character_set_client | collation_connection |
+------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+----------------------+
| salespeoplemultiplecustomers | CREATE ALGORITHM=UNDEFINED DEFINER=`rajdeep`@`localhost` SQL SECURITY DEFINER VIEW `salespeoplemultiplecustomers` AS select `s`.`Snum` AS `snum`,`s`.`Sname` AS `sname`,count(`c`.`Cnum`) AS `total_customers` from (`salespeople` `s` join `customers` `c` on((`s`.`Snum` = `c`.`Snum`))) group by `s`.`Snum`,`s`.`Sname` having (count(`c`.`Cnum`) > 1) | cp850                | cp850_general_ci     |
+------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+----------------------+
1 row in set (0.00 sec)

mysql> notee;
