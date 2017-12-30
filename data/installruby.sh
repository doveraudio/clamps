#!/bin/bash
printf "Installing RVM....\n\n";
sudo chown -R vagrant:vagrant /usr/local;
#\curl -sSL https://get.rvm.io | bash -s stable;
#source /home/vagrant/.rvm/scripts/rvm;
echo vagrant | su vagrant -p -c'rvm install 2.4 --default';
#rvm install 2.4 --default;