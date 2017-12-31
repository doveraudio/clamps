# CLAMPS

A self provisioning development environment with a pragmatic bash script for configuration. 
### Requirements:
-  A Quadcore or better CPU (Machine requires at least 2 Cores)
- 8 GB > of RAM (4gb for VirtualMachine, extendable in Vagrantfile) 
- Git
- VirtualBox
- Vagrant

### Recommendations:
- [ConEmu-Maximus5](https://conemu.github.io/) for Windows
- [Guake](http://guake-project.org/) for Fedora
- Comment out sections in [provision script](https://github.com/doveraudio/clamps/blob/master/data/provision.sh) for systems you won't use. [Neo4j](https://neo4j.com/) only __requires__ [Java Open JDK 1.8 Jre](http://openjdk.java.net/install/), not the entire SDK. So if you won't use Java, comment out the section, and then remove it from the install line.
- Customize your version requirements. Though certain dependencies exist, if you are targeting those technologies you either know that or will find out! Change the repository information at the top of the provisioning script, and change the install version as needed. 

### Usage:

Select a location on your system and execute:

    git clone https://github.com/doveraudio/clamps.git .

    cd machine
    
    vagrant up

Log into the machine from the machine folder, with

    vagrant ssh

    
### Host Database Access:

  - Access PhpMyAdmin: 
    - [http://192.168.33.10/phpmyadmin](http://192.168.33.10/phpmyadmin)   
    - __Username:__ root __Password:__ root 
  - Access PhpPgAdmin: 
    - [http://192.168.33.10/phpPgAdmin](http://192.168.33.10/phpPgAdmin)     
    - __Username:__ postgres __Password:__ postgres
  - Access Neo4j at 
    - [http://192.168.33.10:7474](http://192.168.33.10:7474) / [bolt://192.168.33.10:7687](bolt://192.168.33.10:7687) 
    - [http://localhost:7414](http://localhost:7414) / [bolt://localhost:7617](bolt://localhost:7617)
    - __Username:__ neo4j __Password:__ neo4j 

### Languages Included:
- PHP Version 7.0
- PERL v5.16.3
- C Compiler: gcc (Red Hat 4.8.5-16)
- Ruby 2.4 (via RVM)
- Java 8 JDK and JRE
- Python 2.7
### WebServer:

- Apache (HTTPD)
    - [http://192.168.33.10/](http://192.168.33.10/)
    - [localhost:8080](localhost:8080)
- PHP built in webserver (When activated and serving)
    - [http://192.168.33.10:8000](http://192.168.33.10:8000)
    - [localhost:8888](localhost:8888)
    

