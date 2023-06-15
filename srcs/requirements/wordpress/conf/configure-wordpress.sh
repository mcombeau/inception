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
	wp cli update --allow-root
	echo "[WP config] WP-CLI info:"
	wp --info
	echo "[WP config] Updating WordPress core..."
	wp core download --allow-root
	echo "[WP config] Creating wp-config.php..."
	wp config create --dbname=${WP_DB_NAME} --dbuser=${WP_DB_USER} --dbpass=${WP_DB_PASS} --dbhost=${DB_HOST} --path=${WP_PATH} --allow-root
	echo "[WP config] Installing WordPress core..."
	wp core install --url=${NGINX_HOST} --title=${WP_TITLE} --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASS} --path=${WP_PATH} --skip-email
	echo "[WP config] Creating WordPress default user..."
	wp user create $WP_USER ${WP_USER_EMAIL} --user_pass=${WP_USER_PASS} --role=subscriber --display_name=${WP_USER} --porcelain --path=${WP_PATH}
fi

echo "[WP config] Executing PHP fastcgi."
exec /usr/sbin/php-fpm81 -F -R
