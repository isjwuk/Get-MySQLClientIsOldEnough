<#
.SYNOPSIS
    Check if a MySQL client is old enough to work with Azure Database for MySQL - Single Server
.DESCRIPTION
    The MySQL 8.0.27 client is incompatible with Azure Database for MySQL - Single Server. 
    All connections from the MySQL 8.0.27 client created either via mysql.exe or workbench will fail. 
    As a workaround, consider using an earlier version of the client (prior to MySQL 8.0.27) or 
    creating an instance of Azure Database for MySQL - Flexible Server instead.
    
    In the meantime, this will return true if your mysql.exe is old enough to work!
.EXAMPLE
    Get-MySQLClientIsOldEnough -MySQLEXEPath "C:\Program Files\MySQL\MySQL Workbench 8.0 CE\mysql.exe"
#>
function Get-MySQLClientIsOldEnough {
    Param (
        #Path to the mysql.exe file
        [Parameter(Mandatory =$true)]
        [string] $MySQLEXEPath
    )
    #Look for less than 8.0.27. 7.anything is fine, 8.0.26 is fine, 8.0.27 isn't,
    # 8.0.28 isn't, and 8.1.anything oor 9.anything is right out of the question
    $FullVersion=(get-item $mySQLEXEPath).VersionInfo.ProductVersion
    if([int]$FullVersion.split(".")[0] -lt 8 -or ([int]$FullVersion.split(".")[0] -eq 8 `
    -and [int]$FullVersion.split(".")[1] -eq 0 -and [int]$FullVersion.split(".")[2] -lt 27)){$true}else{$false}
}
