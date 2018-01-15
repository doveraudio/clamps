#! bin/bash

printf "Getting current journalctl status.\n";

sudo journalctl -xe > journalctl.status;