#! bin/bash

printf "Getting current nginx status.\n";

sudo systemctl status nginx -l >> /var/data/nginx.status