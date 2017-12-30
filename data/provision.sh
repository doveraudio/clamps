#!/bin/bash
### Provision Vagrant ###
printf "Checking for updates....\n";
cd /var/data;
sudo 
sudo yum -y install wget unzip yum-utils;
wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm;
wget http://rpms.remirepo.net/enterprise/remi-release-7.rpm;
sudo rpm -Uvh remi-release-7.rpm epel-release-latest-7.noarch.rpm;
sudo rpm --import http://debian.neo4j.org/neotechnology.gpg.key
sudo yum-config-manager --enable remi-php70;
sudo yum localinstall -y https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm;
sudo yum install -y https://download.postgresql.org/pub/repos/yum/9.4/redhat/rhel-7-x86_64/pgdg-centos94-9.4-2.noarch.rpm;
sudo yum -y install centos-release-dotnet;
sudo cp /var/data/mongodb-org-3.6.repo /etc/yum.repos.d/mongodb-org-3.6.repo;
sudo cp /var/data/neo4j.repo /etc/yum.repos.d/neo4j.repo;
curl --silent --location https://rpm.nodesource.com/setup_9.x | sudo bash -;
sudo yum -y update;

printf "Install mysql-community-server \npostgresql94 \npostgresql94-server \nmongodb-org \nredis \nhttpd \nphp \nphp-common \nphp-mysqlnd \nphp-intl \nphp-json \nphp-xml \nphp-mcrypt \nphp-mbstring \nphp-pdo \nmod_php \nphp-gd \nphp-ctype \nphp-session \nphp-pdo_mysql \nphp-curl \nphp-ldap \nphp-xsl \nphp-zip \nphp-soap \nphp-mbstring \nphp-mysqli \ncomposer \ncurl \ngit \nnodejs \nrh-dotnet20 \nimagemagick-dev...\n"
sudo yum -y install mysql-community-server postgresql94 postgresql94-server mongodb-org redis httpd php php-common php-mysqlnd php-intl php-json php-xml php-mcrypt php-mbstring php-pdo mod_php php-gd php-ctype php-session php-pdo_mysql php-pgsql php-curl php-ldap php-xsl php-zip php-soap php-mbstring php-mysqli java-1.8.0-openjdk-devel curl git nodejs neo4j rh-dotnet20 imagemagick-dev composer; 
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

printf "Installing RVM Ruby Version Manager and Ruby 2.4\n";
printf "Installing RVM....\n\n";
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable;
source /home/vagrant/.rvm/scripts/rvm;
printf "Installing Ruby 2.4 as default \n";
rvm install 2.4 --default;

printf "Configuring Microsoft Dot Net Core 2.0\n";


cp /var/data/.bashrc ~/.bashrc



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

printf "Setting up and configuring Redis\n";

sudo systemctl enable redis;
sudo systemctl start redis;
sudo cp /var/data/redis.conf /etc/redis.conf

##CREATES CONFLICT WITH NEO4J
##printf "Downloading and Installing Oracle Java JDK 9";
##wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/9.0.1+11/jdk-9.0.1_linux-x64_bin.rpm";
##sudo rpm -Uvh /var/data/jdk-9.0.1_linux-x64_bin.rpm;

cp /var/data/.bashrc ~/.bashrc

printf "Setting up Neo4j Service\n";
#sudo mkdir /var/run/neo4j;
#sudo chown -R vagrant /usr/share/neo4j;
#sudo chown -R vagrant /var/run/neo4j;
#sudo chown -R vagrant /var/log/neo4j
#sudo chown -R vagrant /etc/neo4j/
sudo cp /var/data/neo4j.conf /etc/neo4j/neo4j.conf
sudo systemctl enable neo4j;

sudo systemctl start neo4j;

printf "Forwarded Ports:\n";
printf "Private Network IP: ip: 192.168.33.10";
printf "Apache Ports: \n guest: 80, host: 8080";
printf "Php Dev Servers: \n guest: 8000, host: 8888";
printf "MySql Server Access: \nguest: 3306, host: 3336\n";
printf "Access MongoDB Port: \nguest: 5432, host: 5400\n";
printf "Access Redis Port: \nguest: 6379, host: 6300\n";
printf "Access Neo4j\n";

printf "HTTP\n guest: 7474, host: 7414\n";
printf "HTTPS\n guest: 7473, host: 7413\n";
printf "Bolt\n guest: 7687, host: 7617\n";
scl enable rh-dotnet20 bash;