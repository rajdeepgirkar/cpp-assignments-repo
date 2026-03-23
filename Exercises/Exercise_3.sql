SQL> connect
Enter user-name: rajdeep
ERROR:
ORA-01017: invalid username/password; logon denied 


SQL> connect
Enter user-name: rajdeep
Connected.
SQL> -- Exercise 3
SQL> -- 1. Display all the Supplier names with the initial letter capital.
SQL> select initcap(SNAME) from S;

INITCAP(SNAME)                                                                  
--------------------                                                            
Smith                                                                           
Jones                                                                           
Blake                                                                           

SQL> -- 2. Display all the Supplier names in upper case.
SQL> select upper(SNAME) from S;

UPPER(SNAME)                                                                    
--------------------                                                            
SMITH                                                                           
JONES                                                                           
BLAKE                                                                           

SQL> -- 3. Display all the Supplier names in lower case.
SQL> select lower(SNAME) from S;

LOWER(SNAME)                                                                    
--------------------                                                            
smith                                                                           
jones                                                                           
blake                                                                           

SQL> -- 4. Display all the Supplier names padded to 25 characters, with spaces on the left.
SQL> select lpad(SNAME, 25) from s;

LPAD(SNAME,25)                                                                  
--------------------------------------------------------------------------------
     SMITH                                                                      
     JONES                                                                      
     BLAKE                                                                      

SQL> select lpad(SNAME, 25, ' ') from s;

LPAD(SNAME,25,'')                                                               
--------------------------------------------------------------------------------
     SMITH                                                                      
     JONES                                                                      
     BLAKE                                                                      

SQL> -- 5. Display all the Supplier names (with `la' replaced by `ro').
SQL> select replace(SNAME, 'la'. 'ro') from S;
select replace(SNAME, 'la'. 'ro') from S
                          *
ERROR at line 1:
ORA-00907: missing right parenthesis 


SQL> select replace(SNAME, 'la', 'ro') from S;

REPLACE(SNAME,'LA','RO')                                                        
----------------------------------------                                        
SMITH                                                                           
JONES                                                                           
BLAKE                                                                           

SQL> select replace(SNAME, 'la', 'ro') as SNAME from S;

SNAME                                                                           
----------------------------------------                                        
SMITH                                                                           
JONES                                                                           
BLAKE                                                                           

SQL> select replace(sname, 'la', 'ro') as SNAME from S;

SNAME                                                                           
----------------------------------------                                        
SMITH                                                                           
JONES                                                                           
BLAKE                                                                           

SQL> SET LINESIZE 200;
SQL> select replace(SNAME, 'LA', 'RO') from S;

REPLACE(SNAME,'LA','RO')                                                                                                                                                                                
----------------------------------------                                                                                                                                                                
SMITH                                                                                                                                                                                                   
JONES                                                                                                                                                                                                   
BROKE                                                                                                                                                                                                   

SQL> -- 6. Implement the above command such that `l' is replaced with `r' and `a' is replaced with `o'.
SQL> select replace(replace(sname, 'L', 'R'), 'A', 'O') as SNAME from S;

SNAME                                                                                                                                                                                                   
--------------------                                                                                                                                                                                    
SMITH                                                                                                                                                                                                   
JONES                                                                                                                                                                                                   
BROKE                                                                                                                                                                                                   

SQL> -- 7. Display the Supplier names and the lengths of the names.
SQL> select SNAME, length(SNAME) from S;

SNAME                LENGTH(SNAME)                                                                                                                                                                      
-------------------- -------------                                                                                                                                                                      
SMITH                           20                                                                                                                                                                      
JONES                           20                                                                                                                                                                      
BLAKE                           20                                                                                                                                                                      

SQL> -- 8. Use the soundex function to search for a supplier by the name of `BLOKE'.
SQL> select * from S where soundex(SNAME) = soundex('BLOKE');

S# SNAME                    STATUS CITY                                                                                                                                                                 
-- -------------------- ---------- --------------------                                                                                                                                                 
S3 BLAKE                        30 Athens                                                                                                                                                               

SQL> -- 9. Display the Supplier name and the status (as Ten, Twenty, Thirty, etc.).
SQL> select SNAME,
  2  case
  3  when status = 10 then 'Ten'
  4  when status = 20 then 'Twenty'
  5  when status = 30 then 'Thirty'
  6  when status = 40 then 'Fourty'
  7  end num
  8  from S;

SNAME                NUM                                                                                                                                                                                
-------------------- ------                                                                                                                                                                             
SMITH                Twenty                                                                                                                                                                             
JONES                Ten                                                                                                                                                                                
BLAKE                Thirty                                                                                                                                                                             

SQL> select SNAME,
  2  decode(status,
  3  10, 'Ten',
  4  20, 'Twenty',
  5  30, 'Thirty') as STATUS
  6  from S;

SNAME                STATUS                                                                                                                                                                             
-------------------- ------                                                                                                                                                                             
SMITH                Twenty                                                                                                                                                                             
JONES                Ten                                                                                                                                                                                
BLAKE                Thirty                                                                                                                                                                             

SQL> -- 10. Display the current day (e.g. Thursday)
SQL> select dayname(curdate());
select dayname(curdate())
                        *
ERROR at line 1:
ORA-00923: FROM keyword not found where expected 


SQL> select to_char(SYSDATE, 'DAY') from DUAL;

TO_CHAR(SYSDATE,'DAY')                                                                                                                                                                                  
------------------------------------                                                                                                                                                                    
MONDAY                                                                                                                                                                                                  

SQL> select to_char(SYSDATE, 'DAY') DAY from DUAL;

DAY                                                                                                                                                                                                     
------------------------------------                                                                                                                                                                    
MONDAY 
                                                                                                                                                                                                 
SQL> spool off
