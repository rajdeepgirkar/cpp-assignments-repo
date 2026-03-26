mysql> -- Assignment ? 18 Maintaining the Integrity of your Data.
Query OK, 0 rows affected (0.00 sec)

mysql> -- 1) Create a table called Cityorders. This will contain the same onum, amt and snum fields  as  the  Orders  table,  and  the  same  cnum  and  city  fields  as  the  Customers table, so that each customer?s order will be  entered into this table  along  with his or  her  city.  Onum  will  be  the  primary  key  of  Cityorders.  All  of  the  fields  in Cityorders will be constrained to match the Customers and Orders tables. Assume the parent keys in these tables already have the proper constraints.
Query OK, 0 rows affected (0.00 sec)

mysql> CREATE TABLE Cityorders (
    ->     onum INT PRIMARY KEY,
    ->     amt DECIMAL(10,2),
    ->     snum INT,
    ->     cnum INT,
    ->     city VARCHAR(20),
    -> 
    ->     FOREIGN KEY (onum) REFERENCES Orders(onum),
    ->     FOREIGN KEY (snum) REFERENCES Orders(snum),
    ->     FOREIGN KEY (cnum) REFERENCES Customers(cnum),
    ->     FOREIGN KEY (city) REFERENCES Customers(city)
    -> );
ERROR 1046 (3D000): No database selected
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| dbt_exam           |
| information_schema |
| kharghar           |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| world              |
+--------------------+
8 rows in set (0.01 sec)

mysql> use kharghar;
Database changed
mysql> CREATE TABLE Cityorders (
    ->     onum INT PRIMARY KEY,
    ->     amt DECIMAL(10,2),
    ->     snum INT,
    ->     cnum INT,
    ->     city VARCHAR(20),
    -> 
    ->     FOREIGN KEY (onum) REFERENCES Orders(onum),
    ->     FOREIGN KEY (snum) REFERENCES Orders(snum),
    ->     FOREIGN KEY (cnum) REFERENCES Customers(cnum),
    ->     FOREIGN KEY (city) REFERENCES Customers(city)
    -> );
ERROR 6125 (HY000): Failed to add the foreign key constraint. Missing unique key for constraint 'cityorders_ibfk_2' in the referenced table 'orders'

mysql> DESC Customers;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| Cnum   | int         | YES  |     | NULL    |       |
| Cname  | varchar(10) | YES  |     | NULL    |       |
| City   | varchar(10) | YES  |     | NULL    |       |
| Rating | int         | YES  |     | NULL    |       |
| Snum   | int         | YES  | MUL | NULL    |       |
+--------+-------------+------+-----+---------+-------+
5 rows in set (0.01 sec)

mysql> ALTER TABLE Customers
    -> ADD PRIMARY KEY (cnum);
Query OK, 0 rows affected (0.07 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> CREATE TABLE Cityorders (
    ->     onum INT PRIMARY KEY,
    ->     amt DECIMAL(10,2),
    ->     snum INT,
    ->     cnum INT,
    ->     city VARCHAR(20),
    -> 
    ->     FOREIGN KEY (onum) REFERENCES Orders(onum),
    ->     FOREIGN KEY (cnum) REFERENCES Customers(cnum)
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> select * from Cityorders;
Empty set (0.00 sec)

mysql> -- 2) Redefine the Orders table as follows:- add a new column called prev, which will identify, for each order, the onum of the previous order for that current customer. Implement this with a foreign key referring to the Orders table itself. The  foreign key  should  refer  as  well  to  the  cnum  of  the  customer,  providing  a  definite enforced link between the current order and the one referenced.
Query OK, 0 rows affected (0.00 sec)

mysql> ALTER TABLE Orders
    -> ADD prev INT;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE Orders
    -> ADD CONSTRAINT fk_prev_order
    -> FOREIGN KEY (prev) REFERENCES Orders(onum);
Query OK, 9 rows affected (0.07 sec)
Records: 9  Duplicates: 0  Warnings: 0

mysql> select * from Cityorders;
Empty set (0.00 sec)

mysql> select * from orders;
+------+---------+------------+------+------+------+
| Onum | Amt     | Odate      | Cnum | Snum | prev |
+------+---------+------------+------+------+------+
| 3001 |   18.69 | 1990-10-03 | 2008 | 1007 | NULL |
| 3003 |  767.19 | 1990-10-03 | 2001 | 1001 | NULL |
| 3002 | 1900.10 | 1990-10-03 | 2007 | 1004 | NULL |
| 3005 | 5160.45 | 1990-10-03 | 2003 | 1002 | NULL |
| 3006 | 1098.16 | 1990-10-03 | 2008 | 1007 | NULL |
| 3009 | 1713.23 | 1990-10-04 | 2002 | 1003 | NULL |
| 3007 |   75.75 | 1990-10-04 | 2004 | 1002 | NULL |
| 3010 | 1309.95 | 1990-10-06 | 2004 | 1002 | NULL |
| 4001 |  500.00 | 1990-10-10 | 2001 | 1001 | NULL |
+------+---------+------------+------+------+------+
9 rows in set (0.00 sec)

mysql> UPDATE Orders SET prev = 9999 WHERE onum = 3002;
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`kharghar`.`orders`, CONSTRAINT `fk_prev_order` FOREIGN KEY (`prev`) REFERENCES `orders` (`Onum`))
mysql> UPDATE Orders SET prev = 3001 WHERE onum = 3002;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from orders;
+------+---------+------------+------+------+------+
| Onum | Amt     | Odate      | Cnum | Snum | prev |
+------+---------+------------+------+------+------+
| 3001 |   18.69 | 1990-10-03 | 2008 | 1007 | NULL |
| 3003 |  767.19 | 1990-10-03 | 2001 | 1001 | NULL |
| 3002 | 1900.10 | 1990-10-03 | 2007 | 1004 | 3001 |
| 3005 | 5160.45 | 1990-10-03 | 2003 | 1002 | NULL |
| 3006 | 1098.16 | 1990-10-03 | 2008 | 1007 | NULL |
| 3009 | 1713.23 | 1990-10-04 | 2002 | 1003 | NULL |
| 3007 |   75.75 | 1990-10-04 | 2004 | 1002 | NULL |
| 3010 | 1309.95 | 1990-10-06 | 2004 | 1002 | NULL |
| 4001 |  500.00 | 1990-10-10 | 2001 | 1001 | NULL |
+------+---------+------------+------+------+------+
9 rows in set (0.00 sec)

mysql> notee
