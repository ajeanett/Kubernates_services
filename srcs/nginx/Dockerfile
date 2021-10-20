FROM alpine:3.7

RUN apk update
RUN apk upgrade

RUN apk add nginx openssl openssh supervisor bash

RUN mkdir -p /run/nginx
RUN mkdir -p /run/sshd

RUN chmod 755 /run/nginx
RUN chmod 755 /run/sshd

COPY ./srcs/nginx.conf /etc/nginx/conf.d/default.conf
COPY ./srcs/supervisord.conf /etc/supervisord.conf
COPY ./srcs/sshd_config /etc/ssh/sshd_config

#ssh
RUN adduser -D 'ajeanett'; echo "ajeanett:pass" | chpasswd

RUN /usr/bin/ssh-keygen -A

#ssl
RUN openssl req -x509 -nodes -days 31 -newkey rsa:2048 \
	-subj "/C=ru/ST=Kazan/L=Kazan/O=School21/OU=School21/CN=ajeanette/" \
	-keyout /etc/ssl/private/nginx-ajeanette.key -out /etc/ssl/certs/nginx-ajeanette.crt && \
	chmod -R 755 /etc/ssl/private/nginx-ajeanette*

EXPOSE 80 443 22

#вместо nginx запускать супервизор c ssh и nginx
CMD [ "/usr/bin/supervisord", "-c", "/etc/supervisord.conf" ]