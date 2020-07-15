CREATE DATABASE sitedb;
GRANT ALL PRIVILEGES ON sitedb.* TO 'root'@'localhost' WITH GRANT OPTION; 
UPDATE mysql.user set plugin='mysql_native_password' where user='root';
FLUSH PRIVILEGES;