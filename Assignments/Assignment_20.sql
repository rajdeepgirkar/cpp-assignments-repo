mysql> -- Assignment 20 - Changing values through views
Query OK, 0 rows affected (0.00 sec)

mysql> -- 1 which of the views are updateable
Query OK, 0 rows affected (0.00 sec)

mysql> -- #1
Query OK, 0 rows affected (0.00 sec)

mysql> Create View Dailyorders
    -> as Select Distinct cnum, snum, onum, odate from Orders;
Query OK, 0 rows affected (0.02 sec)

mysql> show create view dailyorders;
+-------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+----------------------+
| View        | Create View                                                                                                                                                                                                                                 | character_set_client | collation_connection |
+-------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+----------------------+
| dailyorders | CREATE ALGORITHM=UNDEFINED DEFINER=`rajdeep`@`localhost` SQL SECURITY DEFINER VIEW `dailyorders` AS select distinct `orders`.`Cnum` AS `cnum`,`orders`.`Snum` AS `snum`,`orders`.`Onum` AS `onum`,`orders`.`odate` AS `odate` from `orders` | cp850                | cp850_general_ci     |
+-------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+----------------------+
1 row in set (0.00 sec)

mysql> -- #2
Query OK, 0 rows affected (0.00 sec)

mysql> Create View Custotals
    -> as Select cname, Sum (amt) Sum_Amt from Orders, Customers   
    -> where Orders.cnum=Customers.cnum  
    -> Group by cname;  
ERROR 1630 (42000): FUNCTION kharghar.Sum does not exist. Check the 'Function Name Parsing and Resolution' section in the Reference Manual
mysql> Create View Custotals
    -> as Select cname, Sum(amt) as Sum_Amt from Orders, Customers
    -> where Orders.cnum = Customers.cnum
    -> Group by cname;
Query OK, 0 rows affected (0.01 sec)

mysql> show create view custotals;
+-----------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+----------------------+
| View      | Create View                                                                                                                                                                                                                                                                         | character_set_client | collation_connection |
+-----------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+----------------------+
| custotals | CREATE ALGORITHM=UNDEFINED DEFINER=`rajdeep`@`localhost` SQL SECURITY DEFINER VIEW `custotals` AS select `customers`.`Cname` AS `cname`,sum(`orders`.`Amt`) AS `Sum_Amt` from (`orders` join `customers`) where (`orders`.`Cnum` = `customers`.`Cnum`) group by `customers`.`Cname` | cp850                | cp850_general_ci     |
+-----------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+----------------------+
1 row in set (0.00 sec)

mysql> UPDATE Custotals SET Sum_Amt = 5000;
ERROR 1288 (HY000): The target table Custotals of the UPDATE is not updatable
mysql> -- #3
Query OK, 0 rows affected (0.00 sec)

mysql> CREATE VIEW Thirdorders AS
    -> SELECT *
    -> FROM Dailyorders
    -> WHERE odate = '1990-10-03';
Query OK, 0 rows affected (0.01 sec)

mysql> show create view Thirdorders;
+-------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+----------------------+
| View        | Create View                                                                                                                                                                                                                                                                                              | character_set_client | collation_connection |
+-------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+----------------------+
| thirdorders | CREATE ALGORITHM=UNDEFINED DEFINER=`rajdeep`@`localhost` SQL SECURITY DEFINER VIEW `thirdorders` AS select `dailyorders`.`cnum` AS `cnum`,`dailyorders`.`snum` AS `snum`,`dailyorders`.`onum` AS `onum`,`dailyorders`.`odate` AS `odate` from `dailyorders` where (`dailyorders`.`odate` = '1990-10-03') | cp850                | cp850_general_ci     |
+-------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+----------------------+----------------------+
1 row in set (0.00 sec)

mysql> -- #4
Query OK, 0 rows affected (0.00 sec)

mysql> CREATE VIEW Nullcities AS
    -> SELECT snum, sname, city
    -> FROM Salespeople
    -> WHERE city IS NULL
    -> OR sname BETWEEN 'A' AND 'MZ';
