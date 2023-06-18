FROM	alpine:3.17

# NGINX
RUN		apk update && apk upgrade &&\
		apk add nginx &&\
		mkdir -p /var/www/html/
COPY	./conf/nginx.conf /etc/nginx/nginx.conf
COPY	./conf/default.conf /etc/nginx/http.d/default.conf

# OPENSSL
RUN		apk add openssl &&\
		openssl req -x509 -nodes -days 365 -newkey rsa:2048\
			-keyout /etc/ssl/private/nginx-selfsigned.key\
			-out /etc/ssl/certs/nginx-selfsigned.crt\
			-subj "/C=FR/ST=IDF/L=Paris/O=42Network/OU=42Paris/CN=nginx_host_example"

RUN		adduser -D -g 'www' www &&\
		chown -R www:www /run/nginx/ &&\
		chown -R www:www /var/www/html/

EXPOSE	443/tcp

# Run nginx with daemon off, i.e. in the foreground since one container only
# has one service. This is best practice for Docker containers and/or debugging.
ENTRYPOINT	["nginx"]
CMD			["-g", "daemon off;"]
