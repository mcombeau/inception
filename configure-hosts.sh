#!/bin/bash

if ! grep -q ${DOMAIN} "/etc/hosts"; then
	echo "127.0.0.1 ${DOMAIN}" | sudo tee -a /etc/hosts
fi