Query OK, 0 rows affected (0.01 sec)

mysql> SELECT * FROM Nullcities;
+------+---------+----------+
| snum | sname   | city     |
+------+---------+----------+
| 1004 | Motika  | London   |
| 1003 | Axelrod | New York |
| 1100 | Blanco  | San Jose |
+------+---------+----------+
3 rows in set (0.02 sec)

mysql> -- #4 is updateable view
Query OK, 0 rows affected (0.00 sec)

mysql> -- 2) create view with commission restriction
Query OK, 0 rows affected (0.00 sec)

mysql> CREATE VIEW Commissions AS
    -> SELECT snum, comm
    -> FROM Salespeople
    -> WHERE comm BETWEEN 0.10 AND 0.20
    -> WITH CHECK OPTION;
Query OK, 0 rows affected (0.01 sec)

mysql> UPDATE Commissions SET comm = 0.25 WHERE snum = 1001;
ERROR 1369 (HY000): CHECK OPTION failed 'kharghar.commissions'
mysql> UPDATE Commissions SET comm = 0.15 WHERE snum = 1001;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM Commissions;
+------+------+
| snum | comm |
+------+------+
| 1001 | 0.15 |
| 1002 | 0.16 |
| 1004 | 0.11 |
| 1007 | 0.15 |
| 1003 | 0.10 |
+------+------+
5 rows in set (0.00 sec)

mysql> -- 3) Entryorders view using SYSDATE
Query OK, 0 rows affected (0.00 sec)

mysql> CREATE TABLE Orders (
    ->     onum INT PRIMARY KEY,
    ->     amt DECIMAL(10,2),
    ->     odate DATE DEFAULT (CURRENT_DATE),
    ->     cnum INT,
    ->     snum INT
    -> );
ERROR 1050 (42S01): Table 'orders' already exists
mysql> CREATE VIEW Entryorders AS
    -> SELECT onum, amt, cnum, snum
    -> FROM Orders
    -> WITH CHECK OPTION;
Query OK, 0 rows affected (0.01 sec)

mysql> INSERT INTO Entryorders VALUES (4001, 500, 2001, 1001);
-- ERROR 1423 (HY000): Field of view 'kharghar.entryorders' underlying table doesn't have a default value

mysql> SELECT * FROM Entryorders;
+------+---------+------+------+
| onum | amt     | cnum | snum |
+------+---------+------+------+
| 3001 |   18.69 | 2008 | 1007 |
| 3002 | 1900.10 | 2007 | 1004 |
| 3003 |  767.19 | 2001 | 1001 |
| 3005 | 5160.45 | 2003 | 1002 |
| 3006 | 1098.16 | 2008 | 1007 |
| 3007 |   75.75 | 2004 | 1002 |
| 3010 | 1309.95 | 2004 | 1002 |
| 4001 |  500.00 | 2001 | 1001 |
+------+---------+------+------+
8 rows in set (0.01 sec)

mysql> SELECT * FROM Orders;
+------+---------+------------+------+------+------+
| Onum | Amt     | odate      | Cnum | Snum | prev |
+------+---------+------------+------+------+------+
| 3001 |   18.69 | 1990-10-03 | 2008 | 1007 | NULL |
| 3002 | 1900.10 | 1990-10-03 | 2007 | 1004 | 3001 |
| 3003 |  767.19 | 1990-10-03 | 2001 | 1001 | NULL |
| 3005 | 5160.45 | 1990-10-03 | 2003 | 1002 | NULL |
| 3006 | 1098.16 | 1990-10-03 | 2008 | 1007 | NULL |
| 3007 |   75.75 | 1990-10-04 | 2004 | 1002 | NULL |
| 3010 | 1309.95 | 1990-10-06 | 2004 | 1002 | NULL |
| 4001 |  500.00 | 1990-10-10 | 2001 | 1001 | NULL |
+------+---------+------------+------+------+------+
8 rows in set (0.00 sec)

mysql> notee
