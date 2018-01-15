#!/bin/bash

printf "Copying Configuration files\n.\n.\n.\n";

printf  "Copying /var/data/nginx.conf to /etc/nginx/nginx.conf...\n";
sudo cp  /var/data/nginx.conf /etc/nginx/nginx.conf;
printf  "Copying /var/data/apache_proxy.conf to /etc/nginx/apache_proxy.conf...\n";
sudo cp  /var/data/apache_proxy.conf /etc/nginx/apache_proxy.conf;
printf  "Copying /var/data/phpmyadmin_proxy.conf to /etc/nginx/phpmyadmin_proxy.conf...\n";
sudo cp  /var/data/phpmyadmin_proxy.conf /etc/nginx/phpmyadmin_proxy.conf;





printf "Complete...\n.\n.\n.\n";
