#!/bin/bash
sudo yum install centos-release-dotnet;
sudo yum install rh-dotnet20;

cp /var/data/.bashrc ~/.bashrc
scl enable rh-dotnet20 bash;
