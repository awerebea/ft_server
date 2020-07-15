# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: awerebea <awerebea@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/07/12 19:07:36 by awerebea          #+#    #+#              #
#    Updated: 2020/07/15 22:03:29 by awerebea         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

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

	# add phpMyAdmin
RUN wget -c https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-english.tar.xz \
&&	mkdir /var/www/site /var/www/site/phpmyadmin /var/www/site/phpmyadmin/tmp \
&&	tar -xvf phpMyAdmin-latest-english.tar.xz --strip-components 1 -C /var/www/site/phpmyadmin \
	# add WordPress
&&	wget -c https://wordpress.org/latest.tar.gz \
&&	tar -xvf latest.tar.gz --strip-components 1 -C /var/www/site \
	# remove unused more downloaded archives
&&	rm -f phpMyAdmin-latest-english.tar.xz \
&&	rm -f latest.tar.gz \
	# generate ssl certificate and key
&&	mkdir /etc/nginx/ssl \
&&	openssl req -newkey rsa:2048 -x509 -sha256 -days 30 -nodes -out /etc/nginx/ssl/site.crt -keyout /etc/nginx/ssl/site.key \
	-subj "/C=RU/ST=Tatarstan/L=Kazan/O=School 21/OU=awerebea/CN=ft_server"

	# copy requered sources in container
COPY /srcs/config.inc.php \
	/srcs/nginx.conf \
	/srcs/wp-config.php \
	/srcs/ft_server_start.sh \
	/srcs/autoindex.sh ./

	# move config-files
RUN mv /config.inc.php /var/www/site/phpmyadmin/ \
&&	mv /nginx.conf /etc/nginx/sites-available/site \
&&	mv /wp-config.php /var/www/site/ \
	# enable nginx site configuration
&&	ln -s /etc/nginx/sites-available/site /etc/nginx/sites-enabled/ \
	# remove unused nginx default configuration
&&	rm -f /etc/nginx/sites-enabled/default \
	# let web services be owner of site's root directory (to have access to it's files)
&&	chown -R www-data:www-data /var/www/site \
	# change directory permissions rwxr-xr-x
&&	find /var/www/site/ -type d -exec chmod 755 {} \; \
	# change files permissions rw-r--r--
&&	find /var/www/site/ -type f -exec chmod 644 {} \; \
	# make scripts executable
&&	chmod +x ft_server_start.sh autoindex.sh

# set ports on which a container listens for connections
EXPOSE 80 443

# launch server
CMD bash ft_server_start.sh
