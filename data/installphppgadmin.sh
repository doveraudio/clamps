#!/bin/bash

printf "Downloading PhpPGAdmin.......\n";
wget -O phppgadmin.zip https://github.com/xzilla/phppgadmin/archive/master.zip;
printf "Unzipping PhpPGAdmin.......\n";
unzip phppgadmin.zip -d /var/data/;
printf "Moving PhpPGAdmin.......\n";
mv /var/data/phppgadmin-master /var/www/html/phppgadmin;
printf "Configuring PhpPGAdmin.......\n";
cp /var/data/config.inc.php.pgadmin /var/www/html/phppgadmin/conf/config.inc.php;