#!/bin/sh

echo "[FTP config] Configuring vsftpd..."

if id "$FTP_USER" >/dev/null 2>&1; then
	echo "[FTP config] FTP user already exists."
else
	echo "[FTP config] FTP user does not exist. Creating user..."
	mkdir -p /var/www/html
	adduser ${FTP_USER} --disabled-password
	echo "${FTP_USER}:${FTP_PASS}" | /usr/bin/chpasswd &> /dev/null
	chown -R ${FTP_USER}:${FTP_USER} /var/www/html

	echo ${FTP_USER} | tee -a /etc/vsftpd.userlist &> /dev/null
fi

echo "[FTP config] Starting vsftpd daemon on port 21."
/usr/sbin/vsftpd
