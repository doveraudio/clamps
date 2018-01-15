#! /bin/bash
printf "Removing Installed Apps...\n";
printf "Removing phpmyadmin:\n";
sudo rm -rf /var/www/html/phpmyadmin;
printf "phpmyadmin removed\n";
printf "Removing phppgadmin:\n";
sudo rm -rf /var/www/html/phppgadmin;
printf "phppgadmin removed\n";

printf "Operation Complete";

