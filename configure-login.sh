#!/bin/bash

# Edit the LOGIN variable in Makefile first

sed -i "s/login/${LOGIN}/g" srcs/.env
sed -i "s/login/${LOGIN}/g" srcs/requirements/nginx/conf/default.conf

