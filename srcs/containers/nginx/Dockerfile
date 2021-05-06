FROM alpine
RUN apk update
RUN apk add nginx openssl openssh && mkdir -p /run/nginx
RUN ssh-keygen -A
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=CA/ST=QC/O=42/CN=127.0.0.1" -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt
RUN ssh-keygen -A && echo "root:admin" | chpasswd
RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
RUN mkdir -p /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf
COPY sshd_config /etc/ssh/
COPY nginx.conf	/etc/nginx/
COPY index.html	/var/www/
COPY config.sh /config.sh
RUN chmod +x /config.sh
EXPOSE 80 443 22
CMD ./config.sh