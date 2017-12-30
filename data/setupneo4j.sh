#!/bin/bash

printf "Setting up Neo4j Service\n";
sudo mkdir /var/run/neo4j;
sudo chown -R vagrant /usr/share/neo4j;
sudo chown -R vagrant /var/run/neo4j;
sudo chown -R vagrant /var/log/neo4j
sudo chown -R vagrant /etc/neo4j/
sudo cp /var/data/neo4j.conf /etc/neo4j/neo4j.conf
sudo systemctl enable neo4j;

sudo systemctl start neo4j;
