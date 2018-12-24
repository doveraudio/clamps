#!/bin/bash
### Provision Vagrant ###
printf "Checking for updates....\n";
cd /var/data;
####################---->BASIC CONFIG SECTION <-------###########
#########
######### EDIT BASIC CONFIG SETTINGS HERE

sudo yum -y install wget unzip yum-utils;

#################------>END OF SECURITY SECTION<-----#####

####################----> REPO SECTION <-------###########
#########
######### EDIT REPO CONFIG SETTINGS HERE
## epel repo ##
wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm;
## epel repo ##

## remi repo ##
wget http://rpms.remirepo.net/enterprise/remi-release-7.rpm;
sudo rpm -Uvh remi-release-7.rpm epel-release-latest-7.noarch.rpm;
sudo yum-config-manager --enable remi-php73;
## remi repo ##

## neo4j repo ##
sudo cp /var/data/neo4j.repo /etc/yum.repos.d/neo4j.repo;
sudo rpm --import http://debian.neo4j.org/neotechnology.gpg.key
## neo4j repo ##

## mysql repo ##
sudo yum localinstall -y https://dev.mysql.com/get/mysql80-community-release-el7-1.noarch.rpm;
## mysql repo ##

## postgres repo ##
sudo yum install -y yum install https://download.postgresql.org/pub/repos/yum/11/redhat/rhel-7-x86_64/pgdg-centos11-11-2.noarch.rpm;
## postgres repo ##

## elastic search repo ##
#sudo rpm --import http://packages.elastic.co/GPG-KEY-elasticsearch;
#sudo cp /var/data/elasticsearch.repo /etc/yum.repos.d/elasticsearch.repo;
## elastic search repo ##

## kibana repo ##
## already have key from elastic.co otherwise use, but why have kibana if no elastic search?
## sudo rpm --import http://packages.elastic.co/GPG-KEY-elasticsearch;
#sudo cp /var/data/kibana.repo /etc/yum.repos.d/kibana.repo
## kibana repo ##

## dotnet repo ##
sudo yum -y install centos-release-dotnet;
## dotnet repo ##

## mongo repo ##
sudo cp /var/data/mongodb-org-3.6.repo /etc/yum.repos.d/mongodb-org-3.6.repo;
## mongo repo ##

## node repo ##
curl --silent --location https://rpm.nodesource.com/setup_11.x | sudo bash -;
## node repo ##

## mono repo ##
rpm --import "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF"
yum-config-manager --add-repo http://download.mono-project.com/repo/centos7/
## mono repo ##

sudo yum -y update;

#################------>END OF REPO SECTION<-----#####

####################----> YUM INSTALL SECTION <-------###########
#########
######### EDIT YUM INSTALL SETTINGS HERE

printf "Install mysql-community-server \npostgresql11 \npostgresql11-server \nmongodb-org \nredis \nhttpd \nphp \nphp-common \nphp-mysqlnd \nphp-intl \nphp-json \nphp-xml \nphp-mcrypt \nphp-mbstring \nphp-pdo \nmod_php \nphp-gd \nphp-ctype \nphp-session \nphp-pdo_mysql \nphp-curl \nphp-ldap \nphp-xsl \nphp-zip \nphp-soap \nphp-mbstring \nphp-mysqli \ncomposer \ncurl \nelasticsearch \nkibana \ngit \nnodejs \nrh-dotnet20 \nimagemagick-dev...\n"
sudo yum -y install mysql-community-server postgresql11 postgresql11-server mongodb-org redis httpd httpd-tools php php-common php-mysqlnd php-intl php-json php-xml php-mcrypt php-mbstring php-pdo mod_php php-gd php-ctype php-session php-pdo_mysql php-pgsql php-curl php-ldap php-xsl php-zip php-soap php-mbstring php-mysqli java-1.8.0-openjdk-devel curl git nodejs neo4j rh-dotnet20 mono-complete nuget imagemagick-dev composer; 
#sudo yum -y install mysql-community-server postgresql11 postgresql11-server mongodb-org redis httpd httpd-tools nginx php php-common php-mysqlnd php-intl php-json php-xml php-mcrypt php-mbstring php-pdo mod_php php-gd php-ctype php-session php-pdo_mysql php-pgsql php-curl php-ldap php-xsl php-zip php-soap php-mbstring php-mysqli java-1.8.0-openjdk-devel curl elasticsearch kibana git nodejs neo4j rh-dotnet20 mono-complete nuget imagemagick-dev composer; 
#sudo yum -y install mysql-server httpd php php-mysqlnd php-intl php-json php-xml php-mcrypt php-mbstring php-pdo mod_php php-gd; 

#################------>END OF YUM INSTALL SECTION<-----#####

####################---->SECURITY SECTION <-------###########
#########
######### EDIT SECURITY CONFIG SETTINGS HERE

