#!/bin/sh

WP_PATH=/var/www/html/wordpress

if [ ! -f ${WP_PATH}/wp-config.php ]; then
	wp config create --allow-root --dbname=$WP_DB_NAME --dbuser=$WP_DB_USER --dbpass=$WP_DB_PASS --dbhost=mariadb:3306 --path=${WP_PATH}
	wp cli core install --url=$NGINX_HOST --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASS --path=${WP_PATH} --skip-email
	wp cli user create $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASS --role=subscriber --display_name=$WP_USER --porcelain --path=${WP_PATH}
fi

exec /usr/sbin/php-fmp82 -F -R
