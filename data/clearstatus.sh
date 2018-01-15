#! /bin/bash
printf "Erasing status logs\n";
printf "" > /var/data/status/httpd.status;
printf "" > /var/data/status/journalctl.status;
printf "" > /var/data/status/nginx.status;


printf "Status log erasure complete.\n\n";