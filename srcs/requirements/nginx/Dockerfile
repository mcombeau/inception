FROM	alpine:3.14

RUN		apk update
RUN		apk upgrade
RUN		apk add nginx
RUN		mkdir -p /var/www/html/

RUN		cat /etc/nginx/http.d/default.conf
COPY	./conf/nginx.conf /etc/nginx/nginx.conf

# EXPOSE	80/tcp
