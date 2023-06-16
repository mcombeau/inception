FROM	alpine:3.18

RUN		apk update && apk upgrade &&\
		apk add vsftpd

COPY	./conf/vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY	./conf/configure-vsftpd.sh /tmp/configure-vsftpd.sh

ENTRYPOINT [ "sh", "/tmp/configure-vsftpd.sh" ]

