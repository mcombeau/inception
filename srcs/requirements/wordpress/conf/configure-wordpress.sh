#!/bin/sh

echo "[WP config] Configuring WordPress..."

echo "[WP config] Waiting for MariaDB..."
while ! mariadb -h${DB_HOST} -u${WP_DB_USER} -p${WP_DB_PASS} ${WP_DB_NAME} &>/dev/null;
do
    sleep 3
done
echo "[WP config] MariaDB accessible."

WP_PATH=/var/www/html/wordpress

if [ -f ${WP_PATH}/wp-config.php ]
then
	echo "[WP config] WordPress already configured."
else
	echo "[WP config] Configuring WordPress database access..."

	echo "[WP config] Updating WP-CLI..."
	./wp-cli.phar cli update --yes --allow-root
	echo "[WP config] WP-CLI info:"
	./wp-cli.phar --info
	# echo "[WP config] Downlading latest WordPress core..."
	# ./wp-cli.phar core download --allow-root
	echo "[WP config] Creating wp-config.php..."
	./wp-cli.phar config create --dbname=${WP_DB_NAME} --dbuser=${WP_DB_USER} --dbpass=${WP_DB_PASS} --dbhost=${DB_HOST} --path=${WP_PATH} --allow-root
	echo "[WP config] Installing WordPress core..."
	./wp-cli.phar core install --url=${NGINX_HOST} --title=${WP_TITLE} --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASS} --admin_email=${WP_ADMIN_EMAIL} --path=${WP_PATH} --allow-root
	echo "[WP config] Creating WordPress default user..."
	./wp-cli.phar user create $WP_USER ${WP_USER_EMAIL} --user_pass=${WP_USER_PASS} --role=subscriber --display_name=${WP_USER} --porcelain --path=${WP_PATH} --allow-root
	echo "[WP config] ---------- wp-config.php"
	cat ${WP_PATH}/wp-config.php
fi

echo "[WP config] Executing PHP fastcgi."
exec /usr/sbin/php-fpm81 -F -R
