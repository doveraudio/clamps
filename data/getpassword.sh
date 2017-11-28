#!/bin/bash
#grep 'A temporary password is generated for root@localhost' /var/log/mysqld.log |tail -1 | awk '{print $NF }' >> /var/data/mysqlpass.txt


printf "Setting up MySQL for developer mode.\n";

mysqlpass="$(grep 'A temporary password is generated for root@localhost' /var/log/mysqld.log |tail -1 | awk '{print $NF }')";
echo " Logging into MYSQL With Password: ${mysqlpass}";
echo "Removing \'validate_password\' plugin, setting up root for dev...\n";
echo ".\n.\n.\n";


#mysqlpass="complicatedPassword_1";
mysql -u root -p${mysqlpass} --connect-expired-password < /var/data/initmysql.sql;

printf "MySQL User:root , Password:root\n";
printf "Configuration Complete.\n";
