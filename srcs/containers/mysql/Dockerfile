FROM alpine
RUN apk update && apk add --no-cache --upgrade bash && apk add mariadb mariadb-client && mkdir -p /run/mysqld/
RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
RUN mkdir -p /etc/telegraf
COPY wordpress.sql /tmp/
COPY telegraf.conf /etc/telegraf/telegraf.conf
COPY config.sh /config.sh
RUN chmod +x /config.sh
EXPOSE 3306
CMD ./config.sh