mysql> tee C:\PGCP_AC\DBT\Assignments\Assignment_1.sql;
ERROR: 
Unknown command '\P'.
ERROR: 
Unknown command '\D'.
ERROR: 
Unknown command '\A'.
ERROR: 
Unknown command '\A'.
ERROR: 
Unknown command '\S'.
mysql> -- Assignment 1 Creating sample tables and inserting values. 
Query OK, 0 rows affected (0.00 sec)

mysql> select user();
+-------------------+
| user()            |
+-------------------+
| rajdeep@localhost |
+-------------------+
1 row in set (0.01 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| kharghar           |
| performance_schema |
+--------------------+
3 rows in set (0.04 sec)

mysql> use kharghar;
Database changed
mysql> show current_database;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'current_database' at line 1
mysql> select database();
+------------+
| database() |
+------------+
| kharghar   |
+------------+
1 row in set (0.00 sec)

mysql> CREATE TABLE SALESPEOPLE (Snum INT(4), Sname VARCHAR(10), City VARCHAR(10), Comm FLOAT(3,2));
Query OK, 0 rows affected, 2 warnings (0.04 sec)

mysql> show tables;
+--------------------+
| Tables_in_kharghar |
+--------------------+
| salespeople        |
+--------------------+
1 row in set (0.02 sec)

mysql> show tables;
+--------------------+
| Tables_in_kharghar |
+--------------------+
| customers          |
| salespeople        |
+--------------------+
2 rows in set (0.00 sec)

mysql> CREATE TABLE ORDERS (Onum INT(4), Amt FLOAT(7,2), Odate DATE, Cnum INT(4), Snum INT(4));
Query OK, 0 rows affected, 4 warnings (0.04 sec)

mysql> show tables;
+--------------------+
| Tables_in_kharghar |
+--------------------+
| customers          |
| orders             |
| salespeople        |
+--------------------+
3 rows in set (0.00 sec)

mysql> INSERT INTO SALESPEOPLE VALUES
    -> (1001,'Peel','London',0.12),
    -> (1002,'Serres','San Jose',0.13),
    -> (1004,'Motika','London',0.11),
    -> (1007,'Rifkin','Barcelona',0.15),
    -> (1003,'Axelrod','New York',0.10);
Query OK, 5 rows affected (0.02 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from SALESPEOPLE;
+------+---------+-----------+------+
| Snum | Sname   | City      | Comm |
+------+---------+-----------+------+
| 1001 | Peel    | London    | 0.12 |
| 1002 | Serres  | San Jose  | 0.13 |
| 1004 | Motika  | London    | 0.11 |
| 1007 | Rifkin  | Barcelona | 0.15 |
| 1003 | Axelrod | New York  | 0.10 |
+------+---------+-----------+------+
5 rows in set (0.01 sec)

mysql> INSERT INTO CUSTOMERS VALUES
    -> (2001,'Hoffman','London',100,1001),
    -> (2002,'Giovanni','Rome',200,1003),
    -> (2003,'Liu','San Jose',200,1002),
    -> (2004,'Grass','Berlin',300,1002),
    -> (2006,'Clemens','London',100,1001),
    -> (2008,'Cisneros','San Jose',300,1007),
    -> (2007,'Pereira','Rome',100,1004);
Query OK, 7 rows affected (0.01 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql> select * from CUSTOMERS;
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

mysql> INSERT INTO ORDERS VALUES
    -> (3001,18.69,'1990-10-03',2008,1007),
    -> (3003,767.19,'1990-10-03',2001,1001),
    -> (3002,1900.10,'1990-10-03',2007,1004),
    -> (3005,5160.45,'1990-10-03',2003,1002),
    -> (3006,1098.16,'1990-10-03',2008,1007),
    -> (3009,1713.23,'1990-10-04',2002,1003),
    -> (3007,75.75,'1990-10-04',2004,1002),
    -> (3008,4723.00,'1990-10-05',2006,1001),
    -> (3010,1309.95,'1990-10-06',2004,1002),
    -> (3011,9891.88,'1990-10-06',2006,1001);
Query OK, 10 rows affected (0.01 sec)
Records: 10  Duplicates: 0  Warnings: 0

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
| 3008 | 4723.00 | 1990-10-05 | 2006 | 1001 |
| 3010 | 1309.95 | 1990-10-06 | 2004 | 1002 |
| 3011 | 9891.88 | 1990-10-06 | 2006 | 1001 |
+------+---------+------------+------+------+
10 rows in set (0.00 sec)

mysql> show tables;
+--------------------+
| Tables_in_kharghar |
+--------------------+
| customers          |
| orders             |
| salespeople        |
+--------------------+
3 rows in set (0.00 sec)

mysql> notee;
