# How to Increase max connection limit in RDS:

1. The maximum connection to an RDS instance is controlled by a variable “max_connection” in the db parameter group.
2. The default value of this variable is calculated by a formula : 
      ( DBInstanceClassMemory / 12582880 )
    Ex. If the memory of the instance is 512 MB then this value turns out to be approx. 40
3. This value can be edited from the db parameter group, but only if you are using a custom parameter group.
4. Also you can not switch from using a default parameter group to a custom parameter group without a reboot.

## One solution:(The simple one)
1. If using a custom parameter group, go and change the parameter “max_connection” to the desired value and you are good to go.
2. If you are using the default db parameter group then, you should create a new custom parameter group with the desired values.
3. Now go and modify the db instance and change the parameter group to the new custom parameter group.
4. You can select to apply the changes immediately or wait for it to apply in the next maintenance window to reduce down time. 

## How to achieve zero downtime:
1. Up until now we have understood that this can not be achieved without a reboot, and reboot means downtime. 
2. One way to achieve this is to have a mysql multi-master architecture. We can have master to master replication and then gracefully switch all the traffic from one master to the other and once all the traffic has been switched, reboot that master and then switch back again
3. The problem now is that RDS does not allow master to master replication. But it also does not stop us from doing it.

### Step to set master-to-master replication on RDS:
1. Let's call the RDS master instance ‘master-1’.
2. Create a read replica of ‘master-1’ and call it ‘read-1’.
3. Create a replication user on 'master-1' and grant permisions .
```sh
mysql> create user 'replicator'@'%' identified by 'password';
mysql> grant execute, replication slave, replication client on *.* 
      to 'replicator'@'%';
```
4. Now connect to 'read-1' and stop the replication.
```sh
mysql> CALL mysql.rds_stop_replication;
```
5. Collect the 'master-1' bin-log file and position from 'read-1'. Look for  "Master_Log_File:" and "Exec_Master_Log_Pos:"
```sh
mysql> show slave status\G;
```
6. Now create a snapshot from the "read-1" and call it "snap-1"
7. Now use "snap-1" to create a new db instance and call it "master-2"
8. 







