#! bin/bash

printf "Getting current httpd status.\n";

sudo systemctl status httpd -l >> /var/data/httpd.status