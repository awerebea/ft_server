#!bin/bash

# start services
service mysql start && mysql < /mysql.conf.sql && rm /mysql.conf.sql
service php7.3-fpm start
service nginx start

# infinite loop to prevent container auto-stop
while true; 
	do sleep 1000
done