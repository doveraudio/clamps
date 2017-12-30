printf "Installing RVM....\n\n";
\curl -sSL https://get.rvm.io | bash -s stable;
source /home/vagrant/.rvm/scripts/rvm;

rvm install 2.4 --default;