FROM	alpine:3.18

# Install PHP 8.2 & MariaDB-client dependencies
RUN		apk update && apk upgrade &&\
		apk add php82 php82-fpm php82-mysqli php82-cli php82-phar php82-iconv &&\
		apk add mariadb-client

# Install Wordpress files
RUN		wget https://wordpress.org/latest.tar.gz &&\
		mkdir -p /var/www/html &&\
		tar -xvf latest.tar.gz -C /var/www/html &&\
		rm -f latest.tar.gz

RUN		sed -i 's/listen = 127.0.0.1:9000/listen = 9000/g' /etc/php82/php-fpm.d/www.conf

# Install WP-CLI
RUN		apk add curl &&\
		curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar &&\
		chmod +x wp-cli.phar &&\
		mv wp-cli.phar /usr/local/bin/wp &&\
		ln -s /usr/bin/php82 /usr/bin/php

# Copy WordPress configuration file
COPY	./config/configure-wordpress.sh /tmp/configure-wordpress.sh
RUN		chmod +x /tmp/configure-wordpress.sh

# Run the WordPress configuration file at container startup
ENTRYPOINT	[ "sh", "/tmp/configure-wordpress.sh" ]
