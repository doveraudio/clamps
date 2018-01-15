#! /bin/bash
printf "Erasing clamps.xo logs\n";
printf "" > /var/data/logs/apache/clamps.xo/access.log;
printf "" > /var/data/logs/apache/clamps.xo/error.log;
printf "Erasing neo4j logs\n";
printf "" > /var/data/logs/apache/neo4j/access.log;
printf "" > /var/data/logs/apache/neo4j/error.log;
printf "Erasing phpmyadmin logs\n";
printf "" > /var/data/logs/apache/phpmyadmin/access.log;
printf "" > /var/data/logs/apache/phpmyadmin/error.log;
printf "Erasing phppgadmin logs\n";
printf "" > /var/data/logs/apache/phppgadmin/access.log;
printf "" > /var/data/logs/apache/phppgadmin/error.log;


printf "Log erasure complete.\n\n";