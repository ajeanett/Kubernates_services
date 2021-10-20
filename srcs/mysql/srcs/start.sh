#!/bin/bash
openrc default
/etc/init.d/mariadb setup
rc-service mariadb start
echo "CREATE USER 'ajeanett'@'%' IDENTIFIED BY 'pass';" | mysql -u root --skip-password
echo "CREATE DATABASE wp_base DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;" | mysql -u root --skip-password
echo "GRANT ALL ON wp_base.* TO 'ajeanett'@'%' IDENTIFIED BY 'pass' WITH GRANT OPTION;" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password

mysql wp_base -u root < /wp_base.sql

rc-service mariadb stop
#bash
mysqld_safe --datadir='/var/lib/mysql'