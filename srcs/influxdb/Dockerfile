FROM alpine:3.12

RUN apk update
RUN apk upgrade

RUN apk add supervisor wget bash docker rsync
#influxdb

COPY ./srcs/start.sh .

RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.28-r0/glibc-2.28-r0.apk
RUN apk add glibc-2.28-r0.apk

RUN wget https://dl.influxdata.com/influxdb/releases/influxdb-1.8.3-static_linux_amd64.tar.gz
RUN tar xfz influxdb-1.8.3-static_linux_amd64.tar.gz
RUN mv /influxdb-1.8.3-1 /etc/influxdb

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.15.3_linux_amd64.tar.gz
RUN tar -xf telegraf-1.15.3_linux_amd64.tar.gz

RUN cp -r /telegraf-1.15.3/* /
RUN ./usr/bin/telegraf -sample-config --input-filter docker --output-filter influxdb > /etc/telegraf/telegraf.conf

COPY ./srcs/supervisord.conf /etc/supervisord.conf
#COPY ./srcs/telegraf.conf /etc/telegraf/
VOLUME [ "/var/lib/influxdb" ]

RUN chmod 777 start.sh

EXPOSE 8086

CMD ./start.sh
