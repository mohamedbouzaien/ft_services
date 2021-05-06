FROM alpine
RUN apk update && apk add bash openssl vsftpd
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=CA/ST=QC/O=42/CN=127.0.0.1" -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt
RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
RUN echo "root:admin" | chpasswd
COPY vsftpd.conf /etc/vsftpd/
COPY telegraf.conf /etc/telegraf/
COPY config.sh /config.sh
RUN chmod +x /config.sh
EXPOSE 21 30021
CMD ./config.sh