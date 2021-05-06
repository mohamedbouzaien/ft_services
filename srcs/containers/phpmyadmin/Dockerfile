FROM alpine
RUN apk update && apk add wget php7 php7-fpm php7-mysqli php7-mbstring php7-json php7-session
RUN	wget https://files.phpmyadmin.net/phpMyAdmin/4.9.5/phpMyAdmin-4.9.5-all-languages.tar.gz \
&& mkdir -p /var/www/phpmyadmin \
&& tar -xvf phpMyAdmin-4.9.5-all-languages.tar.gz --strip-components 1 -C /var/www/phpmyadmin \
&& rm -f phpMyAdmin-4.9.5-all-languages.tar.gz
COPY config.inc.php /var/www/phpmyadmin/
RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
RUN mkdir -p /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf
COPY config.sh /config.sh
RUN chmod +x /config.sh
EXPOSE 5000
CMD ./config.sh