FROM alpine:3.7

RUN apk update
RUN apk upgrade

RUN apk add nginx openssl vsftpd openrc bash

COPY ./srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf

RUN mkdir -p /var/log/

RUN adduser -D 'ajeanett'; echo "ajeanett:pass" | chpasswd

RUN echo 'root:root' | chpasswd

RUN echo "ajeanett" >> /etc/vsftpd/vsftp.userlist

RUN openssl req -x509 -nodes -days 90 -newkey rsa:2048 \
	-subj "/C=ru/ST=Kazan/L=Kazan/O=School21/OU=School21/CN=ajeanette/" \
	-keyout /etc/vsftpd/vsftpd.pem -out /etc/vsftpd/vsftpd.pem && \
	chmod -R 755 /etc/vsftpd/vsftpd*

EXPOSE 21

#RUN mkdir -p /var/ftp

ENTRYPOINT vsftpd /etc/vsftpd/vsftpd.conf
#CMD bash
#CMD [ "vsftpd" , "" ]
#./nginx_start.sh