#!/bin/bash
### Provision Vagrant ###
printf "Checking for updates....\n";
sudo yum -y update;
printf "Install unzip mariadb mariadb-server httpd php php-mysqlnd php-intl php-json php-xml php-mcrypt php-mbstring php-pdo mod_php...\n"
sudo yum -y install unzip mariadb mariadb-server httpd php php-mysqlnd php-intl php-json php-xml php-mcrypt php-mbstring php-pdo mod_php php-gd; 
printf "Disabling selinux...";
sudo cp /var/data/selinuxconfig /etc/selinux/config;
sudo setenforce 0;
printf "Configuring mariadb and apache...";
sudo systemctl enable httpd;
sudo systemctl start httpd;
sudo systemctl enable mariadb;
sudo systemctl start mariadb;
printf "Copying new php.ini file";
sudo cp /var/data/php.ini /etc/php.ini;
printf "reastarting apache...";
sudo apachectl restart;
printf "Configuration Complete.";
