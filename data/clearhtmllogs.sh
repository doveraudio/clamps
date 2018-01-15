#! /bin/bash
printf "Erasing logs in /var/www/html:\n";
printf "" > /var/www/html/access.log;
printf "" > /var/www/html/error.log;

printf "Logs Erased\n";