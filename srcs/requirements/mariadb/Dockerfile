FROM	alpine:3.18

# Install MariaDB
RUN		apk update && apk upgrade &&\
		apk add mariadb mariadb-client

# Copy MariaDB configuration files
COPY	./conf/configure-mariadb.sh /tmp/configure-mariadb.sh
RUN		chmod +x /tmp/configure-mariadb.sh

# Run MariaDB configuration script as entry point
ENTRYPOINT	[ "sh", "/tmp/configure-mariadb.sh" ]
