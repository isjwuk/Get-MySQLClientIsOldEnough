# Get-MySQLClientIsOldEnough
Check if a MySQL client is old enough to work with Azure Database for MySQL - Single Server.

[The MySQL 8.0.27 client is incompatible with Azure Database for MySQL - Single Server](https://docs.microsoft.com/en-us/azure/mysql/single-server-whats-new#october-2021). 
    All connections from the MySQL 8.0.27 client created either via mysql.exe or workbench will fail. 
    As a workaround, consider using an earlier version of the client (prior to MySQL 8.0.27) or 
    creating an instance of Azure Database for MySQL - Flexible Server instead.
    
In the meantime, this will return true if your mysql.exe is old enough to work!
