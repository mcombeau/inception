FROM	alpine:3.18

# Install MariaDB
RUN		apk update && apk upgrade &&\
		apk add mariadb mariadb-client

# Copy MariaDB configuration files
COPY	./conf/mariadb.cnf /etc/mysql/my.cnf
COPY	./conf/configurate-mariadb.sh /tmp/configurate-mariadb.sh
RUN		chmod +x /tmp/configurate-mariadb.sh

# Run MariaDB configuration script as entry point
ENTRYPOINT	[ "sh", "/tmp/configurate-mariadb.sh" ]
