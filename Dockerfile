# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: awerebea <awerebea@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/07/12 19:07:36 by awerebea          #+#    #+#              #
#    Updated: 2020/07/15 02:59:18 by awerebea         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster
# SHELL ["/bin/bash", "-c"]

	# update system components
RUN apt-get update && apt-get -y upgrade \
	# install requered components
&&	apt-get install -y \
	mariadb-server \
	nginx \
	php-fpm \
	php-mbstring \
	php-mysql \
	wget


RUN	wget -c https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-english.tar.xz \
&&	mkdir /var/www/ft_server_site && mkdir /var/www/ft_server_site/phpmyadmin \
&&	tar -xvf phpMyAdmin-latest-english.tar.xz --strip-components 1 -C /var/www/ft_server_site/phpmyadmin \
	# add WordPress
&&	wget -c https://wordpress.org/latest.tar.gz \
&&	tar -xvf latest.tar.gz \
&&	mv wordpress/ /var/www/ft_server_site/ \
	# remove unused more downloaded archives
&&	rm -f phpMyAdmin-latest-english.tar.xz \
&&	rm -f latest.tar.gz \
	# generate ssl certificate and key
&&	mkdir /etc/nginx/ssl \
&&	openssl req -newkey rsa:2048 -x509 -sha256 -days 30 -nodes -out /etc/nginx/ssl/ft_server_site.crt -keyout /etc/nginx/ssl/ft_server_site.key \
	-subj "/C=RU/ST=Tatarstan/L=Kazan/O=School 21/OU=awerebea/CN=ft_server_site"

	# copy requered sources in container
COPY /srcs/config.inc.php \
	/srcs/mysql.conf.sql \
	/srcs/nginx.conf \
	/srcs/wp-config.php \
	/srcs/ft_server_start.sh \
	/srcs/autoindex.sh ./

	# move config-files
RUN mv /config.inc.php /var/www/ft_server_site/phpmyadmin/ \
&&	mv /nginx.conf /etc/nginx/sites-available/ft_server_site \
&&	mv /wp-config.php /var/www/ft_server_site/wordpress/ \
	# enable nginx site configuration
&&	ln -s /etc/nginx/sites-available/ft_server_site /etc/nginx/sites-enabled/ \
	# remove unused nginx default configuration
&&	rm -f /etc/nginx/sites-enabled/default \
	# let web services be owner of site's root directory (to have access to it's files) 
&&	chown -R www-data:www-data /var/www/ft_server_site \
	# change directory permissions rwxr-xr-x
&&	find /var/www/ft_server_site/ -type d -exec chmod 755 {} \; \
	# change files permissions rw-r--r--
&&	find /var/www/ft_server_site/ -type f -exec chmod 644 {} \;

# set ports on which a container listens for connections
EXPOSE 80 443

# launch server
CMD bash ft_server_start.sh