printf "Disabling selinux...\n";
sudo cp /var/data/selinuxconfig /etc/selinux/config;
sudo setenforce 0;
#################------>END OF SECURITY SECTION<-----#####

####################----> PHP SECTION <-------###########
#########
######### EDIT PHP CONFIG SETTINGS HERE
printf "Copying new php.ini file\n";
sudo cp /var/data/php.ini /etc/php.ini;
#################------>END OF PHP SECTION<-----#####

####################---->APACHE HTTPD SECTION <-------###########
#########
######### EDIT APACHE HTTPD CONFIG SETTINGS HERE

printf "Configuring apache...\n";
sudo chmod 754 /var/data/logs/;
sudo systemctl enable httpd;
sudo systemctl start httpd;

#printf "Restarting apache...\n";
#sudo apachectl restart;

#################------>END OF APACHE SECTION<-----#####

####################---->NGINX SECTION <-------###########
#########
######### EDIT NGINX CONFIG SETTINGS HERE


#################------>END OF NGINX SECTION<-----#####

####################---->RUBY SECTION <-------###########
#########
######### EDIT RUBY CONFIG SETTINGS HERE
printf "Installing RVM Ruby Version Manager and Ruby 2.4\n";
printf "Installing RVM....\n\n";
##     ensure vagrant has write access to it's own folder after all the sudoing
sudo chown -R vagrant:vagrant /usr/local
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable;
source /home/vagrant/.rvm/scripts/rvm;
##printf "Installing Ruby 2.4 as default \n";
##echo vagrant | su vagrant -p -c'rvm install 2.4 --default';
## THIS LINE NEEDS WORK HAHA

##########
#################------>END OF RUBY SECTION<-----#####

####################---->MYSQL SECTION <-------###########
#########
######### EDIT MYSQL CONFIG SETTINGS HERE
printf "Setting up MySQL for developer mode.\n";
sudo systemctl enable mysqld;
sudo systemctl start mysqld;
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
#sudo yum install -y postgresql11 postgresql11-server;
printf ".";
#################------>END OF MYSQL SECTION<-----#####

####################---->POSTGRESQL SECTION <-------###########
#########
######### EDIT POSTGRESQL CONFIG SETTINGS HERE
sudo systemctl enable postgresql-11;
printf ".";
#cd /usr/pgsql-9.3/bin/;
sudo /usr/pgsql-11/bin/postgresql11-setup initdb;
printf ".";
sudo cp -f /var/data/pg_hba.conf /var/lib/pgsql/11/data/pg_hba.conf;
printf ".";
printf ".";
sudo systemctl start postgresql-11;
printf ".\n";
sudo su postgres -c "psql -f /var/data/psqlmakevagrant.sql";
printf "Postgresql User:vagrant , Password:vagrant\n";
printf "Configuration Complete.\n";
#################------>END OF POSTGRESQL SECTION<-----#####


####################---->ELASTIC SEARCH SECTION <-------###########
#########
######### EDIT ELASTIC SEARCH CONFIG SETTINGS HERE
#sudo cp /var/data/elasticsearch.yml /etc/elasticsearch/elasticsearch.yml
#sudo systemctl start elasticsearch;
#sudo systemctl enable elasticsearch;
#################------>END OF ELASTIC SEARCH SECTION<-----#####


####################---->MONGO SECTION <-------###########
#########
######### EDIT MONGO CONFIG SETTINGS HERE
printf "Setting up and configuring Mongo DB\n";

sudo systemctl enable mongod;
sudo systemctl start mongod;
touch /home/vagrant/.dbshell;

#################------>END OF MONGO SECTION<-----#####

####################---->REDIS SECTION <-------###########
#########
######### EDIT REDIS CONFIG SETTINGS HERE
printf "Setting up and configuring Redis\n";

sudo systemctl enable redis;
sudo systemctl start redis;
sudo cp /var/data/redis.conf /etc/redis.conf

#################------>END OF REDIS SECTION<-----#####

####################---->NEO4J SECTION <-------###########
#########
######### EDIT NEO4J CONFIG SETTINGS HERE

printf "\n";
printf "\n";
printf "\n";
printf "Setting up Neo4j Service\n";
#SHOULDN'T NEED THESE LINES GOT 'EM FROM THE INTERNET
#sudo mkdir /var/run/neo4j;
#sudo chown -R vagrant /usr/share/neo4j;
#sudo chown -R vagrant /var/run/neo4j;
#sudo chown -R vagrant /var/log/neo4j
#sudo chown -R vagrant /etc/neo4j/
#################################IGNOREME
sudo systemctl enable neo4j;
sudo cp /var/data/neo4j.conf /etc/neo4j/neo4j.conf
sudo systemctl start neo4j;

#################------>END OF NEO4J SECTION<-----#####

####################---->KIBANA SECTION <-------###########
#########
######### EDIT KIBANA CONFIG SETTINGS HERE

#################------>END OF KIBANA SECTION<-----#####

####################---->JAVA9 SECTION <-------###########
#########
######### EDIT JAVA9 CONFIG SETTINGS HERE

##CREATES CONFLICT WITH NEO4J
##printf "Downloading and Installing Oracle Java JDK 9";
##wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/9.0.1+11/jdk-9.0.1_linux-x64_bin.rpm";
##sudo rpm -Uvh /var/data/jdk-9.0.1_linux-x64_bin.rpm;

#################------>END OF JAVA9 SECTION<-----#####

####################---->DOTNET CORE SECTION <-------###########
#########
######### EDIT DOTNET CORE CONFIG SETTINGS HERE
cp /var/data/.bashrc ~/.bashrc;
scl enable rh-dotnet20 bash;
source scl_source enable rh-dotnet20;

#################------>END OF DOTNET CORE SECTION<-----#####

####################---->PHPMYADMIN SECTION <-------###########
#########
######### EDIT PHPMYADMIN CONFIG SETTINGS HERE
printf "Downloading PhpMyAdmin.......\n";
wget -O phpmyadmin.zip https://files.phpmyadmin.net/phpMyAdmin/4.7.7/phpMyAdmin-4.7.7-english.zip;
printf "Unzipping PhpMyAdmin.......\n";
unzip phpmyadmin.zip -d /var/data/;
printf "Moving PhpMyAdmin.......\n";
mv /var/data/phpMyAdmin-4.7.7-english/ /var/www/html/phpmyadmin;
printf "Configuring PhpMydmin.......\n";
cp /var/data/config.inc.php.myadmin /var/www/html/phpmyadmin/config.inc.php;
#################------>END OF PHPMYADMIN SECTION<-----#####

####################---->PHPPGADMIN SECTION <-------###########
#########
######### EDIT PHPPGADMIN CONFIG SETTINGS HERE
printf "Downloading PhpPGAdmin.......\n";
wget -O phppgadmin.zip https://github.com/xzilla/phppgadmin/archive/master.zip;
printf "Unzipping PhpPGAdmin.......\n";
unzip phppgadmin.zip -d /var/data/;
printf "Moving PhpPGAdmin.......\n";
mv /var/data/phppgadmin-master /var/www/html/phppgadmin;
printf "Configuring PhpPGAdmin.......\n";
cp /var/data/config.inc.php.pgadmin /var/www/html/phppgadmin/conf/config.inc.php;
#################----->END OF PHPPGADMIN SECTION<-----#####

####################----->END OF SECTIONS <-----###########

######### FINAL MATTERS #################
#### Copy any final Configuration files here #########

########### APACHE FINAL SECTION ############
sudo cp /var/data/.htaccess /var/www/.htaccess;
sudo cp /var/data/httpd.conf /etc/httpd/conf/httpd.conf;
sudo cp /var/data/httpd-vhost.conf /etc/httpd/conf.d/httpd-vhost.conf;
sudo chgrp -R apache /var/data/logs;

########### END APACHE FINAL SECTION ########

########### NGINX FINAL SECTION ############

#printf "Copying Configuration files\n.\n.\n.\n";

#printf  "Copying /var/data/nginx.conf to /etc/nginx/nginx.conf...\n";
#sudo cp  /var/data/nginx.conf /etc/nginx/nginx.conf;
#printf  "Copying /var/data/apache_proxy.conf to /etc/nginx/apache_proxy.conf...\n";
#sudo cp  /var/data/apache_proxy.conf /etc/nginx/apache_proxy.conf;
#printf  "Copying /var/data/phpmyadmin_proxy.conf to /etc/nginx/phpmyadmin_proxy.conf...\n";
#sudo cp  /var/data/phpmyadmin_proxy.conf /etc/nginx/phpmyadmin_proxy.conf;
########### END NGINX FINAL SECTION ########
########### SERVER ENABLE AND START ########
#sudo systemctl enable nginx;
sudo systemctl enable httpd;
sudo systemctl start httpd;
#sudo systemctl start nginx;
########### END SERVER SECTION ##########
######### END OF CURRENT CONFIG SETTINGS #################
printf "Forwarded Ports:\n";
printf "Private Network IP: 192.168.33.10\n";
printf "Apache Ports: \n guest: 80, host: 8080\n";
printf "Php Dev Servers: \n guest: 8000, host: 8888\n";
printf "MySql Server Access: \nguest: 3306, host: 3336\n";
printf "Access MongoDB Port: \nguest: 5432, host: 5400\n";
printf "Access Redis Port: \nguest: 6379, host: 6300\n";
printf "Access Neo4j\n";

printf "HTTP\n guest: 7474, host: 7414\n";
printf "HTTPS\n guest: 7473, host: 7413\n";
printf "Bolt\n guest: 7687, host: 7617\n";

sh -c 'sudo netstat -plntu';