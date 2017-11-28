#!/bin/bash
### Provision Vagrant ###
printf "Checking for updates....\n";
cd ~;
sudo yum -y install wget unzip yum-utils;
wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
wget http://rpms.remirepo.net/enterprise/remi-release-7.rpm
sudo rpm -Uvh remi-release-7.rpm epel-release-latest-7.noarch.rpm
sudo yum-config-manager --enable remi-php70
sudo yum localinstall -y https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
sudo yum -y update;

printf "Install unzip mariadb mariadb-server httpd php php-mysqlnd php-intl php-json php-xml php-mcrypt php-mbstring php-pdo mod_php...\n"
sudo yum -y install mysql-community-server httpd php php-common php-mysqlnd php-intl php-json php-xml php-mcrypt php-mbstring php-pdo mod_php php-gd php-ctype php-session php-pdo_mysql php-curl php-ldap php-xsl php-zip php-soap php-mbstring php-mysqli curl imagemagick-dev; 
#sudo yum -y install mysql-server httpd php php-mysqlnd php-intl php-json php-xml php-mcrypt php-mbstring php-pdo mod_php php-gd; 
printf "Disabling selinux...\n";
sudo cp /var/data/selinuxconfig /etc/selinux/config;
sudo setenforce 0;
printf "Configuring mariadb and apache...\n";
sudo systemctl enable httpd;
sudo systemctl start httpd;
sudo systemctl enable mysqld;
sudo systemctl start mysqld;
printf "Copying new php.ini file\n";
sudo cp /var/data/php.ini /etc/php.ini;
printf "Restarting apache...\n";
sudo apachectl restart;

printf "Setting up MySQL for developer mode.\n";

mysqlpass="$(grep 'A temporary password is generated for root@localhost' /var/log/mysqld.log |tail -1 | awk '{print $NF }')\n";
echo " Logging into MYSQL With Password: ${mysqlpass}\n";
echo "Removing `validate_password` plugin, setting up root for dev...\n\n";
echo ".\n.\n.\n";
mysql -u root -p${mysqlpass} --connect-expired-password < initmysql.sql;

printf "MySQL User:root , Password:root\n";
printf "Configuration Complete.\n";
