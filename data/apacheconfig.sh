#!/bin/bash
printf "Copying Config Files...\n";
sudo cp /var/data/.htaccess /var/www/.htaccess;
printf ".";
sudo cp /var/data/httpd.conf /etc/httpd/conf/httpd.conf;
printf ".";
sudo cp /var/data/httpd-vhost.conf /etc/httpd/conf.d/httpd-vhost.conf
printf ".\n";
printf "Restarting Apache Server.....\n"
sudo systemctl restart httpd;
printf "Operation Complete.\n";
