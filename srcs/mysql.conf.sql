CREATE DATABASE wordpress;
GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' WITH GRANT OPTION; 
UPDATE mysql.user set plugin='mysql_native_password' where user='root';
FLUSH PRIVILEGES;