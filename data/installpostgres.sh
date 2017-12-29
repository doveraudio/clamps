sudo yum install -y https://download.postgresql.org/pub/repos/yum/9.4/redhat/rhel-7-x86_64/pgdg-centos94-9.4-2.noarch.rpm;
sudo yum install -y postgresql94 postgresql94-server;
sudo systemctl enable postgresql-9.4;
#cd /usr/pgsql-9.3/bin/;
sudo /usr/pgsql-9.4/bin/postgresql94-setup initdb;
sudo cp -f /var/data/pg_hba.conf /var/lib/pgsql/9.4/data/pg_hba.conf;
sudo systemctl start postgresql-9.4;