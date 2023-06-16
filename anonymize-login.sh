#!/bin/bash

# Run to re-anonymize files before pushing to git with
# LOGIN=<login_set_in_Makefile_variable> ./anonymize-login.sh

sed -i "s/${LOGIN}/login/g" Makefile
sed -i "s/${LOGIN}/login/g" srcs/.env
sed -i "s/${LOGIN}/login/g" srcs/requirements/nginx/conf/default.conf

