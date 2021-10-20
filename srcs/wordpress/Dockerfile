FROM alpine:3.7

RUN apk update
RUN apk upgrade

RUN apk add wget nginx supervisor bash
RUN apk add php7 php7-fpm php7-opcache php7-common php7-gd php7-iconv php7-json php7-gd php7-curl php7-xml php7-zlib php7-mbstring php7-json php7-session php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom

RUN wget http://wordpress.org/latest.tar.gz
RUN tar -xf latest.tar.gz
RUN rm latest.tar.gz
RUN mv wordpress /var/www/wordpress
COPY ./srcs/wp-config.php /var/www/wordpress/

COPY ./srcs/php_start.sh .
RUN chmod 777 php_start.sh

RUN mkdir -p /run/nginx
RUN mkdir -p /run/php

RUN chmod 755 /run/nginx
RUN chmod 755 /run/php
RUN chmod 755 /var/lib/nginx
RUN chmod 755 /var/lib/nginx/tmp
RUN chmod 755 -R /var/www/*

COPY ./srcs/nginx.conf /etc/nginx/conf.d/default.conf
COPY ./srcs/supervisord.conf /etc/supervisord.conf

EXPOSE 5050
CMD ./php_start.sh
