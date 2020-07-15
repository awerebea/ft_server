#!bin/bash

# start services
service mysql start
service php7.3-fpm start
service nginx start

# DB access config
mysql -e "CREATE DATABASE site_db;"
mysql -e "CREATE USER 'admin'@'localhost' IDENTIFIED BY '1234';"
mysql -e "GRANT ALL PRIVILEGES ON site_db.* TO 'admin'@'localhost' IDENTIFIED BY '1234';"
mysql -e "FLUSH PRIVILEGES;"

# infinite loop to prevent container auto-stop
while true; 
	do sleep 1000
done
