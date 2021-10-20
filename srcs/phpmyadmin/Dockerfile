FROM alpine:3.7

RUN apk update
RUN apk upgrade

RUN apk add wget nginx supervisor bash
RUN apk add php7 php7-fpm php7-opcache php7-common php7-gd php7-iconv php7-json php7-gd php7-curl php7-xml php7-zlib php7-mbstring php7-json php7-session php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
RUN wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz
RUN tar xzf phpMyAdmin-5.0.2-all-languages.tar.gz
RUN rm phpMyAdmin-5.0.2-all-languages.tar.gz
RUN mv phpMyAdmin-5.0.2-all-languages /etc/phpmyadmin

COPY ./srcs/nginx.conf /etc/nginx/conf.d/default.conf
COPY ./srcs/supervisord.conf /etc/supervisord.conf

RUN mkdir -p /run/nginx /run/php

COPY ./srcs/php_start.sh .

COPY ./srcs/config.inc.php /etc/phpmyadmin/config.inc.php


RUN chmod +x php_start.sh

EXPOSE 5000

CMD ./php_start.sh