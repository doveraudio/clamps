#!/bin/bash
printf "Downloading PhpMyAdmin.......\n";
wget -O phpmyadmin.zip https://files.phpmyadmin.net/phpMyAdmin/4.7.7/phpMyAdmin-4.7.7-english.zip;
printf "Unzipping PhpMyAdmin.......\n";
unzip phpmyadmin.zip -d /var/data/;
printf "Moving PhpMyAdmin.......\n";
mv /var/data/phpMyAdmin-4.7.7-english/ /var/www/html/phpmyadmin;
printf "Configuring PhpMydmin.......\n";
cp /var/data/config.inc.php.myadmin /var/www/html/phpmyadmin/config.inc.php;