#!/bin/bash
### Provision Vagrant ###
printf "Checking for updates....\n";
cd ~;
sudo yum -y install wget unzip yum-utils;
wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm;
wget http://rpms.remirepo.net/enterprise/remi-release-7.rpm;
sudo rpm -Uvh remi-release-7.rpm epel-release-latest-7.noarch.rpm;
sudo yum-config-manager --enable remi-php70;
sudo yum localinstall -y https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm;
sudo yum install -y https://download.postgresql.org/pub/repos/yum/9.4/redhat/rhel-7-x86_64/pgdg-centos94-9.4-2.noarch.rpm;
sudo cp /var/data/mongodb-org-3.6.repo /etc/yum.repos.d/mongodb-org-3.6.repo;
curl --silent --location https://rpm.nodesource.com/setup_9.x | sudo bash -;
sudo yum -y update;

printf "Install mysql-community-server httpd php php-common php-mysqlnd php-intl php-json php-xml php-mcrypt php-mbstring php-pdo mod_php php-gd php-ctype php-session php-pdo_mysql php-curl php-ldap php-xsl php-zip php-soap php-mbstring php-mysqli curl imagemagick-dev...\n"
sudo yum -y install mysql-community-server postgresql94 postgresql94-server mongodb-org httpd php php-common php-mysqlnd php-intl php-json php-xml php-mcrypt php-mbstring php-pdo mod_php php-gd php-ctype php-session php-pdo_mysql php-pgsql php-curl php-ldap php-xsl php-zip php-soap php-mbstring php-mysqli curl nodejs imagemagick-dev; 
#sudo yum -y install mysql-server httpd php php-mysqlnd php-intl php-json php-xml php-mcrypt php-mbstring php-pdo mod_php php-gd; 
printf "Disabling selinux...\n";
sudo cp /var/data/selinuxconfig /etc/selinux/config;
sudo setenforce 0;
printf "Configuring apache...\n";
sudo systemctl enable httpd;
sudo systemctl start httpd;
sudo systemctl enable mysqld;
sudo systemctl start mysqld;
printf "Copying new php.ini file\n";
sudo cp /var/data/php.ini /etc/php.ini;
printf "Restarting apache...\n";
sudo apachectl restart;
#grep 'A temporary password is generated for root@localhost' /var/log/mysqld.log |tail -1 | awk '{print $NF }' >> /var/data/mysqlpass.txt


printf "Setting up MySQL for developer mode.\n";

mysqlpass="$(grep 'A temporary password is generated for root@localhost' /var/log/mysqld.log |tail -1 | awk '{print $NF }')";
printf " Logging into MYSQL With Password: ${mysqlpass}";
printf "Removing \'validate_password\' plugin, setting up root for dev...\n";
printf ".\n.\n.\n";
#mysqlpass="complicatedPassword_1";
mysql -u root -p${mysqlpass} --connect-expired-password < /var/data/initmysql.sql;
printf "MySQL User:root , Password:root\n";
printf "Configuration Complete.\n";
printf "Configuring Postgresql\n";
printf ".";
printf ".";
#sudo yum install -y postgresql94 postgresql94-server;
printf ".";
sudo systemctl enable postgresql-9.4;
printf ".";
#cd /usr/pgsql-9.3/bin/;
sudo /usr/pgsql-9.4/bin/postgresql94-setup initdb;
printf ".";
sudo cp -f /var/data/pg_hba.conf /var/lib/pgsql/9.4/data/pg_hba.conf;
printf ".";
printf ".";
sudo systemctl start postgresql-9.4;
printf ".\n";
sudo su postgres -c "psql -f /var/data/psqlmakevagrant.sql";
printf "Postgresql User:vagrant , Password:vagrant\n";
printf "Configuration Complete.\n";

printf "Setting up and configuring Mongo DB\n";

sudo systemctl enable mongod;
sudo systemctl start mongod;
touch /home/vagrant/.dbshell;


