FROM alpine
RUN apk update && apk add wget php7 php7-fpm php7-mysqli php7-mbstring php7-json php7-session
RUN	wget https://wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz && rm latest.tar.gz
RUN mkdir -p /usr/share/
RUN mv /wordpress /usr/share/
RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
RUN mkdir -p /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf
COPY config.sh /config.sh
RUN chmod +x /config.sh
EXPOSE 5050
CMD ./config.sh