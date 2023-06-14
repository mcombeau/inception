#!/bin/sh

# Grant MySQLD permissions to run
if [ ! -d "/run/mysqld" ]; then
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
fi

# Initialize MySQL Data Directory if it does not already exist
if [ ! -d "/var/lib/mysql/mysql" ]; then
	chown -R mysql:mysql /var/lib/mysql
	mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm > /dev/null
fi

# export $( grep -vE "^(#.*|\s*)$" .env )
export DB_ROOT_PASS=SecureDBPASS666
export WP_DB_NAME=wordpress_db
export WP_DB_USER=wordpress_user
export WP_DB_PASS=AwesomelySecurePassword123

TMP=/tmp/.tmpfile

echo "USE mysql;" > ${TMP}
echo "FLUSH PRIVILEGES;" >> ${TMP}
echo "DELETE FROM mysql.user WHERE User='';" >> ${TMP}
echo "DROP DATABASE IF EXISTS test;" >> ${TMP}
echo "DELETE FROM mysql.db WHERE Db='test';" >> ${TMP}
echo "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');" >> ${TMP}
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASS';" >> ${TMP}
echo "CREATE DATABASE $WP_DB_NAME;" >> ${TMP}
echo "CREATE USER '$WP_DB_USER'@'%' IDENTIFIED BY '$WP_DB_PASS';" >> ${TMP}
echo "GRANT ALL PRIVILEGES ON $WP_DB_NAME.* TO '$WP_DB_USER'@'%' IDENTIFIED BY '$WP_DB_PASS';" >> ${TMP}
echo "FLUSH PRIVILEGES;" >> ${TMP}

# Alpine does not come with service or rc-service,
# so we cannot use: service mysql start
# We might be able to install with: apk add openrc
# But we can also manually start and configure the mysql daemon:
/usr/bin/mysqld --user=mysql --bootstrap < ${TMP}
rm -f ${TMP}


exec /usr/bin/mysqld --user=mysql --console
