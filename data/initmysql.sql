ALTER USER 'root'@'localhost' IDENTIFIED BY 'complicatedPassword_1';
uninstall plugin validate_password;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';