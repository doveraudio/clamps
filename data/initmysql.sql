ALTER USER 'root'@'localhost' IDENTIFIED BY 'complicatedPassword_1';
UNINSTALL COMPONENT 'file://component_validate_password';
ALTER USER root@localhost IDENTIFIED WITH mysql_native_password BY 'root';
GRANT ALL ON *.* TO 'root'@'localhost';

flush privileges;