# MYSQL REPLICATION
Replication is the continuous copying of data changes from one database (primary) to another database (replica). The two databases are generally located on different physical servers. The replica database can act as a read replica or a standby replica to provide failover capability. 
Generally there are two ways of replication:
1. Asynchronous Replication
2. Synchronous Replication

## Synchronous vs. asynchronous replication

The primary difference between synchronous replication and asynchronous replication is the way in which data is written to the replica. In synchronous replication data is written to primary storage and the replica simultaneously. As such, the primary copy and the replica should always remain synchronized.

In contrast, asynchronous replication copies the data to the replica after the data is already written to the primary storage. Although the replication process may occur in near-real-time, it is more common for replication to occur on a scheduled basis. For instance, write operations may be transmitted to the replica in batches on a periodic basis (for example, every one minute).

### The benefits of asynchronous replication
Asynchronous replication requires substantially less bandwidth than synchronous replication.
It is designed to work over long distances. Since the replication process does not have to occur in real time, asynchronous replication can tolerate some degradation in connectivity.

**In this series, we are going to focus on achieving asynchronous replication.** 
## How mysql replication works?
1. Our primary db instance maintains a binary log file. 
2. This binary log file is a record of all the events that modified the database and the data in it.
3. It records only the write events and not the read event like “SELECT”.
4. The replica when connected to the primary instance, requests a copy of the binary log file.
5. The replica then apply the binary log to its realy log.
6. The relay log is read by the SQL thread process and it applies all the operations/data to the replica’s database and its binary log.
7. This has the effect of repeating the original changes just as they were made on the source. 
 
### Keywords/file names used with MySQL Replication
- **Master** – primary database server data is copied from
- **Slave** – one or more database servers data is copied to
- **Binary log file** – containing database updates and changes written as events
- **Relay log file** – contains database events read from the master’s binary log and written by the slave I/O thread
- **Index file** – contains the names of all used binary log or relay log files
- **Master log info file** – contains master configuration information including user, host, password, log file, master log position. Found on slave
- **Relay log info file** – contains replication status information. Found on slave
- **Global Transaction Identifiers(GTID)** – Alternative method for tracking replication position, does not require binary logs enabled on slave(not used with binary log file position)
## Basic mysql replication using Binary log :
I am using 2 vm instances to set up mysql on them. Hostname and IP of the vm instances are:
Master : 192.168.12.50 
Client:  192.168.12.51
**Step 1 - Install mysql on Master instance.**
```sh
$ sudo apt-get install mysql-server 
```
**Step 2 - Add these lines to /etc/mysql/my.cnf file and restart mysql service.**
```sh
server-id              = 1
log_bin                = /var/log/mysql/mysql-bin.log
bind-address            = 192.168.12.50
```
- The server-id gives a unique identification to our server. 
- Two servers having same server-id can not communicate with each other.
- This log_bin provides the location to store tghe binary-logs
- By default mysql is configured to listen only on the localhost(127.0.0.1).
- Changing the bind-address allows mysql to listen on server's IP.

**Step 3 - Create replication user and grant slave permission in master instance**
```mysql
mysql> create user 'replicator'@'%' identified by 'replicator'; 
mysql> grant replication slave on *.* to 'replicator'@'%';
```
Now finally we need to note the binary log file name and position. 
```mysql
mysql> show master status;
+------------------+----------+--------------+------------------+-------------------+
| File             | Position | Binlog_Do_DB | Binlog_Ignore_DB | Executed_Gtid_Set |
+------------------+----------+--------------+------------------+-------------------+
| mysql-bin.000001 |      607 |              |                  |                   |
+------------------+----------+--------------+------------------+-------------------+
```
Note down the file [mysql-bin.000001] and Position[607] parameters from the output. It is required for the slave replication configuration.
**Step 4 - Install mysql on Client instance.**
```sh
$ sudo apt-get install mysql-server 
```
**Step 5 - Add these lines to /etc/mysql/my.cnf file and restart mysql service.**
```sh
server-id              = 2
log_bin                = /var/log/mysql/mysql-bin.log
bind-address            = 192.168.12.51
```
**Step 6 - Stop the slave threads using the following command**
```mysql
mysql> stop slave;
```
**Step 7 - Configure this instance to be slave of master.**
```mysql
mysql> CHANGE MASTER TO MASTER_HOST='192.168.12.50', MASTER_USER='replicator', MASTER_PASSWORD='replicator', MASTER_LOG_FILE='mysql-bin.000001',MASTER_LOG_POS= 607;
```
**Step 8 - Now start the slave and check its status.**
```mysql
mysql> start slave;
mysql> show slave status\G;
*************************** 1. row ***************************
               Slave_IO_State: Waiting for master to send event
                  Master_Host: 192.168.12.50
                  Master_User: replicator
                  Master_Port: 3306
                Connect_Retry: 60
              Master_Log_File: mysql-bin.000001
          Read_Master_Log_Pos: 772
               Relay_Log_File: client-relay-bin.000002
                Relay_Log_Pos: 485
        Relay_Master_Log_File: mysql-bin.000001
             Slave_IO_Running: Yes
            Slave_SQL_Running: Yes
              Replicate_Do_DB: 
          Replicate_Ignore_DB: 
           Replicate_Do_Table: 
       Replicate_Ignore_Table: 
      Replicate_Wild_Do_Table: 
  Replicate_Wild_Ignore_Table: 
                   Last_Errno: 0
                   Last_Error: 
                 Skip_Counter: 0
          Exec_Master_Log_Pos: 772
              Relay_Log_Space: 693
              Until_Condition: None
               Until_Log_File: 
                Until_Log_Pos: 0
           Master_SSL_Allowed: No
           Master_SSL_CA_File: 
           Master_SSL_CA_Path: 
              Master_SSL_Cert: 
            Master_SSL_Cipher: 
               Master_SSL_Key: 
        Seconds_Behind_Master: 0
Master_SSL_Verify_Server_Cert: No
                Last_IO_Errno: 0
                Last_IO_Error: 
               Last_SQL_Errno: 0
               Last_SQL_Error: 
  Replicate_Ignore_Server_Ids: 
             Master_Server_Id: 1
                  Master_UUID: 7fee317c-28b0-11eb-80b8-02aac17f6279
             Master_Info_File: /var/lib/mysql/master.info
                    SQL_Delay: 0
          SQL_Remaining_Delay: NULL
      Slave_SQL_Running_State: Slave has read all relay log; waiting for more updates
           Master_Retry_Count: 86400
                  Master_Bind: 
      Last_IO_Error_Timestamp: 
     Last_SQL_Error_Timestamp: 
               Master_SSL_Crl: 
           Master_SSL_Crlpath: 
           Retrieved_Gtid_Set: 
            Executed_Gtid_Set: 
                Auto_Position: 0
         Replicate_Rewrite_DB: 
                 Channel_Name: 
           Master_TLS_Version: 
1 row in set (0.00 sec)
```
We have successfully achived master to slave replication. Our slave is in sync with the master which can be varified from "Seconds_Behind_Master:" attribute from the above output.

## Conclusion
This was a simple master to slave replication setup using binary logging.If you are going to use MySQL master-slave replication in production, there are many other performance and MySQL parameters to be considered.
